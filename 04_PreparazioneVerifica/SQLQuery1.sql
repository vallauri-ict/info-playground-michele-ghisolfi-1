--1- Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV
SELECT Targa, Marca
FROM Autom
WHERE Cilindrata > 2000
OR Potenza > 120

--2- Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV
SELECT p.Nome, a.Targa
FROM Proprietari p, Autom a
WHERE (a.Cilindrata > 2000 OR a.Potenza > 120) and a.CodF=p.CodF

--3- Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza 
--   superiore a 120 CV, assicurate presso la “SARA”
SELECT p.Nome, a.Targa
FROM Proprietari p, Autom a, Assicurazioni s
WHERE a.CodF=p.CodF 
AND s.CodAss=a.CodAss
AND (a.Cilindrata > 2000 OR a.Potenza > 120)
AND s.Nome='SARA'

--4- Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02
 SELECT am.Targa, p.Nome
 FROM Autom am, Proprietari p, Assicurazioni ass, AutoCoinvolte ac, Sinistro s
 WHERE ass.Nome='SARA' AND s.Data='20/01/2002' AND am.CodF=p.CodF
 AND am.CodAss=ass.CodAss AND am.Targa=ac.Targa AND ac.CodS=s.CodS

--5- Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate
SELECT a.Nome, a.Sede, count(*) as NumAuto
FROM Assicurazioni a, Autom m
WHERE m.CodAss = a.CodAss
GROUP BY a.Nome, a.Sede

--6- Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta
SELECT am.Targa, COUNT(*) AS nSinistro
FROM Autom am, AutoCoinvolte ac
WHERE am.Marca='Fiat'
AND am.Targa=ac.Targa
GROUP BY am.Targa

--7- Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’ Assicurazione
--   ed il totale dei danni riportati
SELECT am.Targa, ass.Nome, SUM(ac.ImportoDelDanno)
FROM Autom am, Assicurazioni ass, AutoCoinvolte ac
WHERE am.Targa=ac.Targa
AND ass.CodAss=am.CodAss
GROUP BY am.Targa, ass.Nome
HAVING COUNT(*) > 1

-- 8- CodF e Nome di coloro che possiedono più di un’auto
SELECT p.CodF, p.Nome
FROM Autom am, Proprietari p
WHERE am.CodF=p.CodF
GROUP BY p.CodF, P.Nome
HAVING COUNT(*) > 1

-- 9- La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01
SELECT am.Targa
FROM Autom am
WHERE NOT EXISTS (SELECT *
			FROM AutoCoinvolte ac, Sinistro s
			WHERE am.Targa=ac.Targa
			AND s.CodS = ac.CodS
			AND s.Data>'20/01/2001')

-- 10- Il codice dei sinistri in cui non sono state coinvolte auto con cilindrata inferiore a 2000 cc
SELECT s.CodS
FROM Sinistro s, Autom am, AutoCoinvolte ac
WHERE s.CodS=ac.CodS
AND am.Targa=ac.Targa
AND am.Cilindrata>2000


