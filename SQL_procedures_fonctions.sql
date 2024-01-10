-- Définir une fonction qui calcule le nombre de point gagné/perdu (pour les utilisateurs
-- ayant un programme de score, en fonction du nombre de tâche terminée/non terminée)
-- au cours de la semaine.

DROP FUNCTION calculerScoreSemaine;
CREATE OR REPLACE FUNCTION calculerScoreSemaine() RETURN NUMBER IS
	v_total_points NUMBER := 0;

	v_nb_taches_terminees NUMBER := 0;
	v_nb_taches_non_terminees NUMBER := 0;
	v_nb_total_taches_terminees NUMBER := 0;
	v_nb_total_taches_non_terminees NUMBER := 0;
	v_score_a_ajouter NUMBER := 0;
	v_score_a_retirer NUMBER := 0;
	v_categorie VARCHAR(255);
BEGIN
	
	FOR v_utilisateur IN (SELECT * FROM Utilisateur)
	IF v_ref_utilisateur.nom_programme IS NOT NULL THEN
			
			FOR v_ref_sct IN (SELECT ref_score_categorie_tache FROM Comporte WHERE nom_programme = v_utilisateur.nom_programme )
			LOOP	
				
				v_nb_total_taches_terminees := 0;
				v_nb_total_taches_non_terminees := 0;
				
				SELECT nom_categorie INTO v_categorie
				FROM Score_categorie_tache SCT
				WHERE SCT.ref_score_categorie_tache = v_ref_sct;
				
				SELECT Score INTO v_score_a_ajouter
				FROM Score_categorie_tache SCT
				WHERE SCT.ref_score_categorie_tache = v_ref_sct
				AND Termine = 'V';
			
				SELECT Score INTO v_score_a_retirer
				FROM Score_categorie_tache SCT
				WHERE SCT.ref_score_categorie_tache = v_ref_sct
				AND Termine = 'F';
			
				SELECT COUNT(*) INTO v_nb_taches_terminees
				FROM Tache_fini
				WHERE date_d_realisation BETWEEN TRUNC(SYSTIMESTAMP,'IW') AND TRUNC(SYSTIMESTAMP,'IW') + INTERVAL '6' DAY
				AND nom_categorie = v_categorie;
			
				v_nb_total_taches_terminees := v_nb_total_taches_terminees + v_nb_taches_terminees;			
				
				SELECT COUNT(*) INTO v_nb_taches_terminees
				FROM Tache_en_cours
				WHERE date_d_realisation BETWEEN TRUNC(SYSTIMESTAMP,'IW') AND TRUNC(SYSTIMESTAMP,'IW') + INTERVAL '6' DAY
				AND nom_categorie = v_categorie;

				v_nb_total_taches_terminees := v_nb_total_taches_terminees + v_nb_taches_terminees;			

				SELECT COUNT(*) INTO v_nb_taches_non_terminees
				FROM Tache_en_cours
				WHERE date_d_echeance > TRUNC(SYSTIMESTAMP,'IW')
				AND nom_categorie = v_categorie;
			
				v_nb_total_taches_non_terminees := v_nb_total_taches_non_terminees + v_nb_taches_non_terminees;
			
				v_total_points := v_total_points + (v_nb_total_taches_terminees * v_score_a_ajouter) - (v_nb_total_taches_non_terminees * v_score_a_retirer);
				
			END LOOP;
		
		END IF;
		
	END LOOP;
	
	RETURN v_total_points;
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------

-- On supposera que la procédure est exécutée chaque semaine (le lundi, à 8h). Définir
-- une procédure qui archive toutes les tâches passées.

BEGIN
  DBMS_SCHEDULER.create_job(
    job_name        => 'job_majTachesPassees',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN majTachesPassees; END;',
    start_date      => TRUNC(SYSDATE) + INTERVAL '6' DAY + INTERVAL '8' HOUR,
    repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=8; BYMINUTE=0; BYSECOND=0;',
    enabled         => TRUE,
    comments        => 'Executer la procédure chaque semaine le lundi à 8h.'
  );
END;
/

DROP PROCEDURE majTachesPassees;

CREATE OR REPLACE PROCEDURE majTachesPassees IS
BEGIN
    FOR tache_row IN (SELECT * FROM Tache_en_cours)
    LOOP
        IF tache_row.date_realisation IS NULL AND tache_row.date_d_echeance < CURRENT_DATE THEN
            UPDATE Tache_en_cours TC
            SET TC.statut = 'expiré'
            WHERE TC.ref_tache = tache_row.ref_tache;

            COMMIT;
        END IF;
       
		IF tache_row.statut NOT LIKE 'à faire' THEN
			INSERT INTO Tache_fini
			SELECT *
			FROM Tache_en_cours
			WHERE ref_tache = tache_row.ref_tache;

			COMMIT;

			DELETE FROM Tache_en_cours
			WHERE ref_tache = tache_row.ref_tache;

			COMMIT;
		END IF;
    END LOOP;
END;
/

BEGIN
    majTachesPassees;
END;
/


-- Ecrire le code PL/SQL permettant de générer des suggestions pour un utilisateur, c’est
-- dire N tâches qu’il pourrait ajouter à sa liste de tâche. Les tâches suggérées seront les N
-- tâches apparaissant le plus grand nombre de fois dans les tâches des utilisateurs
-- similaires. Les utilisateurs similaires sont les utilisateurs ayant au moins X tâches
-- similaires avec l’utilisateur pour lequel effectuer les suggestions. Des tâches similaires
-- sont des tâches ayant au moins Y mots communs (dans les mots communs, on ne
-- compte pas les mots vides/stop words comme les articles ou les verbes peu significatifs
-- type faire ou avoir).