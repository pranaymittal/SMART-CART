USE [cart1]
GO
/****** Object:  StoredProcedure [dbo].[ItemCount]    Script Date: 3/21/2023 2:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[ItemCount] @Barcode nvarchar(50), @NewCount int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;

	DECLARE @current_item_count INT
    SELECT @current_item_count = item_count
    FROM dbo.shopping_cart_1
    WHERE barcode = @Barcode;

	UPDATE dbo.storeDB
    SET inventory = inventory + (@current_item_count - @NewCount)
    WHERE barcode = @Barcode;

	IF EXISTS (SELECT * FROM dbo.shopping_cart_1 WHERE barcode = @Barcode)
	BEGIN
		IF @NewCount = 0
		BEGIN

			DELETE FROM dbo.shopping_cart_1 WHERE barcode = @Barcode;
		END
		ELSE IF @NewCount > 0
		BEGIN
			UPDATE dbo.shopping_cart_1
			SET item_count = @NewCount
			WHERE barcode = @Barcode;
		END
	END
END
GO
