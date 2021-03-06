ALTER PROCEDURE dbo.spWebGetSurvivalRankingTopBySID
	@SID		TINYINT
	, @Count	INT
AS BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow INT;	
	SELECT TOP 1 @StartRow = RowNum FROM dbo.SurvivalCharacterInfoWeb WHERE SID = @SID
	
	SELECT	c.Name AS CharacName
			, t.RankRP AS RankingPoint
	FROM 	(	SELECT	ci.RowNum, ci.SID, ci.CID, i.RankRP
				FROM	dbo.SurvivalCharacterInfoWeb ci WITH (NOLOCK)
						, dbo.SurvivalCharacterInfo i WITH (NOLOCK)
				WHERE ci.RowNum BETWEEN @StartRow AND (@StartRow + @Count - 1)
				AND		ci.SID = @SID
				AND		i.SID = @SID
				AND		ci.CID = i.CID			
			) t
			, dbo.Character c WITH (NOLOCK)
	WHERE	t.CID = c.CID
	AND		c.DeleteFlag != 1
	ORDER BY RankingPoint DESC
END
