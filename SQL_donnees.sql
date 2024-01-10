-- erreur: check contrainte pour le mot de passe non respecté
--insert into Utilisateur (mot_de_passe nom, prenom, adresse, pays, date_de_naissance) values ('nN3!RzmdUU', 4996085101, 'Gillmore', 'Chrystal', '3 Oakridge Plaza', 'Saudi Arabia',DATE '1992-04-17');
DELETE FROM Comporte;
DELETE FROM Tache_fini;
DELETE FROM Tache_en_cours;
DELETE FROM Depend_de;
DELETE FROM Est_assigne;
DELETE FROM Tache_appartenant_a_liste;
DELETE FROM Contient;
DELETE FROM Liste_tache;
DELETE FROM Travaille;
DELETE FROM Periodicite;
DELETE FROM Tache;
DELETE FROM Score_categorie_tache;
DELETE FROM Utilisateur;
DROP SEQUENCE seq_tache;
DROP SEQUENCE seq_utilisateur;
DROP SEQUENCE seq_liste;

CREATE SEQUENCE seq_liste START WITH 1 INCREMENT BY 1;
create sequence seq_utilisateur start with 1 increment by 1;
create sequence seq_tache start with 1 increment by 1;

-- INSERTION SCORE CATEGORIE TACHE
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (20, 'Catégorie A');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (15, 'Catégorie B');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (10, 'Catégorie C');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (3, 'Cat_Programme1');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (4, 'Cat_Programme2');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (6, 'Cat_Programme3');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (8, 'Cat_Programme4');
INSERT INTO Score_categorie_tache (score, nom_categorie) VALUES (10, 'Cat_Programme5');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('BDD1');
INSERT INTO Score_categorie_tache (score,nom_categorie) VALUES (5,'BDD2');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Reseaux');
INSERT INTO Score_categorie_tache (score,nom_categorie) VALUES (10,'ASE');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Arith et Crypto');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Math elem.');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Analyse2');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Graphes');
INSERT INTO Score_categorie_tache (nom_categorie) VALUES ('Informatique-Economie');

--INSERTION UTILISATEURS
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse1', 'Dupont', 'Jean', '123 Rue A', 'France', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Programme4');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse2', 'Martin', 'Sophie', '456 Rue B', 'Canada', TO_DATE('1985-08-21', 'YYYY-MM-DD'), 'Programme1');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse3', 'Leclerc', 'Pierre', '789 Rue C', 'Belgium', TO_DATE('1993-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse4', 'Dubois', 'Marie', '101 Rue D', 'Germany', TO_DATE('1988-11-28', 'YYYY-MM-DD'), 'Programme4');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse5', 'Lefevre', 'Julie', '202 Rue E', 'Italy', TO_DATE('1995-04-03', 'YYYY-MM-DD'), NULL);
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse6', 'Roux', 'Thomas', '303 Rue F', 'Spain', TO_DATE('1991-09-17', 'YYYY-MM-DD'), 'Programme3');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse7', 'Girard', 'Catherine', '404 Rue G', 'Portugal', TO_DATE('1987-07-08', 'YYYY-MM-DD'), NULL);
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse8', 'Moreau', 'Nicolas', '505 Rue H', 'Switzerland', TO_DATE('1994-12-22', 'YYYY-MM-DD'), 'Programme5');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse9', 'Fournier', 'Isabelle', '606 Rue I', 'Netherlands', TO_DATE('1989-06-14', 'YYYY-MM-DD'), 'Programme2');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse10', 'Caron', 'Luc', '707 Rue J', 'Austria', TO_DATE('1992-03-07', 'YYYY-MM-DD'), NULL);
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse11', 'Gagnon', 'Marcel', '808 Rue K', 'Poland', TO_DATE('1986-10-30', 'YYYY-MM-DD'), 'Programme2');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse12', 'Lavoie', 'Nathalie', '909 Rue L', 'Sweden', TO_DATE('1997-01-18', 'YYYY-MM-DD'), 'Programme4');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse13', 'Lemieux', 'Sylvie', '111 Rue M', 'Norway', TO_DATE('1984-04-26', 'YYYY-MM-DD'), NULL);
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse14', 'Bergeron', 'Michel', '222 Rue N', 'Denmark', TO_DATE('1996-08-09', 'YYYY-MM-DD'), 'Programme1');
INSERT INTO Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance, nom_programme) VALUES ('MotDePasse15', 'Roy', 'Caroline', '333 Rue O', 'Finland', TO_DATE('1983-12-03', 'YYYY-MM-DD'), NULL);
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('nE4xF','Buston', 'Dyane', '2 Stephen Plaza', 'France',DATE '1980-10-25');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('gD1WGnvX', 'Ebenezer', 'Dacey', '42765 Muir Pass', 'France',DATE '1910-02-10');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('xM6h_z2E', 'Casburn', 'Ebony', '7986 Prairieview Plaza', 'France',DATE '1962-10-04');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('zT9V8I6T', 'Esberger', 'Renell', '23457 Hanover Lane', 'France',DATE '1972-10-08');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('eO6_KkQAzTKn', 'Lochhead', 'Jacki', '0 Goodland Place', 'France',DATE '1916-09-09');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('rB2fmbf2hfV', 'Birchett', 'Tomasina', '84 Lien Alley', 'France',DATE '1903-02-19');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('hM1Jhg38', 'Anthoin', 'Shaylynn', '144 Shasta Park', 'France',DATE '2017-06-11');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('sK9EvIfqsv', 'Adshede', 'Mikaela', '642 Dorton Hill', 'Portugal',DATE '1981-12-14');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('wH2l_g6LH', 'Outhwaite', 'Sylvia', '9 8th Center', 'France',DATE '2016-05-21');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('gZ7Gkzweef3', 'Stivey', 'Annmarie', '15 Lake View Circle', 'France',DATE '2016-09-16');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('kZ9sNZs', 'McGeouch', 'Benedikt', '7902 Talmadge Drive', 'Indonesia',DATE '2021-10-16');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('oF8VJ7EPtH6p', 'Gimblet', 'Keelia', '23527 Spenser Drive', 'China',DATE '1926-03-23');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('sR4ftDQ', 'Okenden', 'Elliot', '16 Bayside Lane', 'China',DATE '1937-11-03');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('xM6FyTNdUh9', 'Benning', 'Kaile', '04 Elka Trail', 'Portugal',DATE '1986-11-12');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('jF4yUqA', 'Stonham', 'Philippa', '23 Bay Place', 'China',DATE '1954-01-16');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('wM6cpt', 'Latimer', 'Sonia', '57287 Ludington Park', 'Russia',DATE '1983-07-25');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('qP8O1lWp', 'McFfaden', 'Jerrylee', '22834 Washington Alley', 'Philippines',DATE '1980-12-27');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('eK1hVhI', 'Denizet', 'Zach', '4866 Vera Court', 'Slovenia',DATE '1985-09-03');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('nG0VNBApa', 'Puddan', 'Florinda', '7402 Claremont Pass', 'Egypt',DATE '1923-08-31');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('zF2pZpbz2', 'McCrackem', 'Koenraad', '327 Declaration Way', 'Ukraine',DATE '1997-03-07');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('lA2R0C2', 'Povlsen', 'Darell', '42117 Ludington Street', 'United States',DATE '1996-12-24');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('aF92LVTDk', 'Bloxsome', 'Mathe', '798 Debs Terrace', 'Indonesia',DATE '1933-09-09');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('oT0c3p', 'Cleminshaw', 'Maybelle', '5888 Sycamore Hill', 'China',DATE '1991-09-14');
insert into Utilisateur (mot_de_passe, nom, prenom, adresse, pays, date_de_naissance) values ('tS8cjp', 'Fussen', 'Edgardo', '1 Linden Place', 'Iran',DATE '1950-01-22');

-- INSERTION TRAVAILLEINSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetA', 9);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetA', 10);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetA', 8);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetB', 11);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetB', 12);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetB', 6);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetC', 13);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetC', 14);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetC', 7);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetD', 15);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetD', 3);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('ProjetD', 5);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',1);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',2);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',3);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',4);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',5);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',6);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',7);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',8);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',9);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 3 Informatique',10);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',11);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',12);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',13);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',14);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',15);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',16);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',17);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',18);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',19);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 2 Informatique',20);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 1 Informatique',21);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 1 Informatique',22);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Licence 1 Informatique',23);

--INSERTION LISTE_TACHE
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie A', 5);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie B', 11);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie C', 13);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie A', 9);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie B', 10);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Catégorie C', 15);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('BDD2',1);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('ASE',1);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('Analyse2',2);
INSERT INTO Liste_tache (nom_categorie, ref_utilisateur) VALUES ('BDD1',2);

--INSERTION CONTIENT
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetA', 4);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetA', 5);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetB', 2);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetC', 3);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetD', 1);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('ProjetD', 6);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Licence 3 Informatique',1);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Licence 3 Informatique',2);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Licence 2 Informatique',3);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Licence 2 Informatique',4);

--INSERTION TACHE_EN_COURS
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 1', 'Description de la tâche 1', 3, 'http://url1.com', TO_TIMESTAMP('2024-02-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 1);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 2', 'Description de la tâche 2', 2, 'http://url2.com', TO_TIMESTAMP('2024-02-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 2);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 3', 'Description de la tâche 3', 1, 'http://url3.com', TO_TIMESTAMP('2024-02-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 3);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 4', 'Description de la tâche 4', 2, 'http://url4.com', TO_TIMESTAMP('2024-02-15 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 4);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 5', 'Description de la tâche 5', 3, 'http://url5.com', TO_TIMESTAMP('2024-02-20 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 5);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 6', 'Description de la tâche 6', 1, 'http://url6.com', TO_TIMESTAMP('2024-02-25 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 6);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 7', 'Description de la tâche 7', 2, 'http://url7.com', TO_TIMESTAMP('2024-03-01 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 7);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 8', 'Description de la tâche 8', 3, 'http://url8.com', TO_TIMESTAMP('2024-03-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 8);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 9', 'Description de la tâche 9', 1, 'http://url9.com', TO_TIMESTAMP('2024-03-10 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 9);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 10', 'Description de la tâche 10', 2, 'http://url10.com', TO_TIMESTAMP('2024-03-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 10);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 11', 'Description de la tâche 11', 3, 'http://url11.com', TO_TIMESTAMP('2024-03-20 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 11);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 12', 'Description de la tâche 12', 1, 'http://url12.com', TO_TIMESTAMP('2024-03-25 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 12);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 13', 'Description de la tâche 13', 2, NULL, TO_TIMESTAMP('2024-03-30 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 13);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 14', 'Description de la tâche 14', 3, 'http://url14.com', TO_TIMESTAMP('2024-04-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 14);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 15', 'Description de la tâche 15', 1, 'http://url15.com', TO_TIMESTAMP('2024-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 15);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 16', 'Description de la tâche 16', 2, 'http://url16.com', TO_TIMESTAMP('2024-04-10 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 1);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 17', 'Description de la tâche 17', 3, 'http://url17.com', TO_TIMESTAMP('2024-04-15 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 2);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 18', 'Description de la tâche 18', 1, 'http://url18.com', TO_TIMESTAMP('2024-04-20 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 3);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 19', 'Description de la tâche 19', 2, NULL, TO_TIMESTAMP('2024-04-25 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 4);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 20', 'Description de la tâche 20', 3, 'http://url20.com', TO_TIMESTAMP('2024-04-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 5);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 21', 'Description de la tâche 21', 1, 'http://url21.com', TO_TIMESTAMP('2024-05-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 6);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 22', 'Description de la tâche 22', 2, 'http://url22.com', TO_TIMESTAMP('2024-05-10 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 7);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 13', 'Description de la tâche 23', 2, 'http://url13.com', TO_TIMESTAMP('2024-03-30 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 13);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 14', 'Description de la tâche 24', 3, 'http://url14.com', TO_TIMESTAMP('2024-04-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 14);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 15', 'Description de la tâche 25', 1, 'http://url15.com', TO_TIMESTAMP('2024-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 15);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 16', 'Description de la tâche 26', 2, 'http://url16.com', TO_TIMESTAMP('2024-04-10 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 1);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 17', 'Description de la tâche 27', 3, 'http://url17.com', TO_TIMESTAMP('2024-04-15 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 2);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 18', 'Description de la tâche 28', 1, 'http://url18.com', TO_TIMESTAMP('2024-04-20 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie C', 3);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 19', 'Description de la tâche 29', 2, 'http://url19.com', TO_TIMESTAMP('2024-04-25 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie A', 4);
INSERT INTO Tache_en_cours (intitule, description, priorite, url, date_d_echeance, statut, nom_categorie, ref_utilisateur) VALUES ('Tâche 20', 'Description de la tâche 30', 3, 'http://url20.com', TO_TIMESTAMP('2024-04-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'à faire', 'Catégorie B', 5);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Terminer projet BDD','Il manque les données de tests','BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('La base projet BDD','Les insertions nécessite le bon fonctionnement.','BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Declencheur projet BDD','Pour avant et apres insertion','BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Requetes projet BDD','Pour la premiere partie','BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,date_d_echeance,nom_categorie,ref_utilisateur) VALUES ('Rendre projet BDD','',TO_TIMESTAMP('2024-01-07','YYYY-MM-DD'),'BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Reviser BDD','Ca fait pas du mal','BDD2',1);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Terminer projet BDD','Il manque les données de tests','BDD2',2);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('La base projet BDD','Les insertions nécessite le bon fonctionnement.','BDD2',2);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Declencheur projet BDD','Pour avant et apres insertion','BDD2',2);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Requetes projet BDD','Pour la premiere partie','BDD2',2);
INSERT INTO Tache_en_cours (intitule,description,nom_categorie,ref_utilisateur) VALUES ('Reviser BDD','Ca fait pas du mal','BDD2',2);

--INSERTION EST ASSIGNE
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (1,2);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (3,4);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (5,4);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (5,9);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (5,3);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (3,9);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (4,5);

--INSERTION TACHE APPARTENANT A LISTE
INSERT INTO Tache_appartenant_a_liste (ref_tache, ref_liste) VALUES (1,1);
INSERT INTO Tache_appartenant_a_liste (ref_tache, ref_liste) VALUES (2,1);
INSERT INTO Tache_appartenant_a_liste (ref_tache, ref_liste) VALUES (3,1);
INSERT INTO Tache_appartenant_a_liste (ref_tache, ref_liste) VALUES (4,1);
INSERT INTO Tache_appartenant_a_liste (ref_tache, ref_liste) VALUES (5,1);

--INSERTION DEPEND DE
INSERT INTO Depend_de VALUES (1,5);
INSERT INTO Depend_de VALUES (2,5);
INSERT INTO Depend_de VALUES (3,5);
INSERT INTO Depend_de VALUES (4,5);
INSERT INTO Depend_de VALUES (10,4);
INSERT INTO Depend_de VALUES (10,6);
INSERT INTO Depend_de VALUES (10,9);
INSERT INTO Depend_de VALUES (12,10);
INSERT INTO Depend_de VALUES (7,20);


SELECT COUNT(*)
FROM Depend_de D
LEFT JOIN Tache_en_cours TC ON D.ref_tache_2 = TC.ref_tache
WHERE ref_tache_1 = 1
AND TC.statut = 'Terminé';

--INSERTION COMPORTE
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','BDD1');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','BDD2');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','Arith et Crypto');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','Analyse2');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','ASE');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','Math elem.');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','Graphes');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome Informatique','Reseaux');
INSERT INTO Comporte (nom_programme,ref_score_categorie_tache) VALUES ('Diplome CMI','Informatique-Economie');


SELECT COUNT(*)
        FROM Depend_de D
        JOIN Tache_en_cours TC ON D.ref_tache_2 = TC.ref_tache
        WHERE D.ref_tache_1 = 1
        AND TC.statut NOT LIKE 'terminé';
        

