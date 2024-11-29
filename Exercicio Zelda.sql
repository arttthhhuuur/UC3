/* Lógico_1: */

CREATE TABLE Personagens (
    ID_Personagem INT PRIMARY KEY,
    Nome VARCHAR(10),
    Descricao VARCHAR(10),
    Afiliacao VARCHAR(10)
);

CREATE TABLE Itens (
    ID_Itens INT PRIMARY KEY,
    Nome VARCHAR(10),
    Tipo VARCHAR(10),
    Efeito VARCHAR(10),
    Raridade VARCHAR(10)
);

CREATE TABLE Locais (
    ID_Locais INT PRIMARY KEY,
    Nome VARCHAR(10),
    Descricao VARCHAR(10),
    Tipo VARCHAR(10)
);

CREATE TABLE Hilian (
    Hab__Especial VARCHAR(10),
    fk_Personagens_ID_Personagem INT PRIMARY KEY
);

CREATE TABLE Zoro (
    Hab__Especial VARCHAR(10),
    fk_Personagens_ID_Personagem INT PRIMARY KEY
);

CREATE TABLE Goron (
    Hab__Especial VARCHAR(10),
    fk_Personagens_ID_Personagem INT PRIMARY KEY
);

CREATE TABLE Interagi (
    fk_Personagens_ID_Personagem INT,
    fk_Personagens_ID_Personagem_ INT
);

CREATE TABLE Relacionamento (
    fk_Personagens_ID_Personagem INT,
    fk_Locais_ID_Locais INT
);

CREATE TABLE Tem (
    fk_Itens_ID_Itens INT,
    fk_Personagens_ID_Personagem INT
);
 
ALTER TABLE Hilian ADD CONSTRAINT FK_Hilian_2
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Zoro ADD CONSTRAINT FK_Zoro_2
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Goron ADD CONSTRAINT FK_Goron_2
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Interagi ADD CONSTRAINT FK_Interagi_1
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Interagi ADD CONSTRAINT FK_Interagi_2
    FOREIGN KEY (fk_Personagens_ID_Personagem_)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento ADD CONSTRAINT FK_Relacionamento_1
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento ADD CONSTRAINT FK_Relacionamento_2
    FOREIGN KEY (fk_Locais_ID_Locais)
    REFERENCES Locais (ID_Locais)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Itens_ID_Itens)
    REFERENCES Itens (ID_Itens)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Personagens_ID_Personagem)
    REFERENCES Personagens (ID_Personagem)
    ON DELETE RESTRICT;