USE [cart1]
GO
/****** Object:  StoredProcedure [dbo].[BarcodeSelect]    Script Date: 3/21/2023 2:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[BarcodeSelect] @Barcode nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM dbo.shopping_cart_1 WHERE barcode = @Barcode)
	BEGIN
		UPDATE dbo.shopping_cart_1
		SET item_count = item_count + 1
		WHERE barcode = @Barcode;
	END
	ELSE
	BEGIN
		INSERT INTO dbo.shopping_cart_1 (barcode,item_name,price,rfid, item_count)
		SELECT barcode, item_name, price, rfid, 1
		FROM dbo.storeDB
		WHERE barcode = @Barcode;
	END
	UPDATE dbo.storeDB
	SET inventory = inventory - 1
	WHERE barcode = @Barcode;
END
GO
