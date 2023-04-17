
USE TSQLTEST
GO


CREATE PROCEDURE  Dokumenti.proceduraPrikazSvihStavkiRacuna @p_PreduzeceId smallint,@p_PreduzecePoslovnicaId smallint,@p_PoslovnaGodina smallint
AS

SELECT * from Dokumenti.pregledSvihStavkiSaRacuna
WHERE PreduzeceId=@p_PreduzeceId
AND PreduzecePoslovnicaId=@p_PreduzecePoslovnicaId
AND PoslovnaGodina=@p_PoslovnaGodina

GO