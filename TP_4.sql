SELECT * FROM article;

SELECT * FROM article
WHERE prix >= 2;

SELECT * FROM article
WHERE prix >= 2 AND prix <= 6.25;

SELECT * FROM article
WHERE prix BETWEEN 2 AND 6.25;

SELECT ref, designation, prix
FROM article
WHERE prix NOT BETWEEN 2 AND 6.25
AND ID_FOU = 1
ORDER BY prix DESC;

SELECT ref, designation
FROM article
WHERE ID_FOU = 1 OR ID_FOU = 3 ;

SELECT ref, designation
FROM article
WHERE ref IN (ID_FOU=1, ID_FOU=2);

SELECT ref, designation
FROM article
WHERE ID_FOU NOT IN (ID_FOU=1, ID_FOU=2);

SELECT * FROM bon
WHERE date_cmde BETWEEN '2019-02-01' AND '2025-04-30';