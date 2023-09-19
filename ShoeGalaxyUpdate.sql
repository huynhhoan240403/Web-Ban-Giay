USE [master]
GO
/****** Object:  Database [ShoesWeb]    Script Date: 9/19/2023 9:37:28 AM ******/
CREATE DATABASE [ShoesWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoesWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoesWeb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoesWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoesWeb_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoesWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoesWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoesWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoesWeb] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoesWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoesWeb', N'ON'
GO
USE [ShoesWeb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/19/2023 9:37:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/19/2023 9:37:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/19/2023 9:37:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Telephone] [int] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/19/2023 9:37:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[Special] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/19/2023 9:37:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1, N'Nike', N'Air Max 1')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (2, N'Nike', N'Air Force 1')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (3, N'Nike', N'Nike Blazer')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (4, N'Adidas', N'Yeezy')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (5, N'Adidas', N'UltraBoost')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (6, N'Adidas', N'Stan Smith')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (7, N'Adidas', N'Superstar')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (8, N'Adidas', N'Human Race')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (9, N'Adidas', N'Forum')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (10, N'Nike', N'Air Max 90')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (11, N'New Balance ', N'New Balance 327')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (12, N'New Balance ', N'New Balance 550')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (13, N'New Balance ', N'New Balance 574')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (14, N'New Balance ', N'New Balance 57/40')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (15, N'Converse', N'Chuck 70')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (16, N'Converse', N'Chuck Taylor')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (17, N'Vans', N'Old Skool')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (18, N'Vans', N'Slip-on')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (19, N'Vans', N'Classic')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (20, N'MLB', N'MLB Mule')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (21, N'MLB', N'MLB Chunky')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (22, N'MLB', N'MLB Playball')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (23, N'MLB', N'MLB Liner')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (24, N'Air Jordan', N'Jordan 1 Low')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (26, N'Air Jordan ', N'Jordan 1 Mid')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (27, N'Air Jordan ', N'Jordan 1 High')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (28, N'Adidas', N'NMD')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (29, N'Adidas', N'Adidas Yung')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (30, N'Adidas', N'Adidas Prophere')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (31, N'Nike', N'Nike Blazer')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (32, N'Nike', N'Nike Dunk')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (33, N'Adidas', N'Samba')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (4, N'Giày Nike Air Force 1 Low All White', 2800000, N'6002eaca8ea19.jpg', CAST(N'2023-04-10' AS Date), 1, 2, 10, N'<h3><strong>Th&ocirc;ng tin ph&aacute;t h&agrave;nh sản phẩm</strong></h3>

<p><strong>M&atilde; gi&agrave;y:</strong>&nbsp;CW2288-111</p>

<p><strong>Phối m&agrave;u:</strong>&nbsp;White</p>

<p><strong>Thương hiệu:</strong> Nike</p>

<p><strong>Ng&agrave;y ra mắt:</strong> 26/12/2020</p>

<p><strong>Danh mục:</strong>&nbsp;Air Force 1</p>
', 0, 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (7, N'Nike Blazer Mid ''77 Next Nature ''White''', 2590000, N'60ae4d6092178.jpg', CAST(N'2023-04-05' AS Date), 1, 31, 10, N'<h3>Th&ocirc;ng tin ph&aacute;t h&agrave;nh <span style="color:#e74c3c">Nike Blazer Mid &#39;77 Next Nature &#39;White&#39;</span></h3>

<p><strong>Thương hiệu:</strong>&nbsp;Nike</p>

<p><strong>Thiết kế: </strong>Nike Blazer</p>

<p><strong>M&atilde; sản phẩm:</strong>&nbsp;DO1344-101</p>

<p><strong>Xuất xứ :&nbsp;</strong>Mỹ</p>
', 0, 24, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (15, N'Nike Dunk Low Industrial Blue Sashiko', 3900000, N'641448d9b00d3.jpg', CAST(N'2023-04-10' AS Date), 1, 32, 10, N'<p>Nike Dunk</p>
', 0, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (16, N'Adidas Samba Classic White', 2400000, N'63f9b0c284959.jpg', CAST(N'2023-04-08' AS Date), 1, 33, 10, N'', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (17, N'Nike Air Max 1 Patta Waves Monarch', 5000000, N'61a878efddd76.jpg', CAST(N'2023-04-02' AS Date), 1, 1, 10, N'', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (18, N'New Balance 550 Cream Black', 5600000, N'622742a34109e.jpg', CAST(N'2023-04-05' AS Date), 1, 12, 3, N'', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (19, N'Nike Dunk Low Mechigan State', 5500000, N'60827096ed0c4.jpg', CAST(N'2023-04-08' AS Date), 1, 32, 2, N'', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (20, N'New Balance 550 White Red Black', 2700000, N'620ba900f3531.jpg', CAST(N'2023-04-06' AS Date), 1, 12, 5, N'', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'bachnd', N'123456', N'Nguyễn Đăng Bách', 123456789, N'bachndps17035@fpt.edu.vn', N'user.png', 1, 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'duyvt', N'123456', N'Võ Triệu Duy', 123456789, N'duyvtps17029@fpt.edu.vn', N'user.png', 1, 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'hanlh', N'123456', N'Lương Hữu Hân', 123456789, N'luonglhps17045@fpt.edu.vn', N'user.png', 1, 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'minhbh', N'123456', N'Bùi Hữu Minh', 123456789, N'minhbhps17089@fpt.edu.vn', N'user.png', 1, 1)
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ShoesWeb] SET  READ_WRITE 
GO
