CREATE TABLE Proprietari
( 
    CodF INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(20) NOT NULL,
    Residenza VARCHAR(20) NOT NULL
); 

CREATE TABLE Assicurazioni
( 
    CodAss INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(20) NOT NULL,
    Sede VARCHAR(20) NOT NULL
); 

CREATE TABLE Autom
( 
    Targa VARCHAR(7) PRIMARY KEY,
    Marca VARCHAR(20) NOT NULL,
    Cilindrata INT NOT NULL,
    Potenza INT NOT NULL,
    CodF INT NOT NULL,
    CodAss INT NOT NULL,
    FOREIGN KEY (CodF) REFERENCES Proprietari(CodF),
    FOREIGN KEY (CodAss) REFERENCES Assicurazioni(CodAss)
); 

CREATE TABLE Sinistro (
    CodS INT PRIMARY KEY IDENTITY(1,1),
    Localita VARCHAR(30) NOT NULL,
    Data VARCHAR(30) NOT NULL
);

CREATE TABLE AutoCoinvolte (
    CodS INT,
    Targa VARCHAR(7),
    ImportoDelDanno INT NOT NULL,
    PRIMARY KEY(CodS, Targa),
    FOREIGN KEY(CodS) REFERENCES Sinistro(CodS),
    FOREIGN KEY(Targa) REFERENCES Autom(Targa)
);
