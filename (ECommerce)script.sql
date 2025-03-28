USE [master]
GO
/****** Object:  Database [E-Commerce]    Script Date: 24-03-2025 08:18:37 ******/
CREATE DATABASE [E-Commerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-Commerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\E-Commerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-Commerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\E-Commerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E-Commerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Commerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Commerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Commerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Commerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Commerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Commerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Commerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Commerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Commerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Commerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Commerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Commerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Commerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Commerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Commerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Commerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Commerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Commerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Commerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Commerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-Commerce] SET  MULTI_USER 
GO
ALTER DATABASE [E-Commerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Commerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-Commerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-Commerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-Commerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-Commerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E-Commerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [E-Commerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E-Commerce]
GO
/****** Object:  Table [dbo].[Cart_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Table](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Table](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CategoryImageUrl] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_table](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Subject] [varchar](200) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Table](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserID] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsCancel] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Table](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CardNon] [varchar](50) NOT NULL,
	[ExpiryDate] [varchar](50) NOT NULL,
	[CvvNo] [int] NULL,
	[Address] [varchar](max) NOT NULL,
	[PaymentMode] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Table](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](200) NULL,
	[LongDescription] [varchar](max) NULL,
	[AdditionalDescription] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NOT NULL,
	[Size] [varchar](30) NULL,
	[Color] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[Categoryid] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Sold] [int] NULL,
	[IsCustomised] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages_Table](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [varchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[DefaultImage] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview_Table](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[comment] [varchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Table](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory_Table](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [varchar](100) NOT NULL,
	[Categoryid] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Table](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Mobile] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wishlist_Table]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist_Table](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders_Table] ADD  DEFAULT ((0)) FOR [IsCancel]
GO
ALTER TABLE [dbo].[Cart_Table]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_Table] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart_Table]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users_Table] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders_Table]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment_Table] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders_Table]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_Table] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders_Table]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users_Table] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Table]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[Category_Table] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages_Table]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_Table] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview_Table]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_Table] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview_Table]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users_Table] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategory_Table]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[Category_Table] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users_Table]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles_Table] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[wishlist_Table]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_Table] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[wishlist_Table]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users_Table] ([UserID])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 24-03-2025 08:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(15),
	@CategoryId INT = NULL,
	@CategoryName VARCHAR(100) = NULL,
	@CategoryImageUrl VARCHAR(MAX)= NULL,
	@IsActive BIT =FALSE

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- GET ALL CATEGORY
	IF (@Action = 'GETALL')
	BEGIN
		SELECT * FROM Category_Table
	END

	    -- GET CATEGORY BY Id
	IF (@Action = 'GETBYID')
	BEGIN
		SELECT * FROM Category_Table
		where CategoryId=@CategoryId
	END

	-- INSERT CATEGORY
	IF (@Action = 'INSERT')
	BEGIN
		INSERT INTO Category_Table(CategoryName, CategoryImageUrl, IsActive, CreatedDate)
		VALUES(@CategoryName, @CategoryImageUrl, @IsActive, GETDATE())
	END

	-- UPDATE CATEGORY
	IF (@Action = 'UPDATE')
	BEGIN
		DECLARE @UPDATE_IMAGE VARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @CategoryImageUrl Is NULL THEN 'NO' ELSE 'YES' END)
		IF (@UPDATE_IMAGE = 'NO')
			BEGIN
				UPDATE Category_Table
				SET CategoryName=@CategoryName, IsActive=@IsActive
				WHERE CategoryId=@CategoryId
			END
		ELSE
			BEGIN
				UPDATE Category_Table
				SET CategoryName=@CategoryName, CategoryImageUrl=@CategoryImageUrl, IsActive=@IsActive
				WHERE CategoryId=@CategoryId
			END
	END

	--DELETE CATEGORY
	IF (@Action = 'DELETE')
	BEGIN
		DELETE FROM Category_Table 
		WHERE CategoryId=@CategoryId
	END

	--GET ACTIVE CATEGORY BY CategoryId
	IF(@Action = 'ACTIVECATEGORY')
	BEGIN
		SELECT * FROM Category_Table c
		WHERE c.IsActive = 1 ORDER BY c.CategoryName
	END
END
GO
USE [master]
GO
ALTER DATABASE [E-Commerce] SET  READ_WRITE 
GO
