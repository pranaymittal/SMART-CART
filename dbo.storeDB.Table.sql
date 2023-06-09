USE [cart1]
GO
/****** Object:  Table [dbo].[storeDB]    Script Date: 3/21/2023 2:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storeDB](
	[barcode] [nvarchar](50) NULL,
	[item_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[rfid] [nvarchar](50) NULL,
	[inventory] [int] NULL
) ON [PRIMARY]
GO
