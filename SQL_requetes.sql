
--1)Les listes de tâches ayant au moins 5 tâches et appartenant à des utilisateurs habitant en France.
SELECT LT.ref_liste
FROM Liste_tache LT
JOIN Tache_appartenant_a_liste TL ON LT.ref_liste = TL.ref_liste
JOIN Utilisateur U ON LT.ref_utilisateur = U.ref_utilisateur
WHERE U.pays = 'France'
GROUP BY LT.ref_liste
HAVING COUNT(TL.ref_tache) >= 5;

--2) Les programmes de tâche ayant le plus de points positifs (somme des points) associés aux tâches terminées
SELECT C.nom_programme, SUM(SCT.score) AS total_points
FROM Comporte C
JOIN Utilisateur U ON C.nom_programme = U.nom_programme
JOIN Est_assigne EA ON U.ref_utilisateur = EA.ref_utilisateur
JOIN Tache_en_cours TC ON EA.ref_tache = TC.ref_tache AND TC.statut = 'termine'
JOIN Tache_fini TF ON EA.ref_tache = TF.ref_tache AND TF.statut = 'termine'
LEFT JOIN Score_categorie_tache SCT ON C.ref_score_categorie_tache = SCT.ref_score_categorie_tache
    AND SCT.termine LIKE 'V' AND SCT.score > 0
GROUP BY C.nom_programme
ORDER BY total_points DESC;

--3)Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de tâches
--total (périodique et non-périodique) et son nombre de tâches périodiques total.
SELECT
    U.login, U.nom, U.prenom, U.adresse,
    COUNT(T.ref_tache) AS total_taches,
    COUNT(DISTINCT CASE WHEN P.periode IS NOT NULL THEN T.ref_tache END) AS total_taches_periodiques
FROM Utilisateur U
JOIN Est_assigne EA ON U.ref_utilisateur = EA.ref_utilisateur
JOIN Tache T ON EA.ref_tache = T.ref_tache
LEFT JOIN Tache_en_cours TC ON T.ref_tache = TC.ref_tache
LEFT JOIN Tache_fini TF ON T.ref_tache = TF.ref_tache
LEFT JOIN Periodicite P ON TC.ref_periodicite = P.ref_periodicite OR TF.ref_periodicite = P.ref_periodicite
GROUP BY
    U.login, U.nom, U.prenom, U.adresse;
--4)Pour chaque tâche, le nombre de dépendance à effectuer avant que la tâche puisse être réalisée.
SELECT 
    T.ref_tache AS id_tache,
    COUNT(DISTINCT DD.ref_tache_2) AS nombre_dependances
FROM Tache T
JOIN Depend_de DD ON T.ref_tache = DD.ref_tache_1
GROUP BY T.ref_tache
ORDER BY id_tache;

--5)Les 10 utilisateurs ayant gagné le plus de points sur leur score au cours de la semaine courante.
SELECT U.login, U.nom, U.prenom, 
       SUM(SCT.score) + SUM(SCT_P.score) AS total_points_gagnes
FROM Utilisateur U
JOIN Est_assigne EA ON U.ref_utilisateur = EA.ref_utilisateur
JOIN Tache_en_cours TC ON EA.ref_tache = TC.ref_tache AND TC.statut = 'termine'
LEFT JOIN Score_categorie_tache SCT ON TC.nom_categorie = SCT.nom_categorie AND SCT.termine = 'V'
LEFT JOIN Comporte C ON U.nom_programme = C.nom_programme AND U.nom_programme IS NOT NULL
LEFT JOIN Score_categorie_tache SCT_P ON C.ref_score_categorie_tache = SCT_P.ref_score_categorie_tache 
    AND SCT_P.termine = 'V'
WHERE (TC.date_realisation >= TRUNC(SYSDATE, 'IW') AND TC.date_realisation < TRUNC(SYSDATE, 'IW') + 7)
GROUP BY U.login, U.nom, U.prenom
ORDER BY total_points_gagnes DESC
FETCH FIRST 10 ROWS ONLY;


