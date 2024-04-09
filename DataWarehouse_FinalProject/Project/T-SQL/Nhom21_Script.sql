---------Môn học: Kho dữ liệu
---------Nhóm: 21
-------- Tên đề tài: Hệ thống quản lý và phân tích dữ liệu khách hàng qua các chiến dịch Marketing
--------------------Phần I: Tạo bảng 
-- CREATE DATABASE
CREATE DATABASE DataLake_MarketingAnalytics;
CREATE DATABASE DataWarehouse_MarketingAnalytics;

--DROP DATABASE DataLake_MarketingAnalytics;
--DROP DATABASE DataWarehouse_MarketingAnalytics;

-- OPERATIONS ON Datalake_MarketingAnalytics
USE Datalake_MarketingAnalytics;

--DROP TABLE dbo.Null_Data;
--DROP TABLE dbo.Clean_Data;
--DROP TABLE dbo.Original_Data;

--SELECT * FROM dbo.Original_Data;
--SELECT * FROM dbo.Clean_Data;
--SELECT * FROM dbo.Null_Data;

--DELETE FROM dbo.Null_Data;
--DELETE FROM dbo.Clean_Data;
--DELETE FROM dbo.Original_Data;

CREATE TABLE [Original_Data] (
    [User_ID] int,
    [Year_Birth] int,
    [Education] varchar(50),
    [Marital_Status] varchar(50),
    [Income] float,
    [Kidhome] int,
    [Teenhome] int,
    [Date_Enroll] date,
    [Recency] int,
    [MntWines] float,
    [MntFruits] float,
    [MntMeats] float,
    [MntFishs] float,
    [MntSweets] float,
    [MntGolds] float,
    [NumDealsPurchases] int,
    [NumWebPurchases] int,
    [NumCatalogPurchases] int,
    [NumStorePurchases] int,
    [NumWebVisitsMonth] int,
    [AcceptedCmp3] int,
    [AcceptedCmp4] int,
    [AcceptedCmp5] int,
    [AcceptedCmp1] int,
    [AcceptedCmp2] int,
    [Response] int,
    [Complain] int,
    [Country] varchar(50)
)

CREATE TABLE [Clean_Data] (
    [User_ID] int,
    [Year_Birth] int,
    [Education] varchar(50),
    [Marital_Status] varchar(50),
    [Income] float,
    [Kidhome] int,
    [Teenhome] int,
    [Date_Enroll] date,
    [Recency] int,
    [MntWines] float,
    [MntFruits] float,
    [MntMeats] float,
    [MntFishs] float,
    [MntSweets] float,
    [MntGolds] float,
    [NumDealsPurchases] int,
    [NumWebPurchases] int,
    [NumCatalogPurchases] int,
    [NumStorePurchases] int,
    [NumWebVisitsMonth] int,
    [AcceptedCmp3] int,
    [AcceptedCmp4] int,
    [AcceptedCmp5] int,
    [AcceptedCmp1] int,
    [AcceptedCmp2] int,
    [Response] int,
    [Complain] int,
    [Country] varchar(50)
)

CREATE TABLE [Null_Data] (
    [User_ID] int,
    [Year_Birth] int,
    [Education] varchar(50),
    [Marital_Status] varchar(50),
    [Income] float,
    [Kidhome] int,
    [Teenhome] int,
    [Date_Enroll] date,
    [Recency] int,
    [MntWines] float,
    [MntFruits] float,
    [MntMeats] float,
    [MntFishs] float,
    [MntSweets] float,
    [MntGolds] float,
    [NumDealsPurchases] int,
    [NumWebPurchases] int,
    [NumCatalogPurchases] int,
    [NumStorePurchases] int,
    [NumWebVisitsMonth] int,
    [AcceptedCmp3] int,
    [AcceptedCmp4] int,
    [AcceptedCmp5] int,
    [AcceptedCmp1] int,
    [AcceptedCmp2] int,
    [Response] int,
    [Complain] int,
    [Country] varchar(50)
)

-- OPERATIONS ON DataWarehouse_MarketingAnalytics
USE DataWarehouse_MarketingAnalytics;

--DROP TABLE dbo.Dim_Customer;
--DROP TABLE dbo.Dim_Date;
--DROP TABLE dbo.Fact_MarketingAnalytic;

--SELECT * FROM dbo.Fact_MarketingAnalytic;
--SELECT * FROM dbo.Dim_Customer;
--SELECT * FROM dbo.Dim_Date;

--DELETE FROM dbo.Fact_MarketingAnalytic;
--DELETE FROM dbo.Dim_Customer;
--DELETE FROM dbo.Dim_Date;

CREATE TABLE [Dim_Customer] (
    [User_ID] int not null,
    [Year_Birth] int,
    [Education] varchar(50),
    [Marital_Status] varchar(50),
    [Income] float,
    [Kidhome] int,
    [Teenhome] int,
    [Country] varchar(50),
	constraint PK_DIM_CUS primary key(User_ID)
)

CREATE TABLE [Dim_Date] (
    [Date_ID] date not null,
    [Year] int,
    [Quater] int,
    [Month] int,
    [Day] int,
	constraint PK_DIM_DATE primary key(Date_ID)
)

CREATE TABLE [Fact_MarketingAnalytic] (
    [User_ID] int,
    [Date_ID] date,
    [Recency] int,
    [MntWines] float,
    [MntFruits] float,
    [MntMeats] float,
    [MntFishs] float,
    [MntSweets] float,
    [MntGolds] float,
    [NumDealsPurchases] int,
    [NumWebPurchases] int,
    [NumCatalogPurchases] int,
    [NumStorePurchases] int,
    [NumWebVisitsMonth] int,
    [Response] int,
    [Complain] int,
    [Total_Campaigns_Accepted] int,
    [Total_Spent] float,
	constraint PK_FACT primary key(User_ID, Date_ID)
)
------------------------------------------Phần II: Câu lệnh trong SQl-Statement 
-- CLEAN DATA LAKE
if exists (select name from sys.Tables where name = 'Original_Data')
	begin
		DELETE FROM Original_Data;
	end
go

if exists (select name from sys.Tables where name = 'Clean_Data')
	begin
		DELETE FROM Clean_Data;
	end
go

if exists (select name from sys.Tables where name = 'Null_Data')
	begin
		DELETE FROM Null_Data;
	end
go

-- CHANGE DATA TYPE ORIGINAL_DATA TABLE
[User_ID] int,
[Year_Birth] int,
[Education] varchar(50),
[Marital_Status] varchar(50),
[Income] float,
[Kidhome] int,
[Teenhome] int,
[Date_Enroll] date,
[Recency] int,
[MntWines] float,
[MntFruits] float,
[MntMeats] float,
[MntFishs] float,
[MntSweets] float,
[MntGolds] float,
[NumDealsPurchases] int,
[NumWebPurchases] int,
[NumCatalogPurchases] int,
[NumStorePurchases] int,
[NumWebVisitsMonth] int,
[AcceptedCmp3] int,
[AcceptedCmp4] int,
[AcceptedCmp5] int,
[AcceptedCmp1] int,
[AcceptedCmp2] int,
[Response] int,
[Complain] int,
[Country] varchar(50)

-- CONDITIONAL SPLIT NULL
ISNULL( [User_ID]  ) || ISNULL( [Year_Birth] ) || ISNULL( [Education] ) || ISNULL( [Marital_Status] ) || ISNULL( [Income] ) || ISNULL( [Kidhome] ) || ISNULL( [Teenhome] ) || ISNULL( [Date_Enroll] ) || ISNULL( [Recency] ) || ISNULL( [MntWines] ) || ISNULL( [MntFruits] ) || ISNULL( [MntMeats] ) || ISNULL( [MntFishs] ) || ISNULL( [MntSweets] ) || ISNULL( [MntGolds] ) || ISNULL( [NumDealsPurchases] ) || ISNULL( [NumWebPurchases] ) || ISNULL( [NumCatalogPurchases] ) || ISNULL( [NumStorePurchases] ) || ISNULL( [NumWebVisitsMonth] ) || ISNULL( [AcceptedCmp3] ) || ISNULL( [AcceptedCmp4] ) || ISNULL( [AcceptedCmp5] ) || ISNULL( [AcceptedCmp1] ) || ISNULL( [AcceptedCmp2] ) || ISNULL( [Response] ) || ISNULL( [Complain] ) || ISNULL( [Country])

-- DERIVED COLUMN FACT_TABLE
Total_Campaigns_Accepted | AcceptedCmp3 + AcceptedCmp4 + AcceptedCmp5 + AcceptedCmp1 + AcceptedCmp2
Total_Spent | MntWines + MntFruits + MntMeats + MntFishs + MntSweets + MntGolds

-- SET FOREIGN KEYS
if not exists (select name from sys.foreign_keys where name = 'FK_FACT_CUS')
	begin
		ALTER TABLE Fact_MarketingAnalytic
		ADD CONSTRAINT FK_FACT_CUS
		FOREIGN KEY(User_ID) REFERENCES Dim_Customer(User_ID);
	end
GO

if not exists (select name from sys.foreign_keys where name = 'FK_FACT_DATE')
	begin
		ALTER TABLE Fact_MarketingAnalytic
		ADD CONSTRAINT FK_FACT_DATE
		FOREIGN KEY(Date_ID) REFERENCES Dim_Date(Date_ID);
	end
GO
