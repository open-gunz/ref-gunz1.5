CREATE TABLE dbo.Event_Lotto_GameOn
(
	CID			INT			NOT NULL,
	Num0		TINYINT,
	Num1		TINYINT,
	Num2		TINYINT,
	Num3		TINYINT,
	Num4		TINYINT,
	Num5		TINYINT,
	Num6		TINYINT,
	Num7		TINYINT,
	Num8		TINYINT,
	Num9		TINYINT,
	
	CONSTRAINT Event_Lotto_GameOn_PK PRIMARY KEY CLUSTERED (CID DESC)
)