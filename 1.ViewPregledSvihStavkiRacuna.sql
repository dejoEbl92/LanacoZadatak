
USE TSQLTEST
GO

CREATE VIEW Dokumenti.pregledSvihStavkiSaRacuna
AS 

SELECT DRS.PreduzeceId,
DRS.PreduzecePoslovnicaId,
DRS.PoslovnaGodina,
CASE ISNULL(DRS.ArtikalId,0) WHEN 0 THEN SU.Naziv ELSE SA.Naziv END AS NazivStavke,
DRS.Kolicina,
DRS.Cijena 
FROM Dokumenti.Racun_Stavka AS DRS
LEFT JOIN Sifarnici.Artikal AS SA ON DRS.PreduzeceId=SA.PreduzeceId AND SA.ArtikalId=DRS.ArtikalId
LEFT JOIN Sifarnici.Usluga AS SU ON SU.PreduzeceId=DRS.PreduzeceId AND SU.UslugaId=DRS.UslugaId

GO