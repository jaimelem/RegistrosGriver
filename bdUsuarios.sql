USE [master]
GO
/****** Object:  Database [usuarios]    Script Date: 24/09/2018 01:14:02 p. m. ******/
CREATE DATABASE [usuarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'usuarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\usuarios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'usuarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\usuarios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [usuarios] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [usuarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [usuarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [usuarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [usuarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [usuarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [usuarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [usuarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [usuarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [usuarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [usuarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [usuarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [usuarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [usuarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [usuarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [usuarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [usuarios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [usuarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [usuarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [usuarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [usuarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [usuarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [usuarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [usuarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [usuarios] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [usuarios] SET  MULTI_USER 
GO
ALTER DATABASE [usuarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [usuarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [usuarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [usuarios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [usuarios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [usuarios] SET QUERY_STORE = OFF
GO
USE [usuarios]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [usuarios]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](25) NOT NULL,
	[apellidos] [varchar](25) NOT NULL,
	[fecha_registro] [date] NOT NULL,
	[sexo] [varchar](25) NOT NULL,
	[region] [varchar](25) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](25) NOT NULL,
	[apellidos] [varchar](25) NOT NULL,
	[numero_tel] [int] NOT NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AgregarEditarCliente]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AgregarEditarCliente]
@id_cliente int,
@nombres varchar(25),
@apellidos varchar(25),
@fecha_registro date,
@sexo varchar(1),
@region varchar(25)
AS

IF @id_cliente = 0
	INSERT INTO cliente(nombres,apellidos,fecha_registro,sexo,region)
	VALUES (@nombres,@apellidos,@fecha_registro,@sexo,@region)
ELSE
	UPDATE cliente
	SET
	nombres = @nombres,
	apellidos = @apellidos,
	fecha_registro = @fecha_registro,
	sexo = @sexo,
	region = @region
WHERE id_cliente = @id_cliente
GO
/****** Object:  StoredProcedure [dbo].[AgregarEditarContacto]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AgregarEditarContacto]
@id_contacto int,
@nombres varchar(25),
@apellidos varchar(25),
@numero_tel int
AS

IF @id_contacto = 0
	INSERT INTO detalle(nombres,apellidos,numero_tel)
	VALUES (@nombres,@apellidos,@numero_tel)
ELSE
	UPDATE detalle
	SET
	nombres = @nombres,
	apellidos = @apellidos,
	numero_tel = @numero_tel
WHERE id_contacto = @id_contacto
GO
/****** Object:  StoredProcedure [dbo].[BorrarClientePorId]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BorrarClientePorId]
@id_cliente int
AS
	DELETE FROM cliente
	WHERE id_cliente = @id_cliente
GO
/****** Object:  StoredProcedure [dbo].[BorrarContactoPorId]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BorrarContactoPorId]
@id_contacto int
AS
	DELETE FROM detalle
	WHERE id_contacto = @id_contacto
GO
/****** Object:  StoredProcedure [dbo].[VerClientePorId]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VerClientePorId]
@id_cliente int
AS
	SELECT *
	FROM cliente
	WHERE id_cliente = @id_cliente
GO
/****** Object:  StoredProcedure [dbo].[VerContactoPorId]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VerContactoPorId]
@id_contacto int
AS
	SELECT *
	FROM detalle
	WHERE id_contacto = @id_contacto
GO
/****** Object:  StoredProcedure [dbo].[VerTodosLosClientes]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VerTodosLosClientes]
AS
	SELECT *
	FROM cliente
GO
/****** Object:  StoredProcedure [dbo].[VerTodosLosContactos]    Script Date: 24/09/2018 01:14:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VerTodosLosContactos]
AS
	SELECT *
	FROM detalle
GO
USE [master]
GO
ALTER DATABASE [usuarios] SET  READ_WRITE 
GO
