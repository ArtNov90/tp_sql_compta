SET SQL_SAFE_UPDATES = 0;-- à utiliser une seule fois pour désactiver le mode "safe update
-- a
DELETE compo
FROM compo
JOIN bon ON compo.id_bon = bon.id
WHERE bon.date_cmde >= '2019-04-01' AND bon.date_cmde < '2019-05-01';
-- b
DELETE FROM bon
WHERE DATE_FORMAT(date_cmde, '%Y-%m') = '2019-04';


