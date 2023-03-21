USE [cart1]
GO
/****** Object:  Table [dbo].[shopping_cart_1]    Script Date: 3/21/2023 2:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_cart_1](
	[barcode] [nchar](10) NULL,
	[item_name] [nchar](10) NULL,
	[price] [float] NULL,
	[rfid] [nchar](10) NULL,
	[item_count] [int] NULL
) ON [PRIMARY]
GO
