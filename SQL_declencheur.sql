DROP TRIGGER verifier_dependances_tache_terminee;
CREATE OR REPLACE TRIGGER verifier_dependances_tache_terminee
BEFORE UPDATE ON Tache_en_cours
FOR EACH ROW
DECLARE
    v_exists NUMBER := 0;
BEGIN
    IF :NEW.statut LIKE 'terminé' THEN
        SELECT COUNT(*)
        INTO v_exists
        FROM Depend_de D
        WHERE D.ref_tache_1 = :OLD.ref_tache;
       
        IF v_exists != 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Erreur : Il vous manque des dépendances à réaliser pour terminer la tâche.');
        ELSE
            DELETE FROM Depend_de
            WHERE ref_tache_2 = :OLD.ref_tache;
        END IF;
    END IF;
END;
/

---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trig_definir_taches_associee
AFTER INSERT OR UPDATE ON Periodicite
FOR EACH ROW
DECLARE
    v_date_debut         TIMESTAMP;
    v_date_fin           TIMESTAMP;
    v_periode            INTERVAL DAY TO SECOND;
    v_ref_periodicite    NUMBER := :NEW.ref_periodicite;
    v_ref_tache_original NUMBER;
    v_intitule           Tache_en_cours.intitule%TYPE;
    v_description        Tache_en_cours.description%TYPE;
    v_priorite           Tache_en_cours.priorite%TYPE;
    v_url                Tache_en_cours.url%TYPE;
    v_date_d_echeance    Tache_en_cours.date_d_echeance%TYPE;
    v_statut             Tache_en_cours.statut%TYPE;
    v_nom_categorie      Tache_en_cours.nom_categorie%TYPE;
    v_ref_utilisateur    Tache_en_cours.ref_utilisateur%TYPE;
BEGIN
    -- Obtenir les variables
    SELECT p.date_debut, p.date_fin, p.periode, p.ref_tache_original,
           t.intitule, t.description, t.priorite, t.url, t.date_d_echeance, 
           t.statut, t.nom_categorie, t.ref_utilisateur
    INTO v_date_debut, v_date_fin, v_periode, v_ref_tache_original,
         v_intitule, v_description, v_priorite, v_url, v_date_d_echeance, 
         v_statut, v_nom_categorie, v_ref_utilisateur
    FROM Periodicite p
    LEFT JOIN Tache_en_cours t ON p.ref_periodicite = t.ref_periodicite
    WHERE p.ref_periodicite = v_ref_periodicite;

    -- Verifier si la date de fin etait insert ou update
    IF :NEW.date_fin IS NOT NULL AND :OLD.date_fin != :NEW.date_fin THEN
        FOR i IN 1..CEIL((v_date_fin - v_date_debut) / v_periode)
        LOOP
            -- Insert la nouvelle tache en Tache_en_cours
            INSERT INTO Tache_en_cours (
                ref_tache,
                intitule,
                description,
                priorite,
                url,
                date_d_echeance,
                statut,
                nom_categorie,
                ref_periodicite,
                ref_utilisateur,
                date_realisation
            ) VALUES (
                SEQ_TACHE_EN_COURS.NEXTVAL,
                v_intitule,
                v_description,
                v_priorite,
                v_url,
                v_date_debut + (i * v_periode -1),
                v_statut,
                v_nom_categorie,
                v_ref_periodicite,
                v_ref_utilisateur,
                NULL
            );

            -- Insert la dependence a Depend_de
            INSERT INTO Depend_de (ref_tache_1, ref_tache_2)
            VALUES (
                v_ref_tache_original        -- ref de la tache principal
                SEQ_TACHE_EN_COURS.CURRVAL,  -- ref de la tache associee
            );
        END LOOP;
END;
/

DROP TRIGGER trig_definir_taches_associee;

---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER calculer_score_tache_terminee
AFTER UPDATE ON Tache_en_cours
FOR EACH ROW
DECLARE
	v_score_tache INT;  
BEGIN
    IF :NEW.statut = 'terminé' THEN      
        --score du programme selon l'utilisateur assigné
        FOR usuario_rec IN (
            SELECT U.*, SCT.score AS score_programme
            FROM Est_assigne ea
            JOIN Utilisateur U ON ea.ref_utilisateur = U.ref_utilisateur
            JOIN Comporte C ON U.nom_programme = C.nom_programme
            JOIN Score_categorie_tache SCT ON C.ref_score_categorie_tache = SCT.ref_score_categorie_tache AND SCT.termine = 'V'
            WHERE ea.ref_tache = :OLD.ref_tache
            FOR UPDATE
        ) LOOP
            -- Mise a jour du score pour chaque utilisateur avec un programme asigné
            UPDATE Utilisateur
            SET 
                score = NVL(score, 0) + NVL(usuario_rec.score_programme, 0)
            WHERE ref_utilisateur = usuario_rec.ref_utilisateur;
        END LOOP;
             
        --score de finir une tache
        SELECT sct.score
        INTO v_score_tache
        FROM Score_categorie_tache sct
        WHERE sct.nom_categorie = :OLD.nom_categorie AND sct.termine = 'V';
        
        -- Mise a jour du score pour chaque utilisateur
       	UPDATE Utilisateur
        SET 
            score = NVL(score, 0) + NVL(v_score_tache, 0),
        	niveau_calcule = CEIL(LOG(2, (NVL(score, 0) + NVL(v_score_tache, 0) + 1) / 100))
        WHERE ref_utilisateur IN (
            SELECT U.ref_utilisateur
            FROM Est_assigne ea
            LEFT JOIN Utilisateur U ON ea.ref_utilisateur = U.ref_utilisateur
            WHERE ea.ref_tache = :OLD.ref_tache
        );
    END IF;
END;

DROP TRIGGER calculer_score_tache_terminee;
----------------------------------------------------------------------------------------------------------------------------

--Avant d'insérer l'utilisateur, on lui donne une ref_utilisateur et un login formatté
DROP TRIGGER before_insert_utilisateur;
CREATE OR REPLACE TRIGGER before_insert_utilisateur
BEFORE INSERT ON Utilisateur
FOR EACH ROW
DECLARE
    v_exists NUMBER := 0;
    compteur NUMBER := 1;
    v_login VARCHAR2(10);
BEGIN
    :new.ref_utilisateur := seq_utilisateur.nextval;

    v_login := LOWER(SUBSTR(:NEW.prenom, 1, 1) || SUBSTR(:NEW.nom, 1, 7)) || compteur;

    SELECT COUNT(*)
    INTO v_exists
    FROM Utilisateur
    WHERE login = v_login;

    WHILE v_exists > 0 LOOP
        compteur := compteur + 1;
        v_login := LOWER(SUBSTR(:NEW.prenom, 1, 1) || SUBSTR(:NEW.nom, 1, 7)) || compteur;

        SELECT COUNT(*)
        INTO v_exists
        FROM Utilisateur
        WHERE login = v_login;
    END LOOP;

    :NEW.login := v_login;
   	:NEW.date_d_inscription := SYSDATE;
END;

----------------------------------------------------------------------------------------------------------------------------

--Avant d'insérer l'score_catégorie_tâche
DROP TRIGGER before_insert_score_categorie_tache;
CREATE OR REPLACE TRIGGER before_insert_score_categorie_tache
BEFORE INSERT OR UPDATE ON Score_categorie_tache
FOR EACH ROW
DECLARE
    v_exists NUMBER := 0;
BEGIN
    IF :NEW.ref_score_categorie_tache IS NULL THEN
        SELECT COUNT(*) INTO v_exists
        FROM Score_categorie_tache
        WHERE nom_categorie = :NEW.nom_categorie;

        IF v_exists > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalide. Cette Categorie existe déjà.');
        END IF;

        :NEW.ref_score_categorie_tache := :NEW.nom_categorie || ' terminé';

        IF :NEW.score IS NULL THEN
            :NEW.score := 0;
        END IF;

        :NEW.termine := 'V';

        INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
        VALUES (:NEW.nom_categorie || ' non terminé', 'F', FLOOR(:NEW.score/2), :NEW.nom_categorie);
    END IF;
END;


----------------------------------------------------------------------------------------------------------------------------

--Avant insérer une tâche en cours
DROP TRIGGER before_insert_tache_en_cours;
CREATE OR REPLACE TRIGGER before_insert_tache_en_cours
BEFORE INSERT ON Tache_en_cours
FOR EACH ROW
DECLARE
	v_exists NUMBER := 0;
BEGIN
	SELECT COUNT(*) INTO v_exists
	FROM Score_categorie_tache
	WHERE nom_categorie = :NEW.nom_categorie;

	IF v_exists = 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'La catégorie n''existe pas. Vérifiez les catégories dans la table Score_categorie_tache.');
	END IF;

	:NEW.ref_tache := seq_tache.nextval;

	INSERT INTO Periodicite (ref_periodicite, date_debut) VALUES (:NEW.ref_tache, SYSTIMESTAMP);

	:NEW.ref_periodicite := :NEW.ref_tache;
	:NEW.statut := 'à faire';

	INSERT INTO Tache (ref_tache) VALUES (:NEW.ref_tache);
	INSERT INTO Est_assigne (ref_tache, ref_utilisateur) VALUES (:NEW.ref_tache, :NEW.ref_utilisateur);
END;


----------------------------------------------------------------------------------------------------------------------------

--Avant insérer dans Liste_tache
DROP TRIGGER before_insert_liste_tache;
CREATE OR REPLACE TRIGGER before_insert_liste_tache
BEFORE INSERT ON Liste_tache
FOR EACH ROW
DECLARE
	v_exists NUMBER := 0;
BEGIN
	SELECT COUNT(*) INTO v_exists
	FROM Score_categorie_tache
	WHERE nom_categorie = :NEW.nom_categorie;

	IF v_exists = 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'La catégorie n''existe pas. Vérifier les catégories dans le tableau ''Score_catégorie_tache''.');
	END IF;

	:NEW.ref_liste := seq_liste.nextval;
END;

----------------------------------------------------------------------------------------------------------------------------

--Avant insérer dans Contient
DROP TRIGGER before_insert_contient;
CREATE OR REPLACE TRIGGER before_insert_contient
BEFORE INSERT ON Contient
FOR EACH ROW
DECLARE
	v_exists NUMBER := 0;
BEGIN
	SELECT COUNT(*) INTO v_exists
	FROM Travaille
	WHERE nom_projet = :NEW.nom_projet;

	IF v_exists = 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Le projet n''existe pas. Vérifier les projets dans le tableau ''Travaille''.');
	END IF;
END;


----------------------------------------------------------------------------------------------------------------------------

DROP TRIGGER before_insert_comporte;
CREATE OR REPLACE TRIGGER before_insert_comporte
BEFORE INSERT ON Comporte
FOR EACH ROW
DECLARE
	v_exists_t NUMBER := 0;
	v_exists_nt NUMBER := 0;
BEGIN
	IF :NEW.ref_score_categorie_tache NOT LIKE '% non terminé' THEN
		SELECT COUNT(*)
		INTO v_exists_t
		FROM Score_categorie_tache SCT
		WHERE SCT.ref_score_categorie_tache = :NEW.ref_score_categorie_tache || ' terminé';

		SELECT COUNT(*)
		INTO v_exists_nt
		FROM Score_categorie_tache SCT
		WHERE SCT.ref_score_categorie_tache = :NEW.ref_score_categorie_tache || ' non terminé';
	
		IF v_exists_t != 0 AND v_exists_nt != 0 THEN
			INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES (:NEW.nom_programme,:NEW.ref_score_categorie_tache || ' non terminé');
			:NEW.ref_score_categorie_tache := :NEW.ref_score_categorie_tache || ' terminé';
		ELSE
			RAISE_APPLICATION_ERROR(-20001, 'La catégorie n''existe pas.');
		END IF;
	END IF;
END;


----------------------------------------------------------------------------------------------------------------------------


