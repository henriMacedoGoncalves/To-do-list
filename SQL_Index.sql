--Indices 
DROP INDEX idx_Utilisateur_pays;
DROP INDEX idx_Liste_tache_ref_utilisateur;
DROP INDEX idx_Tache_appartenant_a_liste_ref_liste;
DROP INDEX idx_Tache_appartenant_a_liste_ref_tache;

DROP INDEX idx_Comporte_ref;
DROP INDEX idx_Tache_fini_nom_categorie;
--DROP INDEX idx_Score_categorie_tache_ref_score_categorie;

DROP INDEX idx_Tache_fini_ref_utilisateur;
DROP INDEX idx_Tache_fini_ref_periodicite;
--DROP INDEX idx_Utilisateur_ref_utilisateur;
DROP INDEX idx_Est_assigne_ref_utilisateur;
--DROP INDEX idx_Tache_ref_tache;
--DROP INDEX idx_Tache_en_cours_ref_tache;
--DROP INDEX idx_Tache_fini_ref_tache;
--DROP INDEX idx_Periodicite_ref_periodicite;

DROP INDEX idx_Tache_ref_tache_dependence;

--DROP INDEX idx_Utilisateur_ref_utilisateur_est_assigne;
DROP INDEX idx_Tache_ref_tache_est_assigne;
DROP INDEX idx_Tache_fini_ref_tache_semaine_actuelle;
DROP INDEX idx_Tache_en_cours_ref_tache_semaine_actuelle;
DROP INDEX idx_Score_categorie_tache_nom_categorie;

-- Exo1
CREATE INDEX idx_Utilisateur_pays ON Utilisateur (pays);
CREATE INDEX idx_Liste_tache_ref_utilisateur ON Liste_tache (ref_utilisateur);
CREATE INDEX idx_Tache_appartenant_a_liste_ref_liste ON Tache_appartenant_a_liste (ref_liste);
CREATE INDEX idx_Tache_appartenant_a_liste_ref_tache ON Tache_appartenant_a_liste (ref_tache);

-- Exo2
CREATE INDEX idx_Comporte_ref ON Comporte (ref_score_categorie_tache);
CREATE INDEX idx_Tache_fini_nom_categorie ON Tache_fini (nom_categorie);
--CREATE INDEX idx_Score_categorie_tache_ref_score_categorie ON Score_categorie_tache (ref_score_categorie_tache);

-- Exo3
CREATE INDEX idx_Tache_fini_ref_utilisateur ON Tache_fini (ref_utilisateur);
CREATE INDEX idx_Tache_fini_ref_periodicite ON Tache_fini (ref_periodicite);
--CREATE INDEX idx_Utilisateur_ref_utilisateur ON Utilisateur (ref_utilisateur);
CREATE INDEX idx_Est_assigne_ref_utilisateur ON Est_assigne (ref_utilisateur);
--CREATE INDEX idx_Tache_ref_tache ON Tache (ref_tache);
--CREATE INDEX idx_Tache_en_cours_ref_tache ON Tache_en_cours (ref_tache);
--CREATE INDEX idx_Tache_fini_ref_tache ON Tache_fini (ref_tache);
--CREATE INDEX idx_Periodicite_ref_periodicite ON Periodicite (ref_periodicite);

-- Exo4
CREATE INDEX idx_Tache_ref_tache_dependence ON Depend_de (ref_tache_2);

-- Exo5
--CREATE INDEX idx_Utilisateur_ref_utilisateur_est_assigne ON Est_assigne (ref_utilisateur);
CREATE INDEX idx_Tache_ref_tache_est_assigne ON Est_assigne (ref_tache);
CREATE INDEX idx_Tache_fini_ref_tache_semaine_actuelle ON Tache_fini (date_realisation);
CREATE INDEX idx_Tache_en_cours_ref_tache_semaine_actuelle ON Tache_en_cours (date_realisation);
CREATE INDEX idx_Score_categorie_tache_nom_categorie ON Score_categorie_tache (nom_categorie);