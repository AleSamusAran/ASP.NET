USE [master]
GO
/****** Object:  Database [Biblioteca]    Script Date: 31/10/2018 12:44:20 ******/
CREATE DATABASE [Biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Biblioteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE = OFF
GO
USE [Biblioteca]
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
USE [Biblioteca]
GO
/****** Object:  UserDefinedTableType [dbo].[TAutores]    Script Date: 31/10/2018 12:44:20 ******/
CREATE TYPE [dbo].[TAutores] AS TABLE(
	[IdAutor] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Nacionalidad] [int] NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAutores]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaAutores]
AS
SELECT        a.ID, a.Apellido + ', ' + a.Nombre AS Autor, a.FechaNacimiento AS FechadeNacimiento, p.Descripcion AS Pais
FROM            dbo.Autores AS a INNER JOIN
                         dbo.Paises AS p ON a.Nacionalidad = p.ID

GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ISBN] [nvarchar](17) NOT NULL,
	[Titulo] [nvarchar](50) NULL,
	[Edicion] [int] NULL,
	[IdGenero] [int] NULL,
	[IdEditorial] [int] NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaLibros]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaLibros]
AS
SELECT        l.ISBN, l.Titulo, l.Edicion AS AñoEditado, l.IdGenero AS CodigoGenero, g.Descripcion AS Genero, e.Descripcion AS Editorial, l.IdEditorial AS CodigoEditorial
FROM            dbo.Libros AS l INNER JOIN
                         dbo.Generos AS g ON g.ID = l.IdGenero INNER JOIN
                         dbo.Editoriales AS e ON e.ID = l.IdEditorial

GO
/****** Object:  Table [dbo].[LibrosAutores]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosAutores](
	[ISBN] [nvarchar](17) NOT NULL,
	[IdAutor] [int] NOT NULL,
 CONSTRAINT [PK_LibrosAutores] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogLibros]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogLibros](
	[Usuario] [nchar](10) NULL,
	[Fecha] [datetime] NULL,
	[ISBN] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockNovelas]    Script Date: 31/10/2018 12:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockNovelas](
	[Stock] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (1, N'Borges', N'Jorge Luis', CAST(N'1899-08-08' AS Date), 5)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (3, N'Cortazar', N'Julio', CAST(N'1943-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (4, N'Garcia Marquez', N'Gabriel', CAST(N'1917-12-20' AS Date), 10)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (5, N'Bioy Casares', N'Adolfo', CAST(N'1927-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (7, N'Galeano', N'Eduardo', CAST(N'1971-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (9, N'Vargas Llosa', N'Mario', CAST(N'1954-12-20' AS Date), 5)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (10, N'Benedetti', N'Mario', CAST(N'1923-10-10' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (11, N'Paz', N'Octavio', CAST(N'1914-03-31' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (12, N'Mistral', N'Gabriela', CAST(N'1889-04-07' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (13, N'Allende', N'Isabel', CAST(N'1942-08-02' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (14, N'Hernandez', N'Jose', CAST(N'1834-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (15, N'Arlt', N'Roberto', CAST(N'1900-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (16, N'Coelho', N'Paulo', CAST(N'1947-11-10' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (17, N'Rulfo', N'Juan', CAST(N'1917-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (18, N'Mujica Lainez', N'Manuel', CAST(N'1920-12-26' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (19, N'Sarmiento', N'Domingo', CAST(N'1812-01-12' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (20, N'Tofler', N'Alvin', CAST(N'1939-12-26' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (24, N'Dominguez', N'Carlos', CAST(N'1991-10-24' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (25, N'Iglesias', N'Camila', CAST(N'1991-04-25' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (26, N'Velasquez', N'Julio', CAST(N'1991-10-24' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (27, N'Fernandez', N'Maria Jose', CAST(N'1990-02-02' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (28, N'De Mendoza', N'Pedro', CAST(N'1967-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (30, N'Mereles', N'Matias', CAST(N'2018-01-19' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (31, N'Prodan', N'Lucas', CAST(N'1994-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (32, N'Moreira', N'Juan', CAST(N'1994-01-01' AS Date), 9)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (33, N'Prado', N'Gilbert', CAST(N'1978-07-07' AS Date), 9)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (34, N'Michelli', N'Fran', CAST(N'1986-05-08' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (35, N'Reser', N'Juan Francisco', CAST(N'2000-05-08' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (36, N'Scavuzzo', N'Ivo', CAST(N'1989-05-08' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [Nacionalidad]) VALUES (37, N'Ortiz', N'Felipe', CAST(N'1990-09-05' AS Date), 10)
GO
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (1, N'Sudamericana')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (2, N'El Ateneo')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (3, N'Alfaguara')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (4, N'Planeta Editores')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (5, N'Kapeluz')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (6, N'Edhasa')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (7, N'Planeta')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (8, N'Eudeba')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (9, N'Pearson')
GO
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (1, N'Cuentos')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (2, N'Novelas')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (3, N'Ciencia Ficcion')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (4, N'Policial')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (5, N'Misterio')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (6, N'Drama')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (7, N'Programacion')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (8, N'Comedia')
GO
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'950-49-1342-3', N'Los Mitos de la Argentina III', 2005, 7, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788420419862', N'La tía Julia y el escribidor', 1977, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788420422671', N'La tregua', 2003, 2, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788423338115', N'La invención de Morel', 1950, 6, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788423342181', N'Ficciones', 1944, 3, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788432311451', N'Las venas abiertas de America Latina', 1972, 5, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788466318709', N'La fiesta del chivo', 2000, 3, 6)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788466320917', N'La casa verde', 1965, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788483462034', N'La casa de los espiritus', 1993, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788489163515', N'El gaucho Martin Fierro', 1872, 5, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788490626702', N'Gracias Por El Fuego', 1965, 3, 5)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788492480180', N'El gallo de oro', 1980, 5, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9788497592352', N'El coronel no tiene quien le escriba', 1999, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789500726078', N'Crónica de una muerte anunciada', 1981, 5, 5)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789502317922', N'Facundo', 1845, 3, 9)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789504916451', N'Bar del infiermo', 2007, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789504920458', N'Los Mitos de la Argentina', 2009, 7, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789504942405', N'La voz del gran jefe', 2014, 7, 3)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789685208055', N'Letras e imágenes', 1969, 5, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789871138135', N'El amor en los tiempos del cólera', 1985, 5, 3)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789871138142', N'100 años de soledad', 1967, 5, 6)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789875666481', N'El Aleph', 1971, 3, 5)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789875667181', N'Historia De La Eternidad', 1936, 5, 5)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789875801837', N'La borra del café', 1992, 5, 3)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789877381795', N'La Ciudad Y Los Perros', 1962, 3, 1)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789877382570', N'Rayuela', 1963, 5, 3)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'9789877382594', N'Bestiario', 1951, 5, 3)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'987654321', N'Programacion .NET ( incluye threads)', 2018, 7, 9)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'987987', N'El nombre de la rosa', 1998, 2, 2)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (N'999888', N'Cerrado por futbol', 2018, 2, 7)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'950-49-1342-3', 7)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420419862', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420419862', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420422671', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 5)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423342181', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423342181', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788432311451', 7)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466318709', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466318709', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466320917', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788483462034', 13)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788489163515', 14)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788490626702', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788492480180', 17)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788497592352', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789500726078', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789500726078', 5)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789502317922', 19)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789504916451', 16)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789685208055', 17)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789685208055', 18)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138135', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138142', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138142', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875666481', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875667181', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875801837', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875801837', 11)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877381795', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877382570', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877382594', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'987654321', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'987654321', 11)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'987654321', 34)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'987654321', 35)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'987987', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'999888', 7)
GO
INSERT [dbo].[LogLibros] ([Usuario], [Fecha], [ISBN]) VALUES (N'dbo       ', CAST(N'2018-05-31T21:45:43.803' AS DateTime), N'987654321')
GO
INSERT [dbo].[LogLibros] ([Usuario], [Fecha], [ISBN]) VALUES (N'dbo       ', CAST(N'2018-06-05T21:17:19.473' AS DateTime), N'987987')
GO
INSERT [dbo].[LogLibros] ([Usuario], [Fecha], [ISBN]) VALUES (N'dbo       ', CAST(N'2018-06-05T21:19:29.877' AS DateTime), N'999888')
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (2, N'Uruguay')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (3, N'Chile')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (4, N'Venezuela')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (5, N'Peru')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (6, N'Paraguay')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (7, N'Mexico')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (8, N'Canada')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (9, N'España')
GO
INSERT [dbo].[Paises] ([ID], [Descripcion]) VALUES (10, N'Colombia')
GO
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
INSERT [dbo].[StockNovelas] ([Stock]) VALUES (1)
GO
ALTER TABLE [dbo].[Autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Paises] FOREIGN KEY([Nacionalidad])
REFERENCES [dbo].[Paises] ([ID])
GO
ALTER TABLE [dbo].[Autores] CHECK CONSTRAINT [FK_Autores_Paises]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Editoriales] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editoriales] ([ID])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Editoriales]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([ID])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Generos]
GO
ALTER TABLE [dbo].[LibrosAutores]  WITH CHECK ADD  CONSTRAINT [FK_LibrosAutores_Autores] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autores] ([ID])
GO
ALTER TABLE [dbo].[LibrosAutores] CHECK CONSTRAINT [FK_LibrosAutores_Autores]
GO
ALTER TABLE [dbo].[LibrosAutores]  WITH CHECK ADD  CONSTRAINT [FK_LibrosAutores_Libros] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Libros] ([ISBN])
GO
ALTER TABLE [dbo].[LibrosAutores] CHECK CONSTRAINT [FK_LibrosAutores_Libros]
GO
/****** Object:  StoredProcedure [dbo].[ProcAlta]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProcAlta]
(
	@Tabla nvarchar(50),
	@Descripcion nvarchar(50)
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Insert into '+ @Tabla + '(Descripcion) Values ('''+@Descripcion+''')' 
execute(@sentencia)







GO
/****** Object:  StoredProcedure [dbo].[ProcAltaLibro]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProcAltaLibro]
(
	@ISBN varchar(17),
	@Titulo varchar(50),
	@Edicion int,
	@IdGenero int,
	@IdEditorial int,
	@Autores TAutores readonly 
)
as
   /* cuerpo del principal */
begin try
	begin transaction
	/* comienza la transaction */
	/* insert de libros*/
	insert Libros(ISBN,Titulo,Edicion,IdGenero,IdEditorial)
	values(@ISBN,@Titulo,@Edicion,@IdGenero,@IdEditorial)

	/* actulizo el stock de las novelas*/
	if @IdGenero=2
	   begin
		update StockNovelas
		set Stock=Stock+1
	   end

	/* insert de librosAutores */
	insert LibrosAutores
	select @ISBN,idAutor from @Autores

	/* agregar Log para auditar quien realizo la transaccion*/
	insert LogLibros(usuario,fecha,ISBN)
	values(current_user,getdate(),@isbn)

	/* confirmo la transaccion */
	commit transaction
end try
begin catch
	/* informo a quien consume el SP */
	raiserror('Error, no se pudo dar de alta el libro',16,1)
	/* cancelar la transaccion */
	rollback transaction	
end catch

GO
/****** Object:  StoredProcedure [dbo].[ProcAutoresxPais]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcAutoresxPais]
( @IDPais int)
as
select * from autores
where Nacionalidad=@IdPais




GO
/****** Object:  StoredProcedure [dbo].[ProcBaja]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcBaja]
(
	@Tabla nvarchar(50),
	@id int
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Delete '+ @Tabla + ' where id='+Convert(varchar(4),@id) 
execute(@sentencia)




GO
/****** Object:  StoredProcedure [dbo].[ProcBorraAutor]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcBorraAutor]
(
	@IDAutor int
)
as
Delete Autores where ID=@IDAutor





GO
/****** Object:  StoredProcedure [dbo].[ProcModifica]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProcModifica]
(
	@Tabla nvarchar(50),
	@id int,
	@Descripcion nvarchar(50)
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Update '+ @Tabla + ' set descripcion='''+@Descripcion+''' where id='+Convert(varchar(4),@id) 
execute(@sentencia)




GO
/****** Object:  StoredProcedure [dbo].[ProcModificaAutor]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcModificaAutor]
(
	/* parametros */
	@ID int,
	@Apellido varchar(50),
	@Nombre varchar(50),
	@FechaNacimiento date,
	@Nacionalidad int
)
as
   /* cuerpo principal */
update Autores 
set Apellido=@Apellido,
    Nombre=@Nombre,
	FechaNacimiento=@FechaNacimiento,
	Nacionalidad=@Nacionalidad
where
    ID=@ID





GO
/****** Object:  StoredProcedure [dbo].[ProcModificaLibro]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ProcModificaLibro]
(
    
    @ISBN varchar(17),
    @Titulo varchar(50),
    @Edicion int,
    @IdGenero int,
    @IdEditorial int
)
as
update Libros 
set Titulo = @Titulo,
    Edicion = @Edicion,
    IdGenero = @IdGenero,
    idEditorial = @IdEditorial
where ISBN = @ISBN
GO
/****** Object:  StoredProcedure [dbo].[ProcTraer]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProcTraer]
( @Tabla nvarchar(20) )
as
declare @sentencia nvarchar(200)
set @sentencia='select * from ' + @Tabla 
execute (@sentencia)




GO
/****** Object:  StoredProcedure [dbo].[ProcTraerAutoresxISBN]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ProcTraerAutoresxISBN]
( @ISBN varchar(17) )
as
Select 
	a.Apellido,a.Nombre,p.Descripcion as Nacionalidad
From Autores a
join LibrosAutores la on a.ID=la.IdAutor
join Paises p on p.ID=a.Nacionalidad
where isbn=@ISBN




GO
/****** Object:  StoredProcedure [dbo].[ProcTraerLibroxISBN]    Script Date: 31/10/2018 12:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcTraerLibroxISBN]
(
	@ISBN varchar(17)
)
as
select * from Libros
where isbn=@ISBN;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[27] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 80
               Left = 391
               Bottom = 176
               Right = 561
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3405
         Alias = 2655
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAutores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAutores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[27] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "l"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 194
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 198
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2205
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaLibros'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaLibros'
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO
