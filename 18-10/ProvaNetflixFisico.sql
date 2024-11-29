/* ProvaNetflixLogico: */

CREATE TABLE Usuario_Plano (
    fk_Endereco_Endereco_PK NUMBER(20),
    Nome CHAR(15),
    Data_de_Nascimento NUMBER(8),
    IDUsuario NUMBER(10),
    Email CHAR(320),
    ID_Plano NUMBER(10),
    Preco NUMBER(4),
    Plano_TIPO CHAR(10),
    PRIMARY KEY (IDUsuario, ID_Plano)
);

CREATE TABLE Conteudo (
    Diretor CHAR(10),
    ID_Conteudo NUMBER(20) PRIMARY KEY,
    Classificacao_Etaria NUMBER(10),
    Titulo CHAR(10),
    Data_LcMT NUMBER(10),
    Sinopse CHAR(140),
    Temporada NUMBER(10),
    Duracao_Filme NUMBER(5),
    Conteudo_TIPO NUMBER(10),
    fk_Episodio_ID_Episodio NUMBER(10),
    fk_Avaliacao_ID_Avaliacao NUMBER(10)
);

CREATE TABLE Legenda (
    ID_Legenda NUMBER(30) PRIMARY KEY,
    Customizacao CHAR(10),
    Idioma CHAR(10),
    fk_Conteudo_ID_Conteudo NUMBER(20)
);

CREATE TABLE Avaliacao (
    Amei CHAR(7),
    Gostei CHAR(7),
    Nao__e_pra_mim CHAR(7),
    ID_Avaliacao NUMBER(10) PRIMARY KEY,
    fk_Usuario_Plano_IDUsuario NUMBER(10),
    fk_Usuario_Plano_ID_Plano NUMBER(10)
);

CREATE TABLE Episodio (
    Nome_Episodio CHAR(20),
    Duracao_Episodio NUMBER(10),
    Sinopse_Eoisodio CHAR(140),
    ID_Episodio NUMBER(10) PRIMARY KEY,
    Quantidade NUMBER(10)
);

CREATE TABLE Visalizacao_Assiste (
    ID_Visializacao NUMBER(10) PRIMARY KEY,
    Data NUMBER(8),
    Hora NUMBER(6),
    fk_Usuario_Plano_IDUsuario NUMBER(10),
    fk_Usuario_Plano_ID_Plano NUMBER(10),
    fk_Conteudo_ID_Conteudo NUMBER(20)
);

CREATE TABLE Lista_de_Desejos_Relacionamento_2 (
    ID_Lista_de_Desejo CHAR(30) PRIMARY KEY,
    fk_Usuario_Plano_IDUsuario NUMBER(10),
    fk_Usuario_Plano_ID_Plano NUMBER(10),
    fk_Conteudo_ID_Conteudo NUMBER(20)
);

CREATE TABLE Genero (
    ID_Genero NUMBER(20) PRIMARY KEY,
    Nome_genero CHAR(10),
    fk_Conteudo_ID_Conteudo NUMBER(20)
);

CREATE TABLE Endereco (
    Endereco_PK NUMBER(20) NOT NULL PRIMARY KEY,
    Rua CHAR(10),
    Cidade CHAR(10),
    UD CHAR(10),
    Bairro CHAR(10)
);
 
ALTER TABLE Usuario_Plano ADD CONSTRAINT FK_Usuario_Plano_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Episodio_ID_Episodio)
    REFERENCES Episodio (ID_Episodio)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_3
    FOREIGN KEY (fk_Avaliacao_ID_Avaliacao)
    REFERENCES Avaliacao (ID_Avaliacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Legenda ADD CONSTRAINT FK_Legenda_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Usuario_Plano_IDUsuario, fk_Usuario_Plano_ID_Plano)
    REFERENCES Usuario_Plano (IDUsuario, ID_Plano)
    ON DELETE RESTRICT;
 
ALTER TABLE Visalizacao_Assiste ADD CONSTRAINT FK_Visalizacao_Assiste_2
    FOREIGN KEY (fk_Usuario_Plano_IDUsuario, fk_Usuario_Plano_ID_Plano)
    REFERENCES Usuario_Plano (IDUsuario, ID_Plano);
 
ALTER TABLE Visalizacao_Assiste ADD CONSTRAINT FK_Visalizacao_Assiste_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Lista_de_Desejos_Relacionamento_2 ADD CONSTRAINT FK_Lista_de_Desejos_Relacionamento_2_2
    FOREIGN KEY (fk_Usuario_Plano_IDUsuario, fk_Usuario_Plano_ID_Plano)
    REFERENCES Usuario_Plano (IDUsuario, ID_Plano);
 
ALTER TABLE Lista_de_Desejos_Relacionamento_2 ADD CONSTRAINT FK_Lista_de_Desejos_Relacionamento_2_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Genero ADD CONSTRAINT FK_Genero_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;