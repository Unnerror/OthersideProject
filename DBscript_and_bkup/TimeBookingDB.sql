USE [master]
GO
/****** Object:  Database [Otherside_2]    Script Date: 03/04/2024 14:36:57 ******/
CREATE DATABASE [Otherside_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Otherside_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Otherside_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Otherside_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Otherside_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Otherside_2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Otherside_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Otherside_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Otherside_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Otherside_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Otherside_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Otherside_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Otherside_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Otherside_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Otherside_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Otherside_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Otherside_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Otherside_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Otherside_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Otherside_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Otherside_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Otherside_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Otherside_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Otherside_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Otherside_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Otherside_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Otherside_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Otherside_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Otherside_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Otherside_2] SET RECOVERY FULL 
GO
ALTER DATABASE [Otherside_2] SET  MULTI_USER 
GO
ALTER DATABASE [Otherside_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Otherside_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Otherside_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Otherside_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Otherside_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Otherside_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Otherside_2', N'ON'
GO
ALTER DATABASE [Otherside_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Otherside_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Otherside_2]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [char](10) NOT NULL,
	[UserName] [varchar](64) NULL,
	[E_mail] [varchar](64) NULL,
	[Address] [varchar](64) NULL,
	[Phone_Num] [varchar](15) NULL,
	[BirthDay] [date] NULL,
	[Gender] [varchar](20) NULL,
	[ID_id] [varchar](20) NULL,
	[Agreement] [bit] NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [char](10) NOT NULL,
	[RoomName] [varchar](64) NULL,
	[Capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [char](10) NULL,
	[RoomID] [char](10) NULL,
	[PrepationTime] [datetime] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[Status] [varchar](10) NULL,
	[Purpose] [varchar](64) NULL,
	[NumberGuest] [int] NULL,
	[UserComment] [char](512) NULL,
	[AdminComment] [char](512) NULL,
	[ForeheadVisitTime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BookingSummaryView]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BookingSummaryView] AS
SELECT 
    rs.ReservationID,
    u.UserName,
    u.E_mail,
    u.Address,
    u.Phone_Num,
    rs.StartTime,
    rs.EndTime,
    rs.TotalPrice,
    rs.Status,
    rs.Purpose,
    rs.NumberGuest,
    rs.UserComment,
    rs.AdminComment,
    rs.ForeheadVisitTime,
    r.RoomName,
    r.Capacity
FROM 
    Reservation rs
INNER JOIN 
    [User] u ON rs.UserID = u.UserID
INNER JOIN 
    Room r ON rs.RoomID = r.RoomID;
GO
/****** Object:  UserDefinedFunction [dbo].[RoomAvailabilityCalenderFunction]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[RoomAvailabilityCalenderFunction] (@RoomID INT, @StartDate DATETIME, @EndDate DATETIME)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        r.RoomID,
        r.RoomName,
        DATEADD(HOUR, SlotNumber, @StartDate) AS StartTime,
        DATEADD(HOUR, SlotNumber + 1, @StartDate) AS EndTime
    FROM 
        Room r
    CROSS JOIN
        (SELECT ROW_NUMBER() OVER (ORDER BY number) - 1 AS SlotNumber
         FROM master.dbo.spt_values
         WHERE type = 'P' AND number BETWEEN 0 AND DATEDIFF(HOUR, @StartDate, @EndDate)) AS TimeSlots
    LEFT JOIN 
        Reservation rs ON r.RoomID = rs.RoomID
        AND rs.RoomID = @RoomID
        AND DATEADD(HOUR, SlotNumber, @StartDate) < rs.EndTime 
        AND DATEADD(HOUR, SlotNumber + 1, @StartDate) > rs.StartTime
    WHERE
        r.RoomID = @RoomID
        AND rs.ReservationID IS NULL
);

GO
/****** Object:  UserDefinedFunction [dbo].[RoomAvailabilityOnDayFunction]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RoomAvailabilityOnDayFunction] (@Date DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        r.RoomID,
        r.RoomName,
        @Date AS Date,
        CONCAT(DATEPART(HOUR, Slot.StartTime), ':', RIGHT('00' + CAST(DATEPART(MINUTE, Slot.StartTime) AS VARCHAR(2)), 2), '-', DATEPART(HOUR, Slot.EndTime), ':', RIGHT('00' + CAST(DATEPART(MINUTE, Slot.EndTime) AS VARCHAR(2)), 2)) AS TimeSlot,
        CASE 
            WHEN rs.ReservationID IS NULL THEN 'Available'
            ELSE 'Booked'
        END AS Availability
    FROM 
        Room r
    CROSS APPLY (
        SELECT 
            DATEADD(HOUR, number, CAST(@Date AS DATETIME)) AS StartTime,
            DATEADD(HOUR, number + 1, CAST(@Date AS DATETIME)) AS EndTime
        FROM 
            master.dbo.spt_values
        WHERE 
            type = 'P' AND 
            number >= 0 AND 
            number < 24
    ) AS Slot
    LEFT JOIN 
        Reservation rs ON r.RoomID = rs.RoomID
        AND rs.StartTime < Slot.EndTime
        AND rs.EndTime > Slot.StartTime
);


GO
/****** Object:  Table [dbo].[BookingRules]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRules](
	[RuleID] [int] NOT NULL,
	[RoomID] [char](10) NULL,
	[DayofWeek] [char](10) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[PricePerHour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ID]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ID](
	[ID_id] [char](10) NOT NULL,
	[UserID] [char](10) NULL,
	[DocumentTypeNumber] [char](64) NULL,
	[IssueDate] [date] NULL,
	[IssuingOffice] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingRules]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ID]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ID]  WITH CHECK ADD  CONSTRAINT [FK_ID_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ID] CHECK CONSTRAINT [FK_ID_User]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[CalculateReservationPrice]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Alter the stored procedure to accept input parameters and return the total price as an output parameter
CREATE PROCEDURE [dbo].[CalculateReservationPrice]
    @RoomID CHAR(10),
    @ReservationStartTime DATETIME,
    @ReservationEndTime DATETIME,
    @TotalPrice DECIMAL(10, 2) OUTPUT
AS
BEGIN
    -- Declare variables
    DECLARE @CurrentHour DATETIME = @ReservationStartTime;
    DECLARE @PricePerHour DECIMAL(10, 2);

    -- Initialize total price
    SET @TotalPrice = 0;

    -- Iterate over each hour of the reservation
    WHILE @CurrentHour < @ReservationEndTime
    BEGIN
        -- Get the applicable booking rule for the current hour
        SELECT TOP 1 @PricePerHour = PricePerHour
        FROM BookingRules
        WHERE RoomID = @RoomID
            AND DayOfWeek = DATENAME(WEEKDAY, @CurrentHour)
            AND CAST(StartTime AS TIME) <= CAST(@CurrentHour AS TIME)
            AND CAST(EndTime AS TIME) > CAST(@CurrentHour AS TIME)
        ORDER BY StartTime;

        -- Add the price for the current hour to the total price
        SET @TotalPrice = @TotalPrice + @PricePerHour;

        -- Move to the next hour
        SET @CurrentHour = DATEADD(HOUR, 1, @CurrentHour);
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[CancelReservation]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelReservation]
    @ReservationID INT
AS
BEGIN
    -- Get reservation details
    DECLARE @RoomID INT, @StartTime DATETIME, @EndTime DATETIME;

    SELECT @RoomID = RoomID, @StartTime = StartTime, @EndTime = EndTime
    FROM Reservation
    WHERE ReservationID = @ReservationID;

    -- Update Reservation status to 'Canceled'
    UPDATE Reservation
    SET Status = 'Canceled',
        AdminComment = 'Reservation canceled. RoomID: ' + CAST(@RoomID AS NVARCHAR(10)) +
                       ', Start Time: ' + CAST(@StartTime AS NVARCHAR(50)) +
                       ', End Time: ' + CAST(@EndTime AS NVARCHAR(50))
    WHERE ReservationID = @ReservationID;

    -- Set RoomID, StartTime, and EndTime to NULL
    UPDATE Reservation
    SET RoomID = NULL,
		PrepationTime = NULL,
        StartTime = NULL,
        EndTime = NULL 
    WHERE ReservationID = @ReservationID;

    PRINT 'Reservation canceled successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the new CreateReservation procedure
CREATE PROCEDURE [dbo].[CreateReservation]
    @RoomID CHAR(10),
    @ReservationStartDate DATETIME,
    @ReservationEndDate DATETIME,
    @PreparationTime DATETIME,
    @Purpose VARCHAR(64),
    @NumberGuest INT,
    @UserComment CHAR(512) = NULL,
    @AdminComment CHAR(512) = NULL,
    @ForeheadVisitTime DATETIME = NULL,
    @UserName VARCHAR(64),
    @E_mail VARCHAR(64),
    @Phone_Num VARCHAR(15)
AS
BEGIN
    DECLARE @TotalPrice DECIMAL(10, 2);

    -- Calculate the total price for the reservation using the CalculateReservationPrice stored procedure
    EXEC CalculateReservationPrice @RoomID, @ReservationStartDate, @ReservationEndDate, @TotalPrice OUTPUT;

    -- Check if the user already exists in the User table
    IF NOT EXISTS (SELECT 1 FROM [User] WHERE E_mail = @E_mail OR Phone_Num = @Phone_Num)
    BEGIN
        -- Insert the new user into the User table
        INSERT INTO [User] (UserID, UserName, E_mail, Phone_Num)
        VALUES (@UserName, @UserName, @E_mail, @Phone_Num);
    END;

    -- Retrieve the UserID for the user
    DECLARE @UserID CHAR(10) = (SELECT UserID FROM [User] WHERE E_mail = @E_mail OR Phone_Num = @Phone_Num);

    -- Check if the room is available for the specified time slot
    IF NOT EXISTS (
        SELECT 1
        FROM Reservation
        WHERE RoomID = @RoomID
            AND StartTime < @ReservationEndDate
            AND EndTime > @ReservationStartDate
    )
    BEGIN
        -- Insert the reservation data into the Reservation table
        BEGIN TRY
            INSERT INTO Reservation (UserID, RoomID, PrepationTime, StartTime, EndTime, TotalPrice, Status, Purpose, NumberGuest, UserComment, AdminComment, ForeheadVisitTime)
            VALUES (@UserID, @RoomID, @PreparationTime, @ReservationStartDate, @ReservationEndDate, @TotalPrice, 'Active', @Purpose, @NumberGuest, @UserComment, @AdminComment, @ForeheadVisitTime);
        END TRY
        BEGIN CATCH
            -- Handle errors if needed
            PRINT 'Error occurred while inserting reservation.';
        END CATCH;

        -- Display the inserted reservation record
        SELECT * FROM Reservation WHERE UserID = @UserID AND RoomID = @RoomID AND StartTime = @ReservationStartDate;
    END
    ELSE
    BEGIN
        -- Display a message indicating that the room is already booked during the specified time slot
        PRINT 'Room is already booked during the specified time slot. Double booking not allowed.';
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateReservation]    Script Date: 03/04/2024 14:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReservation]
    @ReservationID INT,
    @NewStartTime DATETIME = NULL,
    @NewEndTime DATETIME = NULL,
    @NewAdminComment CHAR(512) = NULL,
    @NewForeheadVisitTime DATETIME = NULL,
    @NewNumberGuest INT = NULL
AS
BEGIN
    DECLARE @TotalPrice DECIMAL(10, 2);

    -- Calculate the total price for the updated reservation if the time slot is changing
    IF @NewStartTime IS NOT NULL AND @NewEndTime IS NOT NULL
    BEGIN
        -- Check if the room is available for the new time slot
        IF NOT EXISTS (
            SELECT 1
            FROM Reservation
            WHERE RoomID = (SELECT RoomID FROM Reservation WHERE ReservationID = @ReservationID)
                AND StartTime < @NewEndTime
                AND EndTime > @NewStartTime
                AND ReservationID != @ReservationID
        )
        BEGIN
            -- Retrieve the existing reservation details
            DECLARE @RoomID CHAR(10);

            SELECT @RoomID = RoomID
            FROM Reservation
            WHERE ReservationID = @ReservationID;

            -- Calculate the total price for the updated reservation
            EXEC CalculateReservationPrice @RoomID, @NewStartTime, @NewEndTime, @TotalPrice OUTPUT;
        END
        ELSE
        BEGIN
            PRINT 'The new time slot is not available. Reservation update failed.';
            RETURN;
        END;
    END;

    -- Update the reservation data in the Reservation table
    BEGIN TRY
        UPDATE Reservation
        SET StartTime = ISNULL(@NewStartTime, StartTime),
            EndTime = ISNULL(@NewEndTime, EndTime),
            AdminComment = ISNULL(@NewAdminComment, AdminComment),
            ForeheadVisitTime = ISNULL(@NewForeheadVisitTime, ForeheadVisitTime),
            NumberGuest = ISNULL(@NewNumberGuest, NumberGuest),
            TotalPrice = ISNULL(@TotalPrice, TotalPrice)
        WHERE ReservationID = @ReservationID;
    END TRY
    BEGIN CATCH
        -- Handle errors if needed
        PRINT 'Error occurred while updating reservation.';
    END CATCH;

    -- Display the updated reservation record
    SELECT * FROM Reservation WHERE ReservationID = @ReservationID;
END;
GO
USE [master]
GO
ALTER DATABASE [Otherside_2] SET  READ_WRITE 
GO
