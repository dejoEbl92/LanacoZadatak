USE TSQLTEST
GO

CREATE FUNCTION Dokumenti.funkcijaCijenaArtiklaSaPdv
(
   @p_PreduzeceId smallint,
   @p_PdvStopa float,
   @p_ArtikalId int
   
)
RETURNS decimal(12,6)
AS
BEGIN RETURN (SELECT CijenaBezPdv*(1 +(@p_PdvStopa/100)) as CijenaSaPdv from Sifarnici.ARTIKAL
WHERE ArtikalId=@p_ArtikalId
AND PreduzeceId=@p_PreduzeceId )
END