USE [cart1]
GO
/****** Object:  StoredProcedure [dbo].[EmptyShoppingCart]    Script Date: 3/21/2023 2:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[EmptyShoppingCart]
AS
BEGIN
    DELETE FROM dbo.shopping_cart_1
END
GO
