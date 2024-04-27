
-- insertion des données dans la table fournisseurs
insert into fournisseur (ID, nom) values (1,'Francaise d Imports');
insert into fournisseur (ID, nom) values (2,'FDM SA');
insert into fournisseur (ID, nom) values (3,'Dubois et Flis');

-- insertion des données dans la table article
insert into article (ID, ref, designation, prix, id_fou) values (10,'F04','Fraises d’encastrement', 8.14, 2);

-- insertion des données dans la table bon 
insert into bon (ID, numero, date_cmde, delai, id_fou) values (3, 1,'25-05-2024', 3, 1);

-- insertion des données dans la table compo 
insert into compo (ID, qte, ID_art, ID_bon) values (3, 1, 7, 3);


-- MAJ de du prix dans la table article
ALTER TABLE article
MODIFY COLUMN prix DECIMAL(10, 2);


-- MAJ date_cmde de bon 
UPDATE bon
SET date_cmde = '2024-04-26'
WHERE ID = 3;