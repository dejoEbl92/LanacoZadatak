USE TSQLTEST
GO

CREATE PROCEDURE Dokumenti.proceduraSumiranjeStavkiRacuna @p_PreduzeceId smallint,@p_PreduzecePoslovnicaId smallint,@p_PoslovnaGodina smallint,@p_RacunId int
AS

UPDATE DR
SET DR.Osnovica=DRS.Osnovica,
DR.PDV=DRS.PDV,
DR.Ukupno=DRS.Osnovica+DRS.PDV
FROM Dokumenti.RACUN AS DR
INNER JOIN (
select PreduzeceId,
PreduzecePoslovnicaId,
PoslovnaGodina,
RacunId,
ROUND(SUM(Osnovica),2) AS Osnovica,
ROUND(SUM(PDV),2) AS PDV 
from Dokumenti.RACUN_STAVKA
Group by PreduzeceId,PreduzecePoslovnicaId,PoslovnaGodina,RacunId
) AS DRS ON DR.PreduzeceId=DRS.PreduzeceId AND DR.PreduzecePoslovnicaId=DRS.PreduzecePoslovnicaId AND DR.PoslovnaGodina=DRS.PoslovnaGodina AND DR.RacunId=DRS.RacunId
WHERE DR.PreduzeceId=@p_PreduzeceId 
AND DR.PreduzecePoslovnicaId=@p_PreduzecePoslovnicaId 
AND DR.PoslovnaGodina=@p_PoslovnaGodina
AND DR.RacunId=@p_RacunId


GO