USE [master]
GO
/****** Object:  Database [Agent]    Script Date: 27.05.2023 10:19:38 ******/
CREATE DATABASE [Agent]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Agent.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Agent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Agent_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Agent] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agent] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agent] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agent] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agent] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agent] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agent] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Agent] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agent] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agent] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agent] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agent] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agent] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agent] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agent] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agent] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Agent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agent] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agent] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agent] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agent] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agent] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agent] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agent] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agent] SET  MULTI_USER 
GO
ALTER DATABASE [Agent] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agent] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agent] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agent] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Agent] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Agent] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Agent] SET QUERY_STORE = ON
GO
ALTER DATABASE [Agent] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Agent]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial_1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 27.05.2023 10:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (637, N'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', 12, N'5028556', N'', 5, 9, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (638, N'Повязка санитарно–гигиеническая многоразовая черная', 12, N'5028272', N'', 4, 4, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (639, N'Маска одноразовая трехслойная из нетканого материала, нестерильная', 12, N'5028247', N'', 3, 2, CAST(6.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (640, N'Повязка санитарно–гигиеническая многоразовая с принтом', 12, N'5028229', N'', 2, 10, CAST(4900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (641, N'Маска из нетканого материала KN95', 13, N'5030981', N'', 3, 5, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (642, N'Маска из нетканого материала с клапаном KN95', 13, N'5029784', N'', 3, 4, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (643, N'Респиратор У-2К', 13, N'58953', N'', 2, 6, CAST(9500.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (644, N'Респиратор 9101 FFP1', 14, N'5026662', N'', 5, 8, CAST(189.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (645, N'Респиратор противоаэрозольный 9312', 14, N'59043', N'', 4, 7, CAST(39900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (646, N'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', 14, N'58376', N'', 3, 1, CAST(29900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (647, N'Респиратор 3M 8101 противоаэрозольный', 14, N'58375', N'', 1, 4, CAST(139.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (648, N'Респиратор "Алина" 110', 14, N'59324', N'', 3, 9, CAST(12900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (649, N'Респиратор "Алина" 100', 14, N'58827', N'', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (650, N'Респиратор "Нева" 109', 14, N'59898', N'', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (651, N'Респиратор "Юлия" 109', 14, N'59474', N'', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (652, N'Респиратор "Юлия" 119', 14, N'59472', N'', 3, 7, CAST(139.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (653, N'Респиратор 3M с клапаном 9162', 14, N'5033136', N'', 2, 9, CAST(34900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (654, N'Респиратор 3M 9152 FFP2', 14, N'5028048', N'', 2, 8, CAST(39000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (655, N'Респиратор противоаэрозольный 9322', 14, N'58796', N'', 4, 4, CAST(449.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (656, N'Респиратор с клапаном 9926', 14, N'58568', N'', 3, 5, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (657, N'Респиратор 3M 8102 противоаэрозольный', 14, N'58466', N'', 3, 9, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (658, N'Респиратор 3M 8122', 14, N'58445', N'', 3, 6, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (659, N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 14, N'5031919', N'', 2, 8, CAST(34900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (660, N'Респиратор RK6021', 14, N'5030026', N'', 5, 8, CAST(29000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (661, N'Респиратор RK6020', 14, N'5030020', N'', 3, 5, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (662, N'Респиратор Алина 210', 14, N'5030072', N'', 1, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (663, N'Респиратор Алина 211', 14, N'5030062', N'', 1, 6, CAST(29000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (664, N'Респиратор "Алина" 200', 14, N'58826', N'', 4, 5, CAST(139.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (665, N'Респиратор "Алина" П', 14, N'58825', N'', 4, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (666, N'Респиратор "Алина" АВ', 14, N'58584', N'', 2, 5, CAST(24900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (667, N'Респиратор "Нева" 210', 14, N'59736', N'', 1, 3, CAST(109.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (668, N'Респиратор "Нева" 200', 14, N'59735', N'', 2, 3, CAST(7900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (669, N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 14, N'5027238', N'', 4, 4, CAST(139.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (670, N'Респиратор "Юлия" 219', 14, N'59475', N'', 4, 8, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (671, N'Респиратор "Юлия" 215', 14, N'59473', N'', 3, 4, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (672, N'Респиратор "Юлия" 209', 14, N'59470', N'', 2, 8, CAST(17900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (673, N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 14, N'5031924', N'', 5, 2, CAST(49000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (674, N'Респиратор RK6030', 14, N'5030022', N'', 3, 6, CAST(39000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (675, N'Респиратор "Алина" 310', 14, N'58850', N'', 5, 6, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (676, N'Респиратор "Нева" 310', 14, N'59739', N'', 4, 3, CAST(289.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (677, N'Респиратор "Юлия" 319', 14, N'59471', N'', 4, 8, CAST(49000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (678, N'Полумаска "Elipse" (Элипс) ABEK1P3', 14, N'5027980', N'', 2, 1, CAST(499000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (679, N'Полумаска "Elipse" (Элипс) A2P3', 11, N'5027965', N'', 4, 2, CAST(449000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (680, N'Полумаска "Elipse" (Элипс) А1', 11, N'5027958', N'', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (681, N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 11, N'59923', N'', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (682, N'Полумаска "Elipse" (Элипс) P3', 11, N'59922', N'', 5, 4, CAST(269000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (683, N'Полумаска "Elipse" (Элипс) A1P3', 11, N'59921', N'', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (684, N'Полумаска "Elipse" (Элипс) ABEK1', 11, N'59920', N'', 2, 8, CAST(569000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (685, N'Респиратор-полумаска "3М" серия 6000', 11, N'58974', N'', 5, 9, CAST(349000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (686, N'Респиратор-полумаска Исток 300/400', 11, N'59334', N'', 4, 7, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (687, N'Комплект для защиты дыхания J-SET 6500 JETA', 11, N'4969295', N'', 4, 4, CAST(249000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (688, N'Лицевая маска Elipse Integra А1P3', 11, N'5029610', N'', 2, 10, CAST(989000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (689, N'Лицевая маска Elipse Integra P3', 15, N'5029091', N'', 5, 9, CAST(7490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (690, N'Лицевая маска Elipse Integra (Элипс интегра) P3 (анти-запах)', 15, N'60360', N'', 2, 4, CAST(7590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (691, N'Полнолицевая маска 5950 JETA', 15, N'4958042', N'', 1, 5, CAST(1139000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (692, N'Сменный патрон с фильтром 6054 для масок и полумасок "3М" серии 6000', 16, N'59271', N'', 4, 2, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (693, N'Сменный патрон с фильтром 6059 для масок и полумасок "3М" серии 6000', 17, N'59253', N'', 2, 9, CAST(2290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (694, N'Сменный фильтр 6510 A1 JETA', 17, N'5028197', N'', 5, 9, CAST(99000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (695, N'Запасные фильтры к полумаске Elipse ABEK1P3', 17, N'5027978', N'', 3, 6, CAST(2990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (696, N'Запасные фильтры к полумаске Elipse A2P3', 18, N'5027961', N'', 2, 9, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (697, N'Запасные фильтры к полумаске Elipse (Элипс) А1', 18, N'5027921', N'', 3, 4, CAST(129000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (698, N'Сменный фильтр 6541 ABEK1 JETA', 17, N'4958040', N'', 4, 6, CAST(129000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (699, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (анти-запах)', 18, N'59919', N'', 4, 4, CAST(1690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (700, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 18, N'59918', N'', 4, 7, CAST(1390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (701, N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 18, N'59917', N'', 1, 3, CAST(2190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (702, N'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK1', 18, N'59916', N'', 3, 10, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (703, N'Запасные фильтры (пара) АВЕ1 к полумаскам "Адвантейдж"', 18, N'59708', N'', 2, 3, CAST(139000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (704, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка В', 18, N'67661', N'', 5, 9, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (705, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка А', 18, N'67660', N'', 3, 1, CAST(11000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (706, N'Держатель предфильтра 5101 JETA', 18, N'4958041', N'', 1, 7, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (707, N'Держатели предфильтра для масок и полумасок "3М" серии 6000', 19, N'58431', N'', 1, 4, CAST(26400.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (708, N'Предфильтр Р2 (4 шт) 6020 JETA', 19, N'4958039', N'', 1, 7, CAST(380.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (709, N'20 для масок и полумасок "3М" серии 6000', 20, N'58917', N'', 5, 3, CAST(409.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (710, N'Респиратор "Мадонна" 110', 14, N'59324', N'', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (711, N'Респиратор "Витязь" 100', 14, N'58827', N'', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (712, N'Респиратор "Серёга" 109', 14, N'59898', N'', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (713, N'Респиратор "Амперметр" 109', 14, N'59474', N'', 4, 8, CAST(12900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (714, N'Респиратор "Фирюза" 110', 14, N'59324', N'', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (715, N'Респиратор "Красный" 100', 14, N'58827', N'', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (716, N'Респиратор "Волга" 109', 14, N'59898', N'', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (717, N'Респиратор "Мадонна" 220', 14, N'59474', N'', 4, 8, CAST(12900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (718, N'Респиратор "Витязь" 220', 14, N'59324', N'', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (719, N'Респиратор "Серёга" 220', 14, N'58827', N'', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (720, N'Респиратор "Амперметр" 220', 14, N'59898', N'', 4, 1, CAST(12900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (721, N'Респиратор "Фирюза" 220', 14, N'59474', N'', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (722, N'Респиратор "Красный" 220', 14, N'59324', N'', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (723, N'Респиратор "Волга" 220', 14, N'58827', N'', 2, 8, CAST(9900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (724, N'Полумаска "Sunset" ABEK1P3', 14, N'5027980', N'', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (725, N'Полумаска "Sunset" A2P3', 11, N'5027965', N'', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (726, N'Полумаска "Sunset" А1', 11, N'5027958', N'', 2, 4, CAST(319000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (727, N'Полумаска "Sunset" P3 (анти-запах)', 11, N'59923', N'', 1, 9, CAST(279000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (728, N'Полумаска "Sunset" (Элипс) P3', 11, N'59922', N'', 5, 4, CAST(269000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (729, N'Полумаска "Sunset" A1P3', 11, N'59921', N'', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (730, N'Полумаска "Sunset" ABEK1', 11, N'59920', N'', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (731, N'Полумаска "Moon" ABEK1', 11, N'59920', N'', 2, 8, CAST(569000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (732, N'Полумаска "Moon" ABEK1P3', 14, N'5027980', N'', 2, 1, CAST(499000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (733, N'Полумаска "Moon" A2P3', 11, N'5027965', N'', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (734, N'Полумаска "Moon" А1', 11, N'5027958', N'', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (735, N'Полумаска "Moon" P3 (анти-запах)', 11, N'59923', N'', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (11, N'Полумаски', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (12, N'Повязки', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (13, N'Маски', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (14, N'Респираторы', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (15, N'На лицо', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (16, N'Полнолицевые', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (17, N'Сменные части', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (18, N'Запасные части', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (19, N'Держители', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (20, N'Предфильтры', 0)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Agent] SET  READ_WRITE 
GO
