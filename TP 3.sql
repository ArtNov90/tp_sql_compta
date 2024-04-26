insert into article (ID, ref, designation, prix, id_fou) values (10,'F04','Fraises d’encastrement', 8.14, 2);


insert into bon (ID, numero, date_cmde, delai, id_fou) values (3, 1,'25-05-2024', 3, 1);


insert into compo (ID, qte, ID_art, ID_bon) values (3, 1, 7, 3);

insert into fournisseur (ID, nom) values (1,'Francaise d Imports');
insert into fournisseur (ID, nom) values (2,'FDM SA');
insert into fournisseur (ID, nom) values (3,'Dubois et Flis');

ALTER TABLE article
MODIFY COLUMN prix DECIMAL(10, 2);



UPDATE bon
SET date_cmde = '2024-04-26'
WHERE ID = 3;