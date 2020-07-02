USE [db_zooTEST1]
GO

/*
 * CONVERT(VARCHAR(50),@totalHab) = THIS IS CONVERTING THE DATA TYPE FROM MONEY TO STRING CHARACTERS
 * CHAR(9) = TAB KEY
 * CHAR(13) = LINE BREAK
 */
 DECLARE @totalHab MONEY;
 DECLARE @totalNut MONEY;
 DECLARE @results MONEY;
 SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
 SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
 SET @results = (@totalHab + @totalNut)
 PRINT (
	CONVERT(VARCHAR(50),@totalHab) + CHAR(9) + ' = The Total Habitat Cost' + CHAR(13) +
	CONVERT(VARCHAR(50),@totalNut) + CHAR(9) + CHAR(9) + ' = The Total Nutrition Cost ' + CHAR(13) + '---------' + CHAR(13) +
	CONVERT(VARCHAR(50),@results)
);