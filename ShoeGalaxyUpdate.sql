USE [master]
GO
/****** Object:  Database [ShoeGalaxy]    Script Date: 10/14/2023 10:04:29 AM ******/


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeGalaxyhieu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeGalaxyhieu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoeGalaxyhieu] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'[ShoeGalaxyhieu]', N'ON'
GO
USE [ShoeGalaxyhieu]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Address] (
    [address_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [username] NVARCHAR(50) NOT NULL,
    [province] NVARCHAR(255) NOT NULL,
    [district] NVARCHAR(255) NOT NULL,
    [ward] NVARCHAR(255) NOT NULL,
    [address] NVARCHAR(255) NOT NULL,
    [email] NVARCHAR(255) NOT NULL,
	[activate] [bit] NOT NULL,
    FOREIGN KEY ([username]) REFERENCES [dbo].[Accounts] ([username])
)
insert into dbo.Address values ('NV01',N'Thành phố Hồ Chí Minh',N'Quận 12',N'Phường Tân Chánh Hiệp',N'2210 68 quốc lộ 1A','endtheday94@gmail.com',1)
insert into dbo.Address values ('NV01',N'Thành phố Hà Nội',N'Quận Ba Đình',N'Phường Phúc Xá',N'22222222','endtheday94121@gmail.com',0)

insert into dbo.Address values ('NV02',N'Thành phố Hà Nội',N'Quận Ba Đình',N'Phường Phúc Xá',N'22222222','hilano@gmail.com',0)


CREATE TABLE [dbo].[Authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discount_codes]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[discount_codes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[discount_amount] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_DATE] [date] NOT NULL,
	[activate] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discount_product]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_Date] [date] NOT NULL,
	[percentage] [float] NOT NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](100) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[create_date] [datetime] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[nguoinhan] [nvarchar](50) NOT NULL,
	[tongtien] [float] NOT NULL,
	[available] [bit] NULL,
	[discountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [char](4) NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[available] [bit] NOT NULL,
	[sale_id] [int] NULL,
 CONSTRAINT [PK__Products__3213E83FE24BFA19] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 10/14/2023 10:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[size] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'NV01', N'123', N'Phạm Trung Hiếu', N'hieupt@fpt.edu.vn', N'hieu.jpg')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'NV02', N'123', N'Huỳnh Đức Hoàn', N'hoanhd@fpt.edu.vn', N'hoan.jpg')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'NV03', N'123', N'Bùi Xuân Việt', N'vietbx@fpt.edu.vn', N'viet.jpg')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'NV04', N'123', N'Phạm Đăng Nguyên', N'nguyenpd@fpt.edu.vn', N'nguyen.jpg')
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (1, N'NV01', N'DIRE')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (2, N'NV02', N'STAF')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (3, N'NV03', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'AD  ', N'Adidas')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'M   ', N'MLB')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'NK  ', N'Nike')
SET IDENTITY_INSERT [dbo].[discount_codes] ON 

INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (1, N'KM01', CAST(30.00 AS Decimal(10, 2)), 9, CAST(N'2013-10-13' AS Date), CAST(N'2023-10-29' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (2, N'1', CAST(1.00 AS Decimal(10, 2)), 0, CAST(N'2023-10-11' AS Date), CAST(N'2023-10-21' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (3, N'BXV', CAST(50.00 AS Decimal(10, 2)), 995, CAST(N'2023-10-13' AS Date), CAST(N'2023-10-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[discount_codes] OFF
SET IDENTITY_INSERT [dbo].[discount_product] ON 

INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (18, 1, N'SALEOFFPART1', CAST(N'2023-09-30' AS Date), CAST(N'2023-10-30' AS Date), 20, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (26, 2, N'SALEOFFQTPN', CAST(N'2023-10-09' AS Date), CAST(N'2023-10-20' AS Date), 30, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (31, 1, N'12321nhg', CAST(N'2023-06-06' AS Date), CAST(N'2023-06-29' AS Date), 20, 1)
SET IDENTITY_INSERT [dbo].[discount_product] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (1, N'm1_1.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (2, N'm1_2.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (3, N'm1_3.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (4, N'm2_1.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (5, N'm2_2.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (6, N'm2_3.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (7, N'm3_1.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (8, N'm3_2.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (9, N'm3_3.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (10, N'm4_1.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (11, N'm4_2.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (12, N'm4_3.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (13, N'm7_1.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (14, N'm7_2.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (15, N'm7_3.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (16, N'm8_1.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (17, N'm8_2.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (18, N'm8_3.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (19, N'm9_1.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (20, N'm9_2.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (21, N'm9_3.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (22, N'a1_1.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (23, N'a1_2.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (24, N'a1_3.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (25, N'a2_1.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (26, N'a2_2.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (27, N'a2_3.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (28, N'a3_1.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (29, N'a3_2.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (30, N'a3_3.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (31, N'a4_1.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (32, N'a4_2.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (33, N'a4_3.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (34, N'a5_1.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (35, N'a5_2.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (36, N'a5_3.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (37, N'a6_1.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (38, N'a6_2.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (39, N'a6_3.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (40, N'a7_1.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (41, N'a7_2.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (42, N'a7_3.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (43, N'a8_1.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (44, N'a8_2.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (45, N'a8_3.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (46, N'n1_1.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (47, N'n1_2.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (48, N'n1_3.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (49, N'n2_1.png', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (50, N'n2_2.jpg', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (51, N'n2_3.jpg', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (52, N'n3_1.png', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (53, N'n3_2.jpg', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (54, N'n3_3.jpg', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (55, N'n4_1.jpg', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (56, N'n4_2.jpg', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (57, N'n4_3.webp', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (58, N'n5_1.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (59, N'n5_2.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (60, N'n5_3.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (61, N'n6_1.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (62, N'n6_2.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (63, N'n6_3.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (64, N'n7_1.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (65, N'n7_2.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (66, N'n7_3.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (67, N'n8_1.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (68, N'n8_2.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (69, N'n8_3.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (70, N'n9_1.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (71, N'n9_2.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (72, N'n9_3.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (73, N'n10_1.jpg', 25)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (74, N'n10_2.webp', 25)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (75, N'n10_3.webp', 25)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (2, 2, 24, 50, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (4, 4, 16, 35, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (5, 5, 24, 50, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (7, 7, 24, 50, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (8, 8, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10, 9, 1, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (11, 9, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (12, 9, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (13, 10, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (14, 10, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (15, 10, 10, 80, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (16, 10, 10, 80, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (18, 11, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (19, 12, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20, 13, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (21, 14, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (22, 15, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (23, 16, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (24, 17, 1, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (25, 17, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (26, 17, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (27, 18, 9, 100, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (28, 18, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (29, 19, 8, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (30, 19, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (31, 19, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (32, 20, 1, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (33, 21, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (34, 22, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (35, 23, 2, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (36, 24, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (37, 25, 9, 100, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (38, 25, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (39, 26, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (40, 27, 1, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (41, 27, 1, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (42, 28, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (43, 28, 10, 80, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (44, 29, 8, 90, 2, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (45, 29, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (46, 30, 1, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (47, 31, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (48, 32, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (49, 33, 9, 100, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (50, 34, 2, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (51, 34, 4, 60, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (52, 35, 8, 90, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (53, 36, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (54, 36, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (55, 37, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (56, 38, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (57, 39, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (58, 40, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (59, 41, 1, 90, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (60, 42, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (61, 43, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (62, 44, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (63, 45, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (64, 46, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (65, 47, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (66, 48, 1, 90, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (67, 49, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (68, 50, 1, 90, 29, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (69, 51, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (70, 52, 1, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (71, 53, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (72, 54, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (73, 55, 1, 90, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (74, 56, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (75, 56, 3, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (76, 56, 2, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (77, 56, 7, 60, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (78, 57, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (79, 57, 3, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (80, 57, 2, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (81, 57, 7, 60, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (82, 58, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (83, 59, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (84, 59, 2, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (85, 60, 2, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (86, 61, 5, 50, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (87, 61, 6, 90, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (88, 62, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (89, 63, 2, 90, 2, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (90, 64, 2, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (91, 65, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (92, 66, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (93, 67, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (94, 68, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (95, 69, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (96, 70, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (97, 71, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (98, 72, 1, 90, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (99, 73, 2, 90, 1, 39)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (2, N'NV01', CAST(N'2023-02-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (4, N'NV01', CAST(N'2023-04-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 35, 1, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (5, N'NV01', CAST(N'2023-05-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (7, N'NV01', CAST(N'2021-12-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (8, N'nv01', CAST(N'2023-08-09 15:47:29.523' AS DateTime), N'HCm', N'Nguyen Dang', 260, 1, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (9, N'nv01', CAST(N'2023-08-09 15:58:48.833' AS DateTime), N'HCm', N'Nguyen Dang', 360, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (10, N'nv01', CAST(N'2023-08-09 22:43:41.627' AS DateTime), N'HCm', N'Nguyen Dang', 440, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (11, N'nv01', CAST(N'2023-08-09 22:46:21.603' AS DateTime), N'HCm', N'Nguyen Dang', 180, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (12, N'nv01', CAST(N'2023-08-09 22:46:51.013' AS DateTime), N'HCm', N'Nguyen Dang', 90, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (13, N'nv01', CAST(N'2023-08-09 22:49:43.683' AS DateTime), N'HCm', N'Nguyen Dang', 90, 1, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (14, N'nv01', CAST(N'2023-08-09 22:55:40.667' AS DateTime), N'HCm', N'Nguyen Dang', 90, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (15, N'nv01', CAST(N'2023-08-09 22:58:18.820' AS DateTime), N'HCm', N'Nguyen Dang', 90, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (16, N'nv01', CAST(N'2023-08-09 22:58:38.257' AS DateTime), N'HCm', N'Nguyen Dang', 90, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (17, NULL, CAST(N'2023-08-10 19:00:56.697' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 360, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (18, N'NV01', CAST(N'2023-08-10 19:03:30.010' AS DateTime), N'305 Lý Thái Tộ Thôn Hiệp Tiến, xã Tân Tiến', N'Bùi Xuân Việt', 300, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (19, N'NV01', CAST(N'2023-09-07 15:28:13.090' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 360, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (20, N'NV01', CAST(N'2023-09-07 15:49:40.587' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 180, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (21, N'NV01', CAST(N'2023-09-07 16:23:21.150' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (22, N'NV01', CAST(N'2023-09-12 08:03:44.553' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 90, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (23, N'NV01', CAST(N'2023-09-12 08:04:11.500' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 179.82, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (24, N'NV01', CAST(N'2023-09-12 09:43:39.000' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (25, N'NV01', CAST(N'2023-09-13 13:18:28.010' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 269.7, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (26, N'NV01', CAST(N'2023-09-13 14:37:38.710' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 80.91, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (27, N'nv01', CAST(N'2023-09-13 15:37:55.510' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 323.64, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (28, NULL, CAST(N'2023-09-13 15:49:06.637' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 170, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (29, N'NV03', CAST(N'2023-09-14 16:28:59.500' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 242.73, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (30, N'NV01', CAST(N'2023-09-26 08:11:04.497' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (31, N'NV01', CAST(N'2023-09-27 11:19:34.427' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (32, N'NV01', CAST(N'2023-09-27 11:21:08.283' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (33, N'NV01', CAST(N'2023-09-27 11:22:02.593' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (34, N'NV01', CAST(N'2023-09-27 11:22:39.387' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 117, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (35, N'NV01', CAST(N'2023-09-27 12:08:33.787' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 90, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (36, N'NV01', CAST(N'2023-09-28 08:14:19.790' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 126, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (37, N'NV01', CAST(N'2023-09-30 13:02:40.860' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 63, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (38, N'NV01', CAST(N'2023-09-30 14:25:00.993' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (39, N'NV01', CAST(N'2023-09-30 14:37:16.997' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (40, N'NV01', CAST(N'2023-09-30 14:37:39.327' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (41, N'NV01', CAST(N'2023-09-30 14:38:05.883' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 252, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (42, N'NV01', CAST(N'2023-09-30 14:39:59.650' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (43, N'NV01', CAST(N'2023-09-30 14:40:30.560' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (44, N'NV01', CAST(N'2023-09-30 14:41:23.127' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (45, N'NV01', CAST(N'2023-09-30 14:42:09.093' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (46, N'NV01', CAST(N'2023-09-30 14:42:30.317' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (47, N'NV01', CAST(N'2023-09-30 14:44:04.937' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (48, N'NV01', CAST(N'2023-09-30 14:45:54.870' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 252, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (49, N'NV01', CAST(N'2023-09-30 15:32:18.223' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (50, N'NV01', CAST(N'2023-09-30 15:33:38.087' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 1827, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (51, N'NV01', CAST(N'2023-10-06 20:37:50.297' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (52, N'NV01', CAST(N'2023-10-06 20:39:40.997' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (53, N'NV01', CAST(N'2023-10-06 20:41:56.893' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (54, N'NV01', CAST(N'2023-10-10 19:45:43.537' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (55, N'NV01', CAST(N'2023-10-10 20:11:20.107' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 144, NULL, 2)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (56, N'NV01', CAST(N'2023-10-13 19:35:21.867' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 142.5, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (57, N'NV01', CAST(N'2023-10-13 19:35:22.007' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 142.5, NULL, 1)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (58, N'NV01', CAST(N'2023-10-13 19:41:03.257' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 72, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (59, N'NV01', CAST(N'2023-10-14 07:55:08.137' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 67.5, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (60, N'NV01', CAST(N'2023-10-14 08:02:52.310' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 31.5, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (61, N'NV01', CAST(N'2023-10-14 08:32:21.313' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 70, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (62, N'NV01', CAST(N'2023-10-14 08:50:00.210' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 72, NULL, NULL)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (63, N'NV01', CAST(N'2023-10-14 08:50:13.957' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 126, NULL, NULL)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (64, N'NV01', CAST(N'2023-10-14 09:06:39.537' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, NULL, NULL)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (65, N'NV01', CAST(N'2023-10-14 09:09:05.623' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, NULL, NULL)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (66, N'NV01', CAST(N'2023-10-14 09:16:35.887' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (67, N'NV01', CAST(N'2023-10-14 09:25:58.963' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, NULL, NULL)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (68, N'NV01', CAST(N'2023-10-14 09:48:43.847' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (69, N'NV01', CAST(N'2023-10-14 09:53:14.810' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (70, N'NV01', CAST(N'2023-10-14 09:55:16.693' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (71, N'NV01', CAST(N'2023-10-14 09:56:40.613' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (72, N'NV01', CAST(N'2023-10-14 09:59:08.160' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, NULL, 3)
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID]) VALUES (73, N'NV01', CAST(N'2023-10-14 10:00:02.690' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 31.5, NULL, 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (1, N'M   ', N'MLB Chunky Liner Mid Denim Boston Red', N'm1.webp', 90, 10, 1, 1)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (2, N'M   ', N'MLB BigBall Chunky A Gradient Classic', N'm2.webp', 90, 10, 1, 1)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (3, N'M   ', N'MLB Bigball Chunky A New York Yankees', N'm3.webp', 90, 10, 0, 1002)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (4, N'M   ', N'MLB BigBall Chunky A LA Dodgers Off-White', N'm4.webp', 60, 10, 1, 6)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (5, N'M   ', N'MLB BigBall Chunky Cube Monogram New', N'm7.webp', 50, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (6, N'M   ', N'MLB Chunky-Liner High Boston Red Sox Wine', N'm8.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (7, N'M   ', N'MLB Mule Playball Origin New York Yankees', N'm9.webp', 60, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (8, N'AD  ', N'Adidas Stan Smith', N'a1.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (9, N'AD  ', N'Adidas Superstar', N'a2.webp', 100, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (10, N'AD  ', N'Adidas Ultraboost', N'a3.webp', 80, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (11, N'AD  ', N'Adidas NMD', N'a4.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (12, N'AD  ', N'Adidas Gazelle', N'a5.webp', 100, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (13, N'AD  ', N'Adidas Yeezy', N'a6.webp', 80, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (14, N'AD  ', N'Adidas Continental 80', N'a7.webp', 30, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (15, N'AD  ', N'Adidas Campus', N'a8.webp', 55, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (16, N'NK  ', N'Nike Air Force 1', N'n1.webp', 35, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (17, N'NK  ', N'Nike Air Max 90', N'n2.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (18, N'NK  ', N'Nike Air Jordan 1', N'n3.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (19, N'NK  ', N'Nike React Element 55', N'n4.webp', 60, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (20, N'NK  ', N'Nike Dunk Low', N'n5.webp', 40, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (21, N'NK  ', N'Nike Cortez', N'n6.webp', 80, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (22, N'NK  ', N'Nike Air Max 270', N'n7.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (23, N'NK  ', N'Nike Zoom Pegasus 37', N'n8.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (24, N'NK  ', N'Nike Blazer Mid', N'n9.webp', 50, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (25, N'NK  ', N'Nike SB Dunk High', N'n10.webp', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [image], [price], [quantity], [available], [sale_id]) VALUES (26, N'NK  ', N'Giày Nike Air Force 1 Mid ‘White Black’ DV0806-101', N'3f2ec16a.webp', 3900, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'STAF', N'Staffs')
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (2, 1, 39, 980)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (3, 1, 40, 987)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (4, 1, 41, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (5, 1, 42, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (6, 1, 43, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (9, 2, 39, 29)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (10, 2, 40, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (11, 2, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (12, 2, 42, 96)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (13, 2, 43, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (14, 2, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (15, 3, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (16, 3, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (17, 3, 40, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (18, 3, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (19, 3, 42, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (20, 3, 43, 9)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (21, 3, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (22, 4, 38, 9)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (23, 4, 39, 8)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (24, 4, 40, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (25, 4, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (26, 4, 42, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (27, 4, 43, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (28, 4, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (29, 5, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (30, 5, 39, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (31, 5, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (32, 5, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (33, 5, 42, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (34, 5, 43, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (35, 5, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (36, 6, 38, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (37, 6, 39, 9)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (38, 6, 40, 8)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (39, 6, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (40, 6, 42, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (41, 6, 43, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (42, 6, 44, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (43, 7, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (44, 7, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (45, 7, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (46, 7, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (47, 7, 42, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (48, 7, 43, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (49, 7, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (50, 8, 38, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (51, 8, 39, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (52, 8, 40, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (53, 8, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (54, 8, 42, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (55, 8, 43, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (56, 8, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (57, 9, 38, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (58, 9, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (59, 9, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (60, 9, 41, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (61, 9, 42, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (62, 9, 43, 63)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (63, 9, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (64, 10, 38, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (65, 10, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (66, 10, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (67, 10, 41, 8)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (68, 10, 42, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (69, 10, 43, 22)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (70, 10, 44, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (71, 11, 40, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (72, 11, 41, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (73, 12, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (74, 12, 42, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (75, 13, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (76, 13, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (77, 14, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (78, 14, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (79, 15, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (80, 15, 41, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (81, 16, 40, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (82, 16, 41, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (83, 17, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (84, 17, 41, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (85, 18, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (86, 18, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (87, 19, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (88, 20, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (89, 21, 44, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (90, 22, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (91, 23, 43, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (92, 24, 45, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (93, 25, 39, 3)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[discount_product]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__286302EC] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__produ__286302EC]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([discountID])
REFERENCES [dbo].[discount_codes] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__239E4DCF] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__239E4DCF]
GO
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_Products]
GO
USE [master]
GO
ALTER DATABASE [ShoeGalaxyhieu] SET  READ_WRITE 
GO
