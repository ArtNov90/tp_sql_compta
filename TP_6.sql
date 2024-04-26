-- a 
UPDATE article
SET designation = LOWER(designation)
WHERE id = 2;

-- b 
UPDATE article
SET designation = UPPER(designation)
WHERE prix > 10;

-- c  
SET SQL_SAFE_UPDATES = 0;-- à utiliser une seule fois pour désactiver le mode "safe update

UPDATE article
SET prix = prix * 0.9
WHERE id NOT IN (
    SELECT DISTINCT id_art
    FROM compo
);

-- d 
UPDATE compo
JOIN bon ON compo.id_bon = bon.id
JOIN fournisseur ON bon.id_fou = fournisseur.id
SET compo.qte = compo.qte * 2
WHERE fournisseur.nom = 'française d''imports';

-- e
UPDATE article
SET designation = CONCAT(
    SUBSTRING(designation, 1, POSITION('(' IN designation) - 1),
    SUBSTRING(designation, POSITION(')' IN designation) + 1)
)
WHERE designation LIKE '%(%' AND designation LIKE '%)%';