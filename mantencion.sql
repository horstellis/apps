USE [master]
GO
/****** Object:  Database [mantencion]    Script Date: 18-05-2016 13:10:09 ******/
CREATE DATABASE [mantencion] ON  PRIMARY 
( NAME = N'mantencion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mantencion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mantencion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mantencion_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mantencion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mantencion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mantencion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mantencion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mantencion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mantencion] SET ARITHABORT OFF 
GO
ALTER DATABASE [mantencion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mantencion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mantencion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mantencion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mantencion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mantencion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mantencion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mantencion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mantencion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mantencion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mantencion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mantencion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mantencion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mantencion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mantencion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mantencion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mantencion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mantencion] SET RECOVERY FULL 
GO
ALTER DATABASE [mantencion] SET  MULTI_USER 
GO
ALTER DATABASE [mantencion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mantencion] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mantencion', N'ON'
GO
USE [mantencion]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 18-05-2016 13:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
	[id_tipo_articulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[articulos_maquina]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulos_maquina](
	[id_articulos_maquina] [int] IDENTITY(1,1) NOT NULL,
	[id_maquina] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_enc_diario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_articulos_maquina] PRIMARY KEY CLUSTERED 
(
	[id_articulos_maquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[asignacion]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asignacion](
	[id_asignacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_asignacion] PRIMARY KEY CLUSTERED 
(
	[id_asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clasificacion]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clasificacion](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
 CONSTRAINT [PK_clasificacion] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[det_diario]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[det_diario](
	[id_det_diario] [int] IDENTITY(1,1) NOT NULL,
	[id_enc_diario] [int] NOT NULL,
	[observacion] [varchar](max) NOT NULL,
	[fmodificacion] [date] NOT NULL,
	[id_usario] [int] NOT NULL,
 CONSTRAINT [PK_det_diario] PRIMARY KEY CLUSTERED 
(
	[id_det_diario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[enc_diario]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[enc_diario](
	[id_enc_diario] [int] IDENTITY(1,1) NOT NULL,
	[nsolicitud] [int] NULL,
	[fsolicitud] [date] NULL,
	[id_solicitante] [int] NULL,
	[id_seccion] [int] NOT NULL,
	[id_sector] [int] NULL,
	[id_maquina] [int] NULL,
	[id_clasificacion] [int] NOT NULL,
	[detalle] [varchar](max) NOT NULL,
	[flimite] [date] NULL,
	[finicio] [date] NULL,
	[ftermino] [date] NULL,
	[freal] [date] NULL,
	[fingreso] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_estado_actividad] [int] NOT NULL,
 CONSTRAINT [PK_enc_diario] PRIMARY KEY CLUSTERED 
(
	[id_enc_diario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado_actividad]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado_actividad](
	[id_estado_actividad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado_actvidad] PRIMARY KEY CLUSTERED 
(
	[id_estado_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[maquina]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[maquina](
	[id_maquina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
	[id_seccion] [int] NOT NULL,
 CONSTRAINT [PK_maquina] PRIMARY KEY CLUSTERED 
(
	[id_maquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permiso](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[responsable]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[responsable](
	[id_responsable] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_responsable] PRIMARY KEY CLUSTERED 
(
	[id_responsable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[responsable_asignado]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsable_asignado](
	[id_responsable_asignado] [int] IDENTITY(1,1) NOT NULL,
	[id_enc_diario] [int] NOT NULL,
	[id_responsable] [int] NOT NULL,
	[id_asignacion] [int] NOT NULL,
 CONSTRAINT [PK_responsable_asignado] PRIMARY KEY CLUSTERED 
(
	[id_responsable_asignado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[seccion]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seccion](
	[id_seccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
 CONSTRAINT [PK_seccion] PRIMARY KEY CLUSTERED 
(
	[id_seccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sector]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sector](
	[id_sector] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[observacion] [varchar](max) NULL,
	[id_seccion] [int] NOT NULL,
 CONSTRAINT [PK_sector] PRIMARY KEY CLUSTERED 
(
	[id_sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[solicitante]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[solicitante](
	[id_solicitante] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_solicitante] PRIMARY KEY CLUSTERED 
(
	[id_solicitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_articulo]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_articulo](
	[id_tipo_articulo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_articulo] PRIMARY KEY CLUSTERED 
(
	[id_tipo_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[id_permiso] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[lista_usuarios]    Script Date: 18-05-2016 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[lista_usuarios]
as
select u.usuario Usuario,u.nombre 'Nombre Usuario',p.descripcion 'Tipo Permiso',e.descripcion Estado
from usuarios u
inner join permiso p on u.id_permiso = p.id_permiso
inner join estado e on u.id_estado = e.id_estado;

GO
SET IDENTITY_INSERT [dbo].[asignacion] ON 

INSERT [dbo].[asignacion] ([id_asignacion], [descripcion]) VALUES (1, N'Principal')
INSERT [dbo].[asignacion] ([id_asignacion], [descripcion]) VALUES (2, N'Ayudante')
SET IDENTITY_INSERT [dbo].[asignacion] OFF
SET IDENTITY_INSERT [dbo].[clasificacion] ON 

INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (0, N'Sin Asignar', NULL)
INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (1, N'Mantenimiento Correctivo', NULL)
INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (2, N'Mantenimiento Preventivo', NULL)
INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (3, N'Mantenimiento Predictivo', NULL)
INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (4, N'Mantenimiento Proactivo', NULL)
INSERT [dbo].[clasificacion] ([id_clasificacion], [nombre], [observacion]) VALUES (5, N'Fabricación', NULL)
SET IDENTITY_INSERT [dbo].[clasificacion] OFF
SET IDENTITY_INSERT [dbo].[estado] ON 

INSERT [dbo].[estado] ([id_estado], [descripcion]) VALUES (0, N'Inactivo')
INSERT [dbo].[estado] ([id_estado], [descripcion]) VALUES (1, N'Activo')
INSERT [dbo].[estado] ([id_estado], [descripcion]) VALUES (2, N'Bloqueado')
SET IDENTITY_INSERT [dbo].[estado] OFF
SET IDENTITY_INSERT [dbo].[estado_actividad] ON 

INSERT [dbo].[estado_actividad] ([id_estado_actividad], [descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[estado_actividad] ([id_estado_actividad], [descripcion]) VALUES (2, N'Finalizado')
SET IDENTITY_INSERT [dbo].[estado_actividad] OFF
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([id_permiso], [descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[permiso] ([id_permiso], [descripcion]) VALUES (2, N'Visor')
SET IDENTITY_INSERT [dbo].[permiso] OFF
SET IDENTITY_INSERT [dbo].[responsable] ON 

INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (1, N'Manuel Fuenzalida', N'Antiguo', NULL, 2)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (2, N'Sergio Puebla', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (3, N'Luis Garrido', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (4, N'Germán Soto', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (5, N'Eduardo Bravo', N'Albañil', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (6, N'Victor Melo', N'Ayudante', NULL, 2)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (7, N'José Sáez', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (8, N'Braulio Urrutia', N'Carpintero', NULL, 2)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (9, N'Ricardo Peña', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (10, N'Luis Rebolledo', N'Albañil', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (11, N'Héctor León', N'Operador de Montacarga', NULL, 0)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (12, N'Horst Berndt', N'Asistente de Gerencia', NULL, 2)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (13, N'Hugo Galdamez', N'Supervisor de Mantenimiento y Obras', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (14, N'Reinaldo Gonzalez', N'Pintor', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (15, N'René Gonzalez', N'Mantenimiento Proceso Conservera', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (16, N'Hector Hernandez', N'Jefe Conservera', NULL, 2)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (17, N'Juan Pablo Alarcon', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (18, N'Miguel Mora', N'Mecánico', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (19, N'Luis Jara', N'Operador Grúa Horquilla', NULL, 1)
INSERT [dbo].[responsable] ([id_responsable], [nombre], [cargo], [observacion], [id_estado]) VALUES (20, N'Humberto Martinez', N'Carpintero / Mueblista', NULL, 1)
SET IDENTITY_INSERT [dbo].[responsable] OFF
SET IDENTITY_INSERT [dbo].[seccion] ON 

INSERT [dbo].[seccion] ([id_seccion], [nombre], [observacion]) VALUES (1, N'CONSERVERA', NULL)
INSERT [dbo].[seccion] ([id_seccion], [nombre], [observacion]) VALUES (2, N'DESHIDRATADORA', NULL)
INSERT [dbo].[seccion] ([id_seccion], [nombre], [observacion]) VALUES (3, N'ACEITERA', NULL)
INSERT [dbo].[seccion] ([id_seccion], [nombre], [observacion]) VALUES (4, N'AREAS COMUNES', NULL)
INSERT [dbo].[seccion] ([id_seccion], [nombre], [observacion]) VALUES (5, N'NUEVA PLANTA DESHIDRATADORA', NULL)
SET IDENTITY_INSERT [dbo].[seccion] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [usuario], [pass], [nombre], [id_permiso], [id_estado]) VALUES (1, N'z', N'z', N'Administador', 1, 1)
INSERT [dbo].[usuarios] ([id_usuario], [usuario], [pass], [nombre], [id_permiso], [id_estado]) VALUES (2, N'horst', N'berndt', N'Horst Berndt', 1, 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_tipo_articulo] FOREIGN KEY([id_tipo_articulo])
REFERENCES [dbo].[tipo_articulo] ([id_tipo_articulo])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_tipo_articulo]
GO
ALTER TABLE [dbo].[articulos_maquina]  WITH CHECK ADD  CONSTRAINT [FK_articulos_maquina_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulos_maquina] CHECK CONSTRAINT [FK_articulos_maquina_articulo]
GO
ALTER TABLE [dbo].[articulos_maquina]  WITH CHECK ADD  CONSTRAINT [FK_articulos_maquina_enc_diario] FOREIGN KEY([id_enc_diario])
REFERENCES [dbo].[enc_diario] ([id_enc_diario])
GO
ALTER TABLE [dbo].[articulos_maquina] CHECK CONSTRAINT [FK_articulos_maquina_enc_diario]
GO
ALTER TABLE [dbo].[articulos_maquina]  WITH CHECK ADD  CONSTRAINT [FK_articulos_maquina_maquina] FOREIGN KEY([id_maquina])
REFERENCES [dbo].[maquina] ([id_maquina])
GO
ALTER TABLE [dbo].[articulos_maquina] CHECK CONSTRAINT [FK_articulos_maquina_maquina]
GO
ALTER TABLE [dbo].[det_diario]  WITH CHECK ADD  CONSTRAINT [FK_det_diario_enc_diario] FOREIGN KEY([id_enc_diario])
REFERENCES [dbo].[enc_diario] ([id_enc_diario])
GO
ALTER TABLE [dbo].[det_diario] CHECK CONSTRAINT [FK_det_diario_enc_diario]
GO
ALTER TABLE [dbo].[det_diario]  WITH CHECK ADD  CONSTRAINT [FK_det_diario_usuarios] FOREIGN KEY([id_usario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[det_diario] CHECK CONSTRAINT [FK_det_diario_usuarios]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_clasificacion] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[clasificacion] ([id_clasificacion])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_clasificacion]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_estado_actvidad] FOREIGN KEY([id_estado_actividad])
REFERENCES [dbo].[estado_actividad] ([id_estado_actividad])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_estado_actvidad]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_maquina] FOREIGN KEY([id_maquina])
REFERENCES [dbo].[maquina] ([id_maquina])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_maquina]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_seccion] FOREIGN KEY([id_seccion])
REFERENCES [dbo].[seccion] ([id_seccion])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_seccion]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_sector] FOREIGN KEY([id_sector])
REFERENCES [dbo].[sector] ([id_sector])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_sector]
GO
ALTER TABLE [dbo].[enc_diario]  WITH CHECK ADD  CONSTRAINT [FK_enc_diario_solicitante] FOREIGN KEY([id_solicitante])
REFERENCES [dbo].[solicitante] ([id_solicitante])
GO
ALTER TABLE [dbo].[enc_diario] CHECK CONSTRAINT [FK_enc_diario_solicitante]
GO
ALTER TABLE [dbo].[maquina]  WITH CHECK ADD  CONSTRAINT [FK_maquina_seccion] FOREIGN KEY([id_seccion])
REFERENCES [dbo].[seccion] ([id_seccion])
GO
ALTER TABLE [dbo].[maquina] CHECK CONSTRAINT [FK_maquina_seccion]
GO
ALTER TABLE [dbo].[responsable]  WITH CHECK ADD  CONSTRAINT [FK_responsable_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[responsable] CHECK CONSTRAINT [FK_responsable_estado]
GO
ALTER TABLE [dbo].[responsable_asignado]  WITH CHECK ADD  CONSTRAINT [FK_responsable_asignado_asignacion] FOREIGN KEY([id_asignacion])
REFERENCES [dbo].[asignacion] ([id_asignacion])
GO
ALTER TABLE [dbo].[responsable_asignado] CHECK CONSTRAINT [FK_responsable_asignado_asignacion]
GO
ALTER TABLE [dbo].[responsable_asignado]  WITH CHECK ADD  CONSTRAINT [FK_responsable_asignado_enc_diario] FOREIGN KEY([id_enc_diario])
REFERENCES [dbo].[enc_diario] ([id_enc_diario])
GO
ALTER TABLE [dbo].[responsable_asignado] CHECK CONSTRAINT [FK_responsable_asignado_enc_diario]
GO
ALTER TABLE [dbo].[responsable_asignado]  WITH CHECK ADD  CONSTRAINT [FK_responsable_asignado_responsable] FOREIGN KEY([id_responsable])
REFERENCES [dbo].[responsable] ([id_responsable])
GO
ALTER TABLE [dbo].[responsable_asignado] CHECK CONSTRAINT [FK_responsable_asignado_responsable]
GO
ALTER TABLE [dbo].[sector]  WITH CHECK ADD  CONSTRAINT [FK_sector_seccion] FOREIGN KEY([id_seccion])
REFERENCES [dbo].[seccion] ([id_seccion])
GO
ALTER TABLE [dbo].[sector] CHECK CONSTRAINT [FK_sector_seccion]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_estado]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_permiso] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permiso] ([id_permiso])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_permiso]
GO
USE [master]
GO
ALTER DATABASE [mantencion] SET  READ_WRITE 
GO
