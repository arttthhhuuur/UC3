CREATE TABLE Personagem (
    ID_Personagens INT PRIMARY KEY NOT NULL,
    Nome_Personagen VARCHAR(50) NOT NULL,
    Etnia VARCHAR(50) NOT NULL,
    Genero VARCHAR(50) NOT NULL
);

CREATE TABLE Tratamento (
    ID_Tratamento INT PRIMARY KEY,
    Tratamento_Nome VARCHAR(50) NOT NULL,
    Fases_Tratamento VARCHAR(100) NOT NULL
);

CREATE TABLE Familia (
    ID_Familia INT PRIMARY KEY NOT NULL,
    Membro VARCHAR(20) NOT NULL,
    Nome_Familia VARCHAR(50) NOT NULL
);

CREATE TABLE Contexto_Sociocultural (
    ID_Contexto_Sociocultural INT PRIMARY KEY NOT NULL,
    Tipo_de_Identidade VARCHAR(50) NOT NULL,
    Fator_Social VARCHAR(50) NOT NULL,
    Classe_Social VARCHAR(50) NOT NULL,
    Regiao VARCHAR(50) NOT NULL,
    fk_Personagem_ID_Personagens INT,
    fk_Familia_ID_Familia INT
);

CREATE TABLE Membro_Familha_Tem (
    Relacao VARCHAR(50) NOT NULL,
    Especializacao VARCHAR(50) NOT NULL,
    fk_Personagem_ID_Personagens INT,
    fk_Familia_ID_Familia INT
);

CREATE TABLE Faz (
    fk_Tratamento_ID_Tratamento INT,
    fk_Personagem_ID_Personagens INT
);
 
ALTER TABLE Contexto_Sociocultural ADD CONSTRAINT FK_Contexto_Sociocultural_2
    FOREIGN KEY (fk_Personagem_ID_Personagens)
    REFERENCES Personagem (ID_Personagens)
    ON DELETE RESTRICT;
 
ALTER TABLE Contexto_Sociocultural ADD CONSTRAINT FK_Contexto_Sociocultural_3
    FOREIGN KEY (fk_Familia_ID_Familia)
    REFERENCES Familia (ID_Familia)
    ON DELETE RESTRICT;
 
ALTER TABLE Membro_Familha_Tem ADD CONSTRAINT FK_Membro_Familha_Tem_1
    FOREIGN KEY (fk_Personagem_ID_Personagens)
    REFERENCES Personagem (ID_Personagens);
 
ALTER TABLE Membro_Familha_Tem ADD CONSTRAINT FK_Membro_Familha_Tem_2
    FOREIGN KEY (fk_Familia_ID_Familia)
    REFERENCES Familia (ID_Familia);
 
ALTER TABLE Faz ADD CONSTRAINT FK_Faz_1
    FOREIGN KEY (fk_Tratamento_ID_Tratamento)
    REFERENCES Tratamento (ID_Tratamento)
    ON DELETE SET NULL;
 
ALTER TABLE Faz ADD CONSTRAINT FK_Faz_2
    FOREIGN KEY (fk_Personagem_ID_Personagens)
    REFERENCES Personagem (ID_Personagens)
    ON DELETE SET NULL;
	
	ALTER TABLE Membro_Familha_Tem
RENAME TO Membro_Familia;

ALTER TABLE Membro_Familia
ADD CONSTRAINT pk_Membro_Familia PRIMARY KEY (fk_Personagem_ID_Personagens, fk_Familia_ID_Familia);

INSERT INTO Personagem (ID_Personagens, Nome_Personagen, Etnia, Genero)
VALUES

(7, 'Rod Williams', 'afroamericano', 'masculino');

INSERT INTO Familia (ID_Familia, Membro, Nome_Familia)
VALUES
(1, 'Filha', 'Armitage'),
(2, 'Mae', 'Armitage'),
(3, 'Filho', 'Armitage'),
(4, 'Pai', 'Armitage'),
(5, 'Vo', 'Armitage');

INSERT INTO Tratamento (ID_Tratamento, Tratamento_Nome, Fases_Tratamento)
VALUES
(1, 'Coagula', 'hipnose'),
(2, 'coagula', 'preparação mental'),
(3, 'coagula', 'transplante');

INSERT INTO Contexto_Sociocultural (ID_Contexto_Sociocultural, Tipo_de_Identidade, Fator_Social, Classe_Social, Regiao, fk_Personagem_ID_Personagens, fk_Familia_ID_Familia) 
VALUES (1, 'Identidade Racial', 'Racismo', 'Classe Média', 'Estados Unidos', 1, 1);

INSERT INTO Membro_Familha_Tem (Relação, Especializacao)
VALUES ('Familiar', 'Cirurgia Hipnotica');

select * from tratamento
SELECT * FROM Personagem
SELECT * FROM Familia
SELECT * FROM Contexto_Sociocultural
SELECT * FROM Membro_Familia
SELECT * FROM Membro_Familha_Tem
SELECT * FROM Faz