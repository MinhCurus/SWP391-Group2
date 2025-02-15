USE [master]
GO

/****** Object:  Database [JewelryProduction]    Script Date: 6/5/2024 12:11:17 PM ******/
CREATE DATABASE [JewelryProduction]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JewelryProduction', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\JewelryProduction.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JewelryProduction_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\JewelryProduction_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JewelryProduction] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JewelryProduction].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JewelryProduction] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JewelryProduction] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JewelryProduction] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JewelryProduction] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JewelryProduction] SET ARITHABORT OFF 
GO
ALTER DATABASE [JewelryProduction] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JewelryProduction] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JewelryProduction] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JewelryProduction] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JewelryProduction] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JewelryProduction] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JewelryProduction] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JewelryProduction] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JewelryProduction] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JewelryProduction] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JewelryProduction] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JewelryProduction] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JewelryProduction] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JewelryProduction] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JewelryProduction] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JewelryProduction] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JewelryProduction] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JewelryProduction] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JewelryProduction] SET  MULTI_USER 
GO
ALTER DATABASE [JewelryProduction] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JewelryProduction] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JewelryProduction] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JewelryProduction] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JewelryProduction] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JewelryProduction] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JewelryProduction] SET QUERY_STORE = ON
GO
ALTER DATABASE [JewelryProduction] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JewelryProduction]
GO
/****** Object:  Table [dbo].[3DDesign]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[3DDesign](
	[3dDesignID] [nvarchar](50) NOT NULL,
	[designName] [nvarchar](50) NOT NULL,
	[description] [image] NOT NULL,
	[customizeRequestID] [nvarchar](50) NULL,
	[productSampleID] [nvarchar](50) NULL,
	[designStaffID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_3DDesign] PRIMARY KEY CLUSTERED 
(
	[3dDesignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[collectionID] [nvarchar](50) NOT NULL,
	[collectionName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[collectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionProduct]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionProduct](
	[collectionID] [nvarchar](50) NOT NULL,
	[productSampleID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[collectionID] ASC,
	[productSampleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRequest]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRequest](
	[customizeRequestID] [nvarchar](50) NOT NULL,
	[goldID] [nvarchar](50) NOT NULL,
	[customerID] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[style] [nvarchar](50) NOT NULL,
	[size] [float] NULL,
	[quantity] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_CustomerRequest] PRIMARY KEY CLUSTERED 
(
	[customizeRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gemstone]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

EXEC sp_rename 'Gemstone.customizeRequestD', 'customizeRequestID', 'COLUMN';
CREATE TABLE [dbo].[Gemstone](
	[gemstoneID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[caratWeight] [float] NOT NULL,
	[cut] [nvarchar](50) NOT NULL,
	[clarity] [nvarchar](50) NOT NULL,
	[pricePerCarat] [money] NOT NULL,
	[productSampleID] [nvarchar](50) NULL,
	[customizeRequestID] [nvarchar](50) NULL,
	[categoryID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gemstone] PRIMARY KEY CLUSTERED 
(
	[gemstoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gold]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gold](
	[goldID] [nvarchar](50) NOT NULL,
	[goldType] [nvarchar](50) NOT NULL,
	[weight] [float] NOT NULL,
	[pricePerGram] [money] NOT NULL,
 CONSTRAINT [PK_Gold] PRIMARY KEY CLUSTERED 
(
	[goldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[insuranceID] [nvarchar](50) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[orderID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[insuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Insurance] UNIQUE NONCLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[messageID] [nvarchar](50) NOT NULL,
	[messageText] [nvarchar](200) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[saleStaffID] [nvarchar](50) NOT NULL,
	[customerID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[messageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [nvarchar](50) NOT NULL,
	[customerID] [nvarchar](50) NOT NULL,
	[saleStaffID] [nvarchar](50) NOT NULL,
	[managerID] [nvarchar](50) NOT NULL,
	[productionStaffID] [nvarchar](50) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[depositAmount] [money] NULL,
	[status] [nvarchar](50) NOT NULL,
	[productSampleID] [nvarchar](50) NULL,
	[customizeRequestID] [nvarchar](50) NULL,
	[paymentMethodID] [nvarchar](50) NOT NULL,
	[totalPrice] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Order] UNIQUE NONCLUSTERED 
(
	[customizeRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[paymentMethodID] [nvarchar](50) NOT NULL,
	[paymentMethodName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[paymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSample]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSample](
	[productSampleID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[style] [nvarchar](50) NOT NULL,
	[size] [float] NULL,
	[price] [money] NOT NULL,
	[goldID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductSample] PRIMARY KEY CLUSTERED 
(
	[productSampleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/5/2024 12:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[phoneNumber] [decimal](18, 0) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[roleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[3DDesign]  WITH CHECK ADD  CONSTRAINT [FK_3DDesign_CustomerRequest] FOREIGN KEY([customizeRequestID])
REFERENCES [dbo].[CustomerRequest] ([customizeRequestID])
GO
ALTER TABLE [dbo].[3DDesign] CHECK CONSTRAINT [FK_3DDesign_CustomerRequest]
GO
ALTER TABLE [dbo].[3DDesign]  WITH CHECK ADD  CONSTRAINT [FK_3DDesign_ProductSample] FOREIGN KEY([productSampleID])
REFERENCES [dbo].[ProductSample] ([productSampleID])
GO
ALTER TABLE [dbo].[3DDesign] CHECK CONSTRAINT [FK_3DDesign_ProductSample]
GO
ALTER TABLE [dbo].[3DDesign]  WITH CHECK ADD  CONSTRAINT [FK_3DDesign_User] FOREIGN KEY([designStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[3DDesign] CHECK CONSTRAINT [FK_3DDesign_User]
GO
ALTER TABLE [dbo].[CollectionProduct]  WITH CHECK ADD FOREIGN KEY([collectionID])
REFERENCES [dbo].[Collection] ([collectionID])
GO
ALTER TABLE [dbo].[CollectionProduct]  WITH CHECK ADD FOREIGN KEY([productSampleID])
REFERENCES [dbo].[ProductSample] ([productSampleID])
GO
ALTER TABLE [dbo].[CustomerRequest]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRequest_Gold] FOREIGN KEY([goldID])
REFERENCES [dbo].[Gold] ([goldID])
GO
ALTER TABLE [dbo].[CustomerRequest] CHECK CONSTRAINT [FK_CustomerRequest_Gold]
GO
ALTER TABLE [dbo].[CustomerRequest]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRequest_User] FOREIGN KEY([customerID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[CustomerRequest] CHECK CONSTRAINT [FK_CustomerRequest_User]
GO
ALTER TABLE [dbo].[Gemstone]  WITH CHECK ADD  CONSTRAINT [FK_Gemstone_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gemstone] CHECK CONSTRAINT [FK_Gemstone_Category]
GO
ALTER TABLE [dbo].[Gemstone]  WITH CHECK ADD  CONSTRAINT [FK_Gemstone_CustomerRequest] FOREIGN KEY([customizeRequestD])
REFERENCES [dbo].[CustomerRequest] ([customizeRequestID])
GO
ALTER TABLE [dbo].[Gemstone] CHECK CONSTRAINT [FK_Gemstone_CustomerRequest]
GO
ALTER TABLE [dbo].[Gemstone]  WITH CHECK ADD  CONSTRAINT [FK_Gemstone_ProductSample] FOREIGN KEY([productSampleID])
REFERENCES [dbo].[ProductSample] ([productSampleID])
GO
ALTER TABLE [dbo].[Gemstone] CHECK CONSTRAINT [FK_Gemstone_ProductSample]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Order]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([saleStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User1] FOREIGN KEY([customerID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerRequest] FOREIGN KEY([customizeRequestID])
REFERENCES [dbo].[CustomerRequest] ([customizeRequestID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CustomerRequest]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentMethod] FOREIGN KEY([paymentMethodID])
REFERENCES [dbo].[PaymentMethod] ([paymentMethodID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentMethod]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ProductSample] FOREIGN KEY([productSampleID])
REFERENCES [dbo].[ProductSample] ([productSampleID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ProductSample]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([customerID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([saleStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User2] FOREIGN KEY([managerID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User2]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User3] FOREIGN KEY([productionStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User3]
GO
ALTER TABLE [dbo].[ProductSample]  WITH CHECK ADD  CONSTRAINT [FK_ProductSample_Gold1] FOREIGN KEY([goldID])
REFERENCES [dbo].[Gold] ([goldID])
GO
ALTER TABLE [dbo].[ProductSample] CHECK CONSTRAINT [FK_ProductSample_Gold1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [JewelryProduction] SET  READ_WRITE 
GO
