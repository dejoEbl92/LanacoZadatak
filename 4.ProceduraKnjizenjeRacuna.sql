USE TSQLTEST
GO

CREATE PROCEDURE Dokumenti.proceduraKnjizenjeRacuna @p_PreduzeceId smallint,@p_PreduzecePoslovnicaId smallint,@p_PoslovnaGodina smallint,@p_RacunId int,@o_Status bit OUTPUT
AS
BEGIN
SET NOCOUNT ON;
 
 IF EXISTS(
	SELECT * FROM Dokumenti.RACUN_STAVKA as DRS
	INNER JOIN Sifarnici.ARTIKAL AS SArt ON DRS.PreduzeceId=SArt.PreduzeceId AND DRS.ArtikalId=Sart.ArtikalId
	WHERE DRS.Kolicina > SArt.KolicinaStanje
	AND DRS.PreduzeceId=@p_PreduzeceId 
	AND DRS.PreduzecePoslovnicaId=@p_PreduzecePoslovnicaId
	AND DRS.PoslovnaGodina=@p_PoslovnaGodina
	AND DRS.RacunId=@p_RacunId)
 BEGIN
    SET @o_Status = 1
 END
 ELSE
  BEGIN
    SET @o_Status = 0

	UPDATE Dokumenti.RACUN
	SET Status='P'
	WHERE PreduzeceId=@p_PreduzeceId 
	AND PreduzecePoslovnicaId=@p_PreduzecePoslovnicaId
	AND PoslovnaGodina=@p_PoslovnaGodina
	AND RacunId=@p_RacunId
  END
 
END