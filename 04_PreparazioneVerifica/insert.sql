
INSERT INTO Sinistro(Localita, Data) VALUES ('Torino','20/01/2000');
INSERT INTO Sinistro(Localita, Data) VALUES ('San Damiano','18/07/2000');
INSERT INTO Sinistro(Localita, Data) VALUES ('Roma','11/11/2001');

INSERT INTO Proprietari(Nome, Residenza) VALUES ('Paolo Damilano', 'Alba');
INSERT INTO Proprietari(Nome, Residenza) VALUES ('Andrea Barbero', 'Fossano');
INSERT INTO Proprietari(Nome, Residenza) VALUES ('Marco Rossi', 'Cuneo');

INSERT INTO Assicurazioni(Nome, Sede) VALUES ('SARA', 'Alba');
INSERT INTO Assicurazioni(Nome, Sede) VALUES ('INASS', 'Torino');
INSERT INTO Assicurazioni(Nome, Sede) VALUES ('ASSOITA', 'Roma');

INSERT INTO Autom VALUES ('FD567LS','BMW',3000,230,1,1);
INSERT INTO Autom VALUES ('GA334WE','Mercedes',280,200,1,2);
INSERT INTO Autom VALUES ('EH578OP','Toyota',1600,150,2,2);
INSERT INTO Autom VALUES ('BZ168KA','Fiat',1200,100,3,3);

INSERT INTO AutoCoinvolte VALUES (2,'GA334WE',200);
INSERT INTO AutoCoinvolte VALUES (1,'FD567LS',800);
INSERT INTO AutoCoinvolte VALUES (3,'EH578OP',90);