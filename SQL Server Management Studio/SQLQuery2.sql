/* INTRO TO TSQL */

PRINT 'Hello World!'

PRINT 'Having fun with' + ' TSQL and MS SQL SERVER!'


/* CREATING A VARIABLE */
DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable


/* CONVERTING A STORED VARIABLE INTEGER INTO PART OF A CONCATENATED STRING */
DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5
PRINT 'I have ' + CONVERT(VARCHAR(50),@var1) + ' dollars...'


/* USING "CHAR(9)" TO INDENT AND "CHAR(13)" AS A LINE BREAK. BOTH ASCII CHARACTERS FOR KEYBOARD INSTRUCTIONS */
DECLARE @var3 INT, @var4 INT
SET @var3 = 10
SET @var4 = 7
PRINT CHAR(9) + 'I have ' + CONVERT(VARCHAR(50),@var3) + CHAR(13) + ' dollars...'


DECLARE @var5 INT, @var6 INT
SET @var5 = 2
SET @var6 = 8
PRINT 'Variable 5 = ' + CONVERT(VARCHAR(5),@var5) + CHAR(13) + 'Variable 6 = ' + CONVERT(VARCHAR(5),@var6)


DECLARE @var7 INT, @var8 INT
SET @var7 = 1
SET @var8 = 9
PRINT 'Variable 7 = ' + CONVERT(VARCHAR(5),@var7) + CHAR(13) + 'Variable 8 = ' + CONVERT(VARCHAR(5),@var8) + CHAR(13) + 'Total: '
PRINT @var7 + @var8


/* IF-THEN STATEMENTS */

DECLARE @var9 INT, @var10 INT /* FIRST WE DECLARE THE VARIABLES*/
SET @var9 = 13
SET @var10 = 19

IF @var9 <= 11
	BEGIN
		PRINT 'Variable 9 <= ' + CONVERT(VARCHAR(5),@var9) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 9 is not < ' + CONVERT(VARCHAR(5),@var9) + CHAR(13)
	END

/* IF/ELSE-IF STATEMENTS */
DECLARE @var11 INT, @var12 INT /* FIRST WE DECLARE THE VARIABLES*/
SET @var11 = 22
SET @var12 = 15

IF @var11 < 2
	BEGIN
		PRINT '@var11 11 < 12 ' 
	END
ELSE IF @var11 > 1 AND @var11 < 3
	BEGIN
		PRINT '@var11 > 1 AND @var11 < 3'
	END
ELSE IF @var11 = 4 OR @var11 < 6
	BEGIN
		PRINT '@var11 = 4 OR @var11 < 6'
	END
ELSE
	PRINT '@var11 does not qualify!'
