CREATE TABLE article (
    id INT PRIMARY KEY,
    ref VARCHAR(50),
    designation VARCHAR(250),
    prix DECIMAL(10, 2),
    id_fou INT,
    FOREIGN KEY (id_fou) REFERENCES fournisseur(id) -- assure la contrainte de clé étrangère
);

CREATE TABLE fournisseur (
    id INT PRIMARY KEY,
    nom VARCHAR(250)
);

CREATE TABLE bon (
    id INT PRIMARY KEY,
    numero VARCHAR(50),
    date_cmde DATE,
    delai INT,
    id_fou INT,
    FOREIGN KEY (id_fou) REFERENCES fournisseur(id) -- assure la contrainte de clé étrangère
);

CREATE TABLE compo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    qte INT,
    id_art INT,
    id_bon INT,
    FOREIGN KEY (id_art) REFERENCES article(id), -- assure la contrainte de clé étrangère
    FOREIGN KEY (id_bon) REFERENCES bon(id) -- assure la contrainte de clé étrangère
);