USE [master]
GO

IF EXISTS(SELECT * FROM sys.databases WHERE Name = 'SutekiShop')	
	DROP DATABASE [SutekiShop]
GO

CREATE DATABASE [SutekiShop]
GO

USE [SutekiShop]
GO
/****** Object:  Table [dbo].[Postage]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postage](
	[PostageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxWeight] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Postage] PRIMARY KEY CLUSTERED 
(
	[PostageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostZone]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostZone](
	[PostZoneId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Multiplier] [decimal](18, 4) NOT NULL,
	[AskIfMaxWeight] [bit] NOT NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FlatRate] [money] NOT NULL,
 CONSTRAINT [PK_PostZone] PRIMARY KEY CLUSTERED 
(
	[PostZoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentId] [int] NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [category_name_unique] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentType]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentType](
	[ContentTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContentType] PRIMARY KEY CLUSTERED 
(
	[ContentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RequiredIssueNumber] [bit] NOT NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[PostZoneId] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [text] NOT NULL,
	[Price] [money] NOT NULL,
	[Position] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UrlName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [product_name_unique] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[ParentContentId] [int] NULL,
	[ContentTypeId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[UrlName] [nvarchar](250) NOT NULL,
	[Text] [text] NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_urlName] UNIQUE NONCLUSTERED 
(
	[UrlName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardTypeId] [int] NOT NULL,
	[Holder] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](500) NOT NULL,
	[ExpiryMonth] [int] NOT NULL,
	[ExpiryYear] [int] NOT NULL,
	[StartMonth] [int] NOT NULL,
	[StartYear] [int] NOT NULL,
	[IssueNumber] [nvarchar](5) NOT NULL,
	[SecurityCode] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [user_email_unique] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[BasketId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[BasketId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[Address3] [nvarchar](100) NOT NULL,
	[Town] [nvarchar](50) NOT NULL,
	[County] [nvarchar](50) NOT NULL,
	[Postcode] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[BasketId] [int] NOT NULL,
	[CardId] [int] NULL,
	[CardContactId] [int] NOT NULL,
	[DeliveryContactId] [int] NULL,
	[Email] [nvarchar](250) NOT NULL,
	[AdditionalInformation] [text] NOT NULL,
	[UseCardHolderContact] [bit] NOT NULL,
	[PayByTelephone] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DispatchedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsInStock] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItem]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItem](
	[BasketItemId] [int] IDENTITY(1,1) NOT NULL,
	[BasketId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[BasketItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 12/30/2008 10:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [productImage_productId_imageId_unique] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [Basket_CountryId_Default]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Basket] ADD  CONSTRAINT [Basket_CountryId_Default]  DEFAULT ((1)) FOR [CountryId]
GO
/****** Object:  ForeignKey [FK_Category_Category]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
/****** Object:  ForeignKey [FK_Country_PostZone]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_PostZone] FOREIGN KEY([PostZoneId])
REFERENCES [dbo].[PostZone] ([PostZoneId])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_PostZone]
GO
/****** Object:  ForeignKey [FK_Product_Category]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  ForeignKey [FK_Content_Content]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Content] FOREIGN KEY([ParentContentId])
REFERENCES [dbo].[Content] ([ContentId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content]
GO
/****** Object:  ForeignKey [FK_Content_ContentType]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentType] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentType] ([ContentTypeId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentType]
GO
/****** Object:  ForeignKey [FK_Card_CardType]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_CardType] FOREIGN KEY([CardTypeId])
REFERENCES [dbo].[CardType] ([CardTypeId])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_CardType]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK_Basket_Country]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Country]
GO
/****** Object:  ForeignKey [FK_Order_User]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Order_User]
GO
/****** Object:  ForeignKey [FK_Contact_Country]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
/****** Object:  ForeignKey [FK_Order_Basket]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Basket] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Basket] ([BasketId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Basket]
GO
/****** Object:  ForeignKey [FK_Order_Card]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Card] FOREIGN KEY([CardId])
REFERENCES [dbo].[Card] ([CardId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Card]
GO
/****** Object:  ForeignKey [FK_Order_Contact]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Contact] FOREIGN KEY([CardContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Contact]
GO
/****** Object:  ForeignKey [FK_Order_Contact1]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Contact1] FOREIGN KEY([DeliveryContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Contact1]
GO
/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
/****** Object:  ForeignKey [FK_Order_User1]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
GO
/****** Object:  ForeignKey [FK_Size_Product]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Product]
GO
/****** Object:  ForeignKey [FK_BasketItem_Basket]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[BasketItem]  WITH CHECK ADD  CONSTRAINT [FK_BasketItem_Basket] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Basket] ([BasketId])
GO
ALTER TABLE [dbo].[BasketItem] CHECK CONSTRAINT [FK_BasketItem_Basket]
GO
/****** Object:  ForeignKey [FK_OrderItem_Size]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[BasketItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[BasketItem] CHECK CONSTRAINT [FK_OrderItem_Size]
GO
/****** Object:  ForeignKey [FK_ProductImage_Image]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Image]
GO
/****** Object:  ForeignKey [FK_ProductImage_Product]    Script Date: 12/30/2008 10:24:47 ******/
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
