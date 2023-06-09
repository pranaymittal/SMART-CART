USE [cart1]
GO
/****** Object:  StoredProcedure [dbo].[RFIDCheck]    Script Date: 3/21/2023 2:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[RFIDCheck] (@RFIDList varchar(max))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ItemNameList varchar(max) = '';
	DECLARE @Result TABLE (missing varchar(max));
	
	INSERT INTO @Result
	SELECT item_name
        FROM dbo.shopping_cart_1
        WHERE rfid NOT IN (@RFIDList)--(''' + @RFIDList + ''')
        AND rfid IN (SELECT rfid FROM dbo.shopping_cart_1);
	
	SELECT @ItemNameList = COALESCE(@ItemNameList + ', ', '') + missing
		FROM @Result;

    SELECT @ItemNameList as ItemNameList;


END
GO
