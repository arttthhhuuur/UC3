/* eldenlogico: */

CREATE TABLE ID_Usuario (
    ID_Usuario BIGINT PRIMARY KEY,
    Nome_Usuario VARCHAR(50),
    Telefone BIGINT,
    CPF BIGINT
);

CREATE TABLE Jogo (
    ID_Jogo BIGINT,
    ID_Nome_Personagem VARCHAR(50),
    FK_ID_Usuario BIGINT,
    Nome_Jogo VARCHAR(100),
    Cenario VARCHAR(100),
    Preco DECIMAL(10, 2),
    PRIMARY KEY (ID_Jogo, ID_Nome_Personagem)
);

CREATE TABLE Menu (
    ID_Menu BIGINT PRIMARY KEY,
    Configuracao VARCHAR(100),
    Customizacao VARCHAR(100)
);

CREATE TABLE Arma (
    ID_Arma BIGINT PRIMARY KEY,
    Nome_Arma VARCHAR(100),
    Dano INT,
    Tipo VARCHAR(50),
    Efeito VARCHAR(50),
    Raridade VARCHAR(50)
);

CREATE TABLE Mob (
    ID_Mob BIGINT PRIMARY KEY,
    FK_Nome_Mob VARCHAR(50),
    Velocidade INT,
    Dano INT
);
 
-- Definindo as foreign keys

ALTER TABLE Jogo ADD CONSTRAINT FK_Jogo_2
    FOREIGN KEY (FK_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Mob ADD CONSTRAINT FK_Mob_2
    FOREIGN KEY (FK_Nome_Mob)
    REFERENCES Jogo (ID_Nome_Personagem);
