-- NEW PROCEDURE WITH SINGLE PARAMETER PASSED --
CREATE PROCEDURE dbo.uspGetAddress2 @City NVARCHAR(30)
AS

SELECT * FROM Person.Address
WHERE City LIKE @City + '%'
GO

EXEC dbo.uspGetAddress2 @City = 'New'

-- NEW STORED PROCEDURE WITH MULTIPLE PARAMETERS PASSED --
CREATE PROC dbo.uspGetAddress3 @City NVARCHAR(30), @PostalCode NVARCHAR(10)
AS

SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
GO

EXEC dbo.uspGetAddress3	@City = 'New', @PostalCode = '[98]%'

-- STORED PROCEDURE WITH OUTPUT PASSED OUT OF THE PROCEDURE --
CREATE PROC dbo.uspGetAddress4 @CityName NVARCHAR(30) OUTPUT
AS

SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO

DECLARE @CityName NVARCHAR(30)

EXEC dbo.uspGetAddress4	@CityName = @CityName OUTPUT
PRINT @CityName