CREATE TABLE Klijent(
KlijentId int IDENTITY (1,1) NOT NULL PRIMARY KEY,
KorisnickoIme NVARCHAR (20) NOT NULL,
Lozinka NVARCHAR (20) NOT NULL,
StanjeNaRacunu DECIMAL (12,3)
)
go
go
CREATE PROCEDURE NadjiKlijenta
(
	@KorisnickoIme VARCHAR(20),
	@Lozinka VARCHAR(20),
	@KlijentId INT OUTPUT
)
AS
	SELECT @KlijentId = KlijentId
	FROM Klijent
	WHERE KorisnickoIme = @KorisnickoIme
	AND Lozinka = @Lozinka

	IF @@ROWCOUNT < 1
		SELECT @KlijentId=0