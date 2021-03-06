USE [master]
GO
/****** Object:  Database [ABCCompany]    Script Date: 6/17/2020 12:52:10 AM ******/
CREATE DATABASE [ABCCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABCCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ABCCompany.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ABCCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ABCCompany_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ABCCompany] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABCCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABCCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABCCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABCCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABCCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABCCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABCCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABCCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABCCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABCCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABCCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABCCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABCCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABCCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABCCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABCCompany] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ABCCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABCCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABCCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABCCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABCCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABCCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABCCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABCCompany] SET RECOVERY FULL 
GO
ALTER DATABASE [ABCCompany] SET  MULTI_USER 
GO
ALTER DATABASE [ABCCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABCCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABCCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABCCompany] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ABCCompany] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ABCCompany', N'ON'
GO
USE [ABCCompany]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/17/2020 12:52:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trades]    Script Date: 6/17/2020 12:52:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trades](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Seller] [varchar](100) NULL,
	[Buyer] [varchar](100) NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Trades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (1, N'Alice s.p.', N'Wonderland')
INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (2, N'Y-zap', N'Wonderland')
INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (3, N'Absolute', N'Mathlands')
INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (4, N'Arcus t.g.', N'Mathlands')
INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (5, N'Lil Mermaid', N'Underwater Kingdom')
INSERT [dbo].[Companies] ([Id], [Name], [Country]) VALUES (6, N'None at all', N'Nothingland')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Trades] ON 

INSERT [dbo].[Trades] ([ID], [Seller], [Buyer], [Value]) VALUES (1, N'Lil Mermaid', N'Alice s.p.', 10)
INSERT [dbo].[Trades] ([ID], [Seller], [Buyer], [Value]) VALUES (2, N'Arcus t.g.', N'Y-zap', 30)
INSERT [dbo].[Trades] ([ID], [Seller], [Buyer], [Value]) VALUES (3, N'Alice s.p.', N'Arcus t.g.', 100)
INSERT [dbo].[Trades] ([ID], [Seller], [Buyer], [Value]) VALUES (4, N'Lil Mermaid', N'Absolute', 30)
INSERT [dbo].[Trades] ([ID], [Seller], [Buyer], [Value]) VALUES (10, N'Lil Mermaid', N'Absolute', 50)
SET IDENTITY_INSERT [dbo].[Trades] OFF
/****** Object:  StoredProcedure [dbo].[usp_GetDataByCountry]    Script Date: 6/17/2020 12:52:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_GetDataByCountry]
as 
select  c.country ,isnull(sum(t.Value),0) as 'Export',isnull(sum(t1.Value),0) as 'Import' from Companies c Left join trades t on c.Name = t.Seller 
left join trades t1 on c.Name = t1.buyer group by c.country

GO
USE [master]
GO
ALTER DATABASE [ABCCompany] SET  READ_WRITE 
GO
