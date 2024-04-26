-- 1) a
SELECT ref, designation
FROM article
ORDER BY designation ASC;
--  b
SELECT ref, designation
FROM article
ORDER BY prix DESC;
-- c
SELECT ref, designation, prix
FROM article
WHERE designation LIKE  '%Boulon%'
ORDER BY prix ASC;

-- d 
SELECT ref, designation
FROM article
WHERE designation LIKE '%sachet%';

-- e
SELECT ref, designation
FROM article
WHERE UPPER(designation) LIKE '%SACHET%';

-- f
SELECT article.id, article.ref, article.designation, article.prix, fournisseur.nom AS fournisseur
FROM article 
JOIN fournisseur ON article.id_fou = fournisseur.id
ORDER BY fournisseur.nom ASC, article.prix DESC;

-- g
SELECT article.id, article.ref, article.designation, article.prix
FROM article 
JOIN fournisseur ON article.id_fou = fournisseur.id
WHERE fournisseur.nom = 'Dubois & Fils';

-- h
SELECT AVG(prix) AS moyenne_prix
FROM article 
JOIN fournisseur ON a.id_fou = fournisseur.id
WHERE fournisseur.nom = 'Dubois & Fils';

-- i
SELECT fournisseur.nom AS fournisseur, AVG(a.prix) AS moyenne_prix
FROM article 
JOIN fournisseur ON a.id_fou = fournisseur.id
GROUP BY fournisseur.nom;

-- j
SELECT *
FROM bon
WHERE date_cmde BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 12:00:00';

-- k
SELECT DISTINCT bon.*
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
WHERE article.designation LIKE '%boulon%';

-- l
SELECT DISTINCT bon.*, fournisseur.nom AS nom_fournisseur
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
JOIN fournisseur ON article.id_fou = fournisseur.id
WHERE article.designation LIKE '%boulon%';

-- m
SELECT bon.id AS id_bon, SUM(article.prix * compo.qte) AS prix_total
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
GROUP BY bon.id;

-- n
SELECT bon.id AS id_bon, COUNT(compo.id_art) AS nombre_articles
FROM bon 
JOIN compo ON bon.id = compo.id_bon
GROUP BY bon.id;

-- o
SELECT bon.id AS id_bon, COUNT(compo.id_art) AS nombre_articles
FROM bon 
JOIN compo ON bon.id = compo.id_bon
GROUP BY bon.id
HAVING COUNT(compo.id_art) > 25;

-- p 
SELECT SUM(article.prix * compo.qte) AS cout_total
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
WHERE MONTH(bon.date_cmde) = 4 AND YEAR(bon.date_cmde) = YEAR(CURDATE());

-- 2) a 
SELECT DISTINCT a1.id, a1.ref, a1.designation, a1.prix, a1.id_fou AS fournisseur_id_1, f1.nom AS fournisseur_1,
                a2.id_fou AS fournisseur_id_2, f2.nom AS fournisseur_2
FROM article a1
JOIN article a2 ON a1.designation = a2.designation AND a1.id <> a2.id
JOIN fournisseur f1 ON a1.id_fou = f1.id
JOIN fournisseur f2 ON a2.id_fou = f2.id
WHERE a1.id_fou <> a2.id_fou;

-- b
SELECT YEAR(bon.date_cmde) AS annee, MONTH(bon.date_cmde) AS mois, SUM(article.prix * compo.qte) AS depenses
FROM bon 
JOIN compo  ON bon.id = compo.id_bon
JOIN article  ON compo.id_art = article.id
GROUP BY YEAR(bon.date_cmde), MONTH(bon.date_cmde)
ORDER BY YEAR(bon.date_cmde), MONTH(bon.date_cmde);

-- c
SELECT *
FROM bon 
WHERE NOT EXISTS (
    SELECT 1
    FROM compo 
    WHERE bon.id = compo.id_bon
);

-- d 
SELECT fournisseur.nom AS fournisseur, AVG(prix_total) AS prix_moyen
FROM (
    SELECT BON.id AS id_bon, SUM(ARTICLE.prix * COMPO.qte) AS prix_total
    FROM BON
    JOIN COMPO ON BON.id = COMPO.id_bon
    JOIN ARTICLE ON COMPO.id_art = ARTICLE.id
    GROUP BY BON.id
) AS prix_bon
JOIN BON ON prix_bon.id_bon = BON.id
JOIN FOURNISSEUR ON BON.id_fou = FOURNISSEUR.id
GROUP BY FOURNISSEUR.nom;