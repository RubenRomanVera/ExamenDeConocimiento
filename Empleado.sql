USE [master]
GO
/****** Object:  Database [ExamenDeConocimientoNet]    Script Date: 31/10/2022 02:26:53 p. m. ******/
CREATE DATABASE [ExamenDeConocimientoNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamenDeConocimientoNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ExamenDeConocimientoNet.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExamenDeConocimientoNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ExamenDeConocimientoNet_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamenDeConocimientoNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET  MULTI_USER 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamenDeConocimientoNet', N'ON'
GO
USE [ExamenDeConocimientoNet]
GO
/****** Object:  StoredProcedure [dbo].[CatPuestoGetAll]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatPuestoGetAll]
AS SELECT
IdCatPuesto,
NombrePuesto
FROM CatPuesto
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoAdd]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoAdd]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@IdCatPuesto INT
AS INSERT Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdCatPuesto)
VALUES (@Nombre,@ApellidoPaterno,@ApellidoMaterno,@IdCatPuesto)
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoDelete]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoDelete]
@Id_NumEmp INT
AS DELETE FROM Empleado WHERE Id_NumEmp=@Id_NumEmp
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoGetAll]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoGetAll]
AS SELECT
Empleado.Id_NumEmp,
Empleado.Nombre,
Empleado.ApellidoPaterno,
Empleado.ApellidoMaterno,
Empleado.IdCatPuesto,
CatPuesto.NombrePuesto
FROM Empleado
INNER JOIN CatPuesto
ON Empleado.IdCatPuesto=CatPuesto.IdCatPuesto
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoGetById]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoGetById]
@Id_NumEmp INT
AS SELECT
Empleado.Id_NumEmp,
Empleado.Nombre,
Empleado.ApellidoPaterno,
Empleado.ApellidoMaterno,
Empleado.IdCatPuesto,
CatPuesto.NombrePuesto
FROM Empleado
INNER JOIN CatPuesto
ON Empleado.IdCatPuesto=CatPuesto.IdCatPuesto
WHERE Id_NumEmp=@Id_NumEmp
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoUpdate]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoUpdate]
@Id_NumEmp INT,
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@IdCatPuesto INT
AS UPDATE Empleado
SET Nombre=@Nombre,ApellidoPaterno=@ApellidoPaterno,ApellidoMaterno=@ApellidoMaterno,IdCatPuesto=@IdCatPuesto
WHERE Id_NumEmp=@Id_NumEmp
GO
/****** Object:  StoredProcedure [dbo].[T_EMPLEADO_GetAll]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T_EMPLEADO_GetAll]
AS SELECT
T_EMPLEADO.Id_NumEmp,
T_EMPLEADO.Nombre,
T_EMPLEADO.ApellidoPaterno,
T_EMPLEADO.ApellidoMaterno,
T_EMPLEADO.IdCatPuesto,
T_CAT_PUESTO.NombrePuesto
FROM T_EMPLEADO
INNER JOIN T_CAT_PUESTO
ON T_EMPLEADO.IdCatPuesto=T_CAT_PUESTO.IdCatPuesto
GO
/****** Object:  Table [dbo].[CatPuesto]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CatPuesto](
	[IdCatPuesto] [int] IDENTITY(1,1) NOT NULL,
	[NombrePuesto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCatPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 31/10/2022 02:26:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id_NumEmp] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[IdCatPuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_NumEmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdCatPuesto])
REFERENCES [dbo].[CatPuesto] ([IdCatPuesto])
GO
USE [master]
GO
ALTER DATABASE [ExamenDeConocimientoNet] SET  READ_WRITE 
GO
