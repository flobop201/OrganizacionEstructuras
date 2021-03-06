USE [master]
GO
/****** Object:  Database [UAM]    Script Date: 12/08/2016 09:01:36 a.m. ******/
CREATE DATABASE [UAM]
GO
ALTER DATABASE [UAM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAM] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [UAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAM] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAM] SET RECOVERY FULL 
GO
ALTER DATABASE [UAM] SET  MULTI_USER 
GO
ALTER DATABASE [UAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAM] SET DB_CHAINING OFF 
GO
USE [UAM]
GO
/****** Object:  Table [dbo].[carrito]    Script Date: 12/08/2016 09:01:36 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[Codigo] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [money] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 12/08/2016 09:01:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactenos]    Script Date: 12/08/2016 09:01:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactenos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Fecha] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estados]    Script Date: 12/08/2016 09:01:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estados](
	[IdEstado] [bigint] IDENTITY(1,1) NOT NULL,
	[EstadoA] [varchar](50) NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturadetalle]    Script Date: 12/08/2016 09:01:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturadetalle](
	[IdFacturaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NULL,
	[Codigo] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [money] NULL,
	[Cantidad] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 12/08/2016 09:01:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturas](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NULL,
	[Fecha] [datetime] NULL,
	[Monto] [money] NULL,
	[Tarjeta] [varchar](50) NOT NULL,
	[Titular] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/08/2016 09:01:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu]    Script Date: 12/08/2016 09:01:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [varchar](50) NULL,
	[Pagina] [varchar](50) NULL,
	[IdSubMenu] [int] NULL,
	[RequiereLogin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productos]    Script Date: 12/08/2016 09:01:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productos](
	[Codigo] [varchar](50) NOT NULL,
	[Producto] [varchar](50) NULL,
	[Existencia] [int] NULL,
	[Precio] [money] NULL,
	[IdCategoria] [int] NULL,
	[Imagen] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/08/2016 09:01:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rolesxmenu]    Script Date: 12/08/2016 09:01:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolesxmenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[IdRol] [int] NULL
)

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 12/08/2016 09:01:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaSuscripcion] [datetime] NOT NULL,
 CONSTRAINT [PKusuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([Id], [Categoria]) VALUES (1, N'Informática')
INSERT [dbo].[categorias] ([Id], [Categoria]) VALUES (10, N'Celulares & Tablets')
SET IDENTITY_INSERT [dbo].[categorias] OFF
SET IDENTITY_INSERT [dbo].[estados] ON 

INSERT [dbo].[estados] ([IdEstado], [EstadoA]) VALUES (1, N'Activo')
INSERT [dbo].[estados] ([IdEstado], [EstadoA]) VALUES (0, N'Inactivo')
SET IDENTITY_INSERT [dbo].[estados] OFF
SET IDENTITY_INSERT [dbo].[facturadetalle] ON 

INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (164, 96771, 120882, N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 673200.0000, 1)
SET IDENTITY_INSERT [dbo].[facturadetalle] OFF
SET IDENTITY_INSERT [dbo].[facturas] ON 

INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96771, 3, CAST(N'2016-08-11 23:06:16.387' AS DateTime), 673200.0000, N'377711582059306', N'MAYKOOL RIVERA CARRANZA')
SET IDENTITY_INSERT [dbo].[facturas] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (1, CAST(N'2016-08-11 21:35:32.430' AS DateTime), N'13', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (2, CAST(N'2016-08-11 21:39:51.050' AS DateTime), N'20', N'INFO', N'UAMSHOP', N'El usuario Francisco Javier Lobo Porras ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (3, CAST(N'2016-08-11 21:45:55.510' AS DateTime), N'28', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (4, CAST(N'2016-08-11 21:46:03.297' AS DateTime), N'7', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (5, CAST(N'2016-08-11 21:47:19.823' AS DateTime), N'7', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (6, CAST(N'2016-08-11 21:50:37.737' AS DateTime), N'23', N'ERROR', N'UAMSHOP', N'Mailbox unavailable. The server response was: 5.3.4 554-554 5.2.0 STOREDRV.Deliver; delivery result banner   at System.Net.Mail.DataStopCommand.CheckResponse(SmtpStatusCode statusCode, String serverResponse)
   at System.Net.Mail.DataStopCommand.Send(SmtpConnection conn)
   at System.Net.Mail.SmtpConnection.OnClose(Object sender, EventArgs args)
   at System.Net.ClosableStream.Close()
   at System.Net.Mail.MailWriter.Close()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.SendMail.SendUserPasswordNotification(String nombre, String correo)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (7, CAST(N'2016-08-11 21:51:31.887' AS DateTime), N'7', N'INFO', N'UAMSHOP', N'El usuario Francisco Javier Lobo Porras ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (8, CAST(N'2016-08-11 21:54:33.310' AS DateTime), N'38', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (9, CAST(N'2016-08-11 21:54:48.253' AS DateTime), N'43', N'ERROR', N'UAMSHOP', N'Mailbox unavailable. The server response was: 5.3.4 554-554 5.2.0 STOREDRV.Deliver; delivery result banner   at System.Net.Mail.DataStopCommand.CheckResponse(SmtpStatusCode statusCode, String serverResponse)
   at System.Net.Mail.DataStopCommand.Send(SmtpConnection conn)
   at System.Net.Mail.SmtpConnection.OnClose(Object sender, EventArgs args)
   at System.Net.ClosableStream.Close()
   at System.Net.Mail.MailWriter.Close()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.SendMail.SendUserPasswordNotification(String nombre, String correo)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (10, CAST(N'2016-08-11 21:58:05.007' AS DateTime), N'32', N'INFO', N'UAMSHOP', N'Estimado(a) uamshopcr@gmail.com se le ha enviado a uamshopcr@gmail.com un correo de cambio de clave', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (11, CAST(N'2016-08-11 22:01:41.577' AS DateTime), N'32', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (12, CAST(N'2016-08-11 22:01:41.763' AS DateTime), N'23', N'INFO', N'UAMSHOP', N'El usuario Administrador UAM SHOP ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (13, CAST(N'2016-08-11 23:04:45.483' AS DateTime), N'8', N'INFO', N'UAMSHOP', N'El usuario Franco Rivera ha iniciado session en UAMSHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (14, CAST(N'2016-08-11 23:06:18.467' AS DateTime), N'9', N'INFO', N'UAMSHOP', N'Estimado(a) Franco Rivera se le ha enviado a maykoolfr@gmail.com la factura de compra 96771 por un monto de $673,200.00.', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (15, CAST(N'2016-08-11 23:06:18.467' AS DateTime), N'9', N'INFO', N'UAMSHOP', N'Se ha generado la factura de compra 96771 por un monto de $673,200.00.', N'')
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (1, N'Inicio', N'/index.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (2, N'Categorias', N'/category/category.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (5, N'Mantenimientos', N'', 0, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (6, N'Ingresar', N'/login.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (7, N'<i class="fa fa-shopping-cart"></i>', N'/category/cart.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (12, N'<i class="fa fa-user"></i>', N'/user/profile.aspx', 0, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (22, N'Categorias', N'/mantenimiento/mantcategorias.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (23, N'Productos', N'/mantenimiento/mantproductos.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (24, N'Usuarios', N'/mantenimiento/mantusuarios.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (25, N'Mis Compras', N'/user/history.aspx', 0, 1)
SET IDENTITY_INSERT [dbo].[menu] OFF
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'120882', N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 11, 673200.0000, 1, N'../img/productos/120882.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'127688', N'SMTR® ONEPLUS 3 ', 12, 209500.0000, 10, N'../img/productos/127688.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'127786', N'SAMSUNG GALAXY S7 - SMARTPHONE', 12, 287400.0000, 10, N'../img/productos/127786.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'142652', N'NETBOOK TOSHIBA NB15 A/1203SL', 12, 455000.0000, 1, N'../img/productos/142652.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'146551', N'COMP PORT LENOVO B4080 14" I3 500GB 4GB', 12, 229770.0000, 1, N'../img/productos/146551.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'147710', N'APPLE IPHONE 6S 16GB 4G GRIS - SMARTPHONE', 12, 398750.0000, 10, N'../img/productos/147710.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'149083', N'TABLET RCA RC7TK9 7PLG WIFI', 12, 49350.0000, 10, N'../img/productos/149083.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'149084', N'SMTR® ONEPLUS 2 ', 12, 157600.0000, 10, N'../img/productos/149084.png')
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([Id], [Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[roles] ([Id], [Rol]) VALUES (2, N'Usuario Regular')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[rolesxmenu] ON 

INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (1, 5, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (2, 22, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (3, 23, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (4, 24, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (5, 1, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (6, 2, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (10, 25, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (8, 7, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (9, 12, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (11, 12, 1)
SET IDENTITY_INSERT [dbo].[rolesxmenu] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (1, N'uamshopcr@gmail.com', N'Administrador UAM SHOP', N'progra4uamshop', 1, 1, CAST(N'2016-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (3, N'maykoolfr@gmail.com', N'Franco Rivera', N'123', 2, 1, CAST(N'2016-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (11, N'gchinglam@gmail.com', N'Guillermo Ching', N'123', 2, 1, CAST(N'2016-08-09 04:30:46.750' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (13, N'loboporras@gmail.com', N'Francisco Javier Lobo Porras', N'123', 2, 1, CAST(N'2016-08-09 17:12:34.913' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (15, N'diegocastro1417@gmail.com', N'Luis Diego', N'17diegocas', 2, 1, CAST(N'2016-08-09 21:53:32.703' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (16, N'jose@monge.com', N'José Ramírez', N'jramirez', 2, 1, CAST(N'2016-08-09 22:25:47.360' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (17, N'rrodriguezborbon@hotmail.com', N'Randall ', N'123', 2, 1, CAST(N'2016-08-09 22:32:11.950' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (30, N'franciscolobo@hotmail.es', N'Francisco Javier Lobo Porras', N'123', 2, 1, CAST(N'2016-08-11 05:47:19.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  Index [ixLog]    Script Date: 12/08/2016 09:01:43 a.m. ******/
CREATE NONCLUSTERED INDEX [ixLog] ON [dbo].[Log]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  StoredProcedure [dbo].[cleanDB]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cleanDB]
AS
DELETE dbo.facturadetalle
DELETE dbo.facturas
UPDATE dbo.productos SET Existencia=12
DELETE dbo.carrito
DELETE dbo.Log


GO
/****** Object:  StoredProcedure [dbo].[selectusers]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectusers] 
 
AS   

    SELECT DISTINCT a.IdUsuario, a.Usuario, a.Nombre, a.Contrasena, a.IdRol, Rol, EstadoA, IdEstado
    FROM usuarios a 
    INNER JOIN roles b ON  b.Id = a.IdRol
	INNER JOIN estados c on c.IdEstado = a.Estado

GO
/****** Object:  StoredProcedure [dbo].[usp_AutenticarUsuario]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AutenticarUsuario]
    @Usuario VARCHAR(50) ,
    @Contrasena VARCHAR(50)
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRAN

    SELECT  [Usuario] ,
            [Nombre] ,
            [IdUsuario],
			[Rol],
			[EstadoA],
			[FechaSuscripcion]
    FROM    [dbo].[usuarios] a WITH(NOLOCK)
	inner join roles b on b.Id = a.IdRol
	inner join estados c on c.IdEstado = a.Estado
    WHERE   ( [Usuario] = @Usuario
              AND [Contrasena] = @Contrasena
            ) 

			COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_carritoClear]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoClear] 
    @IdUsuario VARCHAR(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[carrito]
	WHERE  [IdUsuario] = @IdUsuario

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_carritoDelete]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoDelete] @Id INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    DELETE  FROM [dbo].[carrito]
    WHERE   [Id] = @Id

    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_carritoInsert]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_carritoInsert]
    @IdUsuario VARCHAR(50) = NULL ,
    @Codigo INT = NULL ,
    @Cantidad INT = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN
	

    IF EXISTS ( SELECT  1
                FROM    dbo.carrito
                WHERE   IdUsuario = @IdUsuario
                        AND Codigo = @Codigo )
        BEGIN
            UPDATE  dbo.carrito
            SET     Cantidad = Cantidad + @Cantidad
            WHERE   IdUsuario = @IdUsuario
                    AND Codigo = @Codigo
        END
    ELSE
        BEGIN
            INSERT  INTO [dbo].[carrito]
                    ( [IdUsuario] ,
                      [Codigo] ,
                      [Descripcion] ,
                      [Precio] ,
                      [Cantidad]
                    )
                    SELECT  @IdUsuario ,
                            @Codigo ,
                            Producto ,
                            Precio ,
                            @Cantidad
                    FROM    dbo.productos WITH ( NOLOCK )
                    WHERE   Codigo = @Codigo
        END
	-- Begin Return Select <- do not remove
    SELECT  [Id] ,
            [IdUsuario] ,
            [Codigo] ,
            [Descripcion] ,
            [Precio] ,
            [Cantidad]
    FROM    [dbo].[carrito] WITH ( NOLOCK )
    WHERE   [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
    COMMIT




GO
/****** Object:  StoredProcedure [dbo].[usp_carritoSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoSelect] @IdUsuario VARCHAR(50)
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON    

    SELECT  Id ,
            IdUsuario ,
            A.Codigo ,
            Descripcion ,
            A.Precio ,
            Cantidad ,
            P.Imagen
    FROM    dbo.carrito A WITH ( NOLOCK )
            INNER JOIN dbo.productos P WITH ( NOLOCK ) ON P.Codigo = A.Codigo
    WHERE   ( [IdUsuario] = @IdUsuario )


GO
/****** Object:  StoredProcedure [dbo].[usp_carritoUpdate]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoUpdate]
    @Id INT ,   
    @Cantidad INT = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  


    UPDATE  [dbo].[carrito]
    SET     [Cantidad] = @Cantidad
    WHERE   [Id] = @Id
	
	-- Begin Return Select <- do not remove
    SELECT  [Id] ,
            [IdUsuario] ,
            [Codigo] ,
            [Descripcion] ,
            [Precio] ,
            [Cantidad]
    FROM    [dbo].[carrito] WITH(NOLOCK)
    WHERE   [Id] = @Id	
	-- End Return Select <- do not remove




GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasDelete]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasDelete] @Id INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    DELETE  FROM [dbo].[categorias]
    WHERE   [Id] = @Id

    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasInsert]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasInsert]
    @Categoria VARCHAR(50) = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN
	
    INSERT  INTO [dbo].[categorias]
            ( [Categoria] )
            SELECT  @Categoria
	
	
    SELECT  [Id] ,
            [Categoria]
    FROM    [dbo].[categorias]
    WHERE   [Id] = SCOPE_IDENTITY()
	
               
    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_categoriasSelect]
    @Id INT = 0 ,
    @HasProducts BIT = 0
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    DECLARE @FROM VARCHAR(MAX)= ' SELECT  [Id] ,
										[Categoria]
										FROM    dbo.categorias C WITH ( NOLOCK ) '
    DECLARE @EXIST VARCHAR(MAX)= ' AND EXISTS (SELECT 1 FROM dbo.productos B WITH ( NOLOCK ) WHERE C.Id=B.IdCategoria  )'
    DECLARE @WHERE VARCHAR(MAX)= ' WHERE   ( [Id] = ' + CONVERT(VARCHAR, @Id)
        + '
												OR 0 = '
        + CONVERT(VARCHAR, @Id) + ')'

    DECLARE @CONSULTASQL VARCHAR(MAX)= ''
												

    SET @CONSULTASQL = @FROM + @WHERE + CASE WHEN @HasProducts = 1 THEN @EXIST
                                             ELSE ''
                                        END 
           
    EXEC(@CONSULTASQL)                                      



GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasUpdate]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasUpdate]
    @Id INT ,
    @Categoria VARCHAR(50) = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    UPDATE  [dbo].[categorias]
    SET     [Categoria] = @Categoria
    WHERE   [Id] = @Id
	
	
    SELECT  [Id] ,
            [Categoria]
    FROM    [dbo].[categorias]
    WHERE   [Id] = @Id	
	

    COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_EstadoSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_EstadoSelect]

AS   
 
    SELECT IdEstado, EstadoA
    FROM estados 

GO
/****** Object:  StoredProcedure [dbo].[usp_FacturaInsert]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_FacturaInsert]
    @IdUsuario VARCHAR(50) ,
    @Tarjeta VARCHAR(50) ,
    @Titular VARCHAR(50) ,
    @IdFactura INT = 0 OUTPUT
AS
    SET NOCOUNT ON; 
    SET XACT_ABORT ON; 
   
	   
    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE @Cantidad BIGINT= 0;
        DECLARE @Mensaje VARCHAR(MAX)= '';
        DECLARE @ResultadoEjecucion INT = 0
        DECLARE @MontoFactura BIGINT= 0;
        DECLARE @Articulos VARCHAR(MAX)= '';

		--Valida si hay algo para facturar
        IF NOT EXISTS ( SELECT  1
                        FROM    dbo.carrito WITH ( NOLOCK )
                        WHERE   IdUsuario = @IdUsuario )
            BEGIN
                SET @Mensaje = 'No hay articulos en el carrito';

                RAISERROR(@Mensaje,16,4);
            END;

		--Valida si hay existencias para todos los articulos
        SELECT  A.Id ,
                A.IdUsuario ,
                A.Codigo ,
                A.Descripcion ,
                A.Precio ,
                Cantidad = A.Cantidad ,
                Existencia = B.Existencia
        INTO    #carrito
        FROM    dbo.carrito A WITH ( NOLOCK )
                INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
        WHERE   IdUsuario = @IdUsuario
                AND A.Cantidad > B.Existencia;
   
        SET @Cantidad = @@ROWCOUNT;

        IF @Cantidad > 0
            BEGIN 
                SELECT  @Articulos += ' [' + CONVERT(VARCHAR, A.Codigo) + ': '
                        + CONVERT(VARCHAR, A.Descripcion) + ']'
                FROM    dbo.carrito A WITH ( NOLOCK )
                        INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
                WHERE   IdUsuario = @IdUsuario
                        AND Cantidad > B.Existencia;         

                SET @Mensaje = 'La cantidad a comprar para los articulos: '
                    + @Articulos + ' no esta en existencia';

                RAISERROR(@Mensaje,16,4);
            END;

		--Actualiza la existencia en productos
        UPDATE  B
        SET     B.Existencia = B.Existencia - A.Cantidad
        FROM    dbo.carrito A WITH ( NOLOCK )
                INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
        WHERE   A.IdUsuario = @IdUsuario
               -- AND A.Cantidad < B.Existencia;

		--Ingresa el encabezado de la factura
        SELECT  @MontoFactura = SUM(Cantidad * Precio)
        FROM    dbo.carrito WITH ( NOLOCK )
        WHERE   IdUsuario = @IdUsuario;
        INSERT  INTO dbo.facturas
                ( IdUsuario ,
                  Fecha ,
                  Monto ,
                  Tarjeta ,
                  Titular
                )
        VALUES  ( @IdUsuario , -- IdUsuario - int
                  GETDATE() , -- Fecha - datetime
                  @MontoFactura , -- Monto - money
                  @Tarjeta , -- Tarjeta - varchar(50)
                  UPPER(@Titular)  -- Titular - varchar(50)
	            );

        SET @IdFactura = SCOPE_IDENTITY();

		--Inserta el detalle de la factura
        INSERT  INTO dbo.facturadetalle
                ( IdFactura ,
                  Codigo ,
                  Descripcion ,
                  Precio ,
                  Cantidad
	            )
                SELECT  @IdFactura ,
                        Codigo ,
                        Descripcion ,
                        Precio ,
                        Cantidad
                FROM    dbo.carrito WITH ( NOLOCK )
                WHERE   IdUsuario = @IdUsuario;

        EXEC dbo.usp_carritoClear @IdUsuario = @IdUsuario;
			
			
        SELECT  @Mensaje = 'FACTURA  #:' + CONVERT(VARCHAR, @IdFactura)
                + ' GENERADA ';

        SELECT  Resultado = @ResultadoEjecucion ,
                Mensaje = @Mensaje;

        SELECT  IdFactura ,
                IdUsuario ,
                Fecha ,
                Monto ,
                Tarjeta ,
                Titular
        FROM    dbo.facturas WITH ( NOLOCK )
        WHERE   IdFactura = @IdFactura

        SELECT  fd.IdFacturaDetalle ,
                fd.IdFactura ,
                fd.Codigo ,
                fd.Descripcion ,
                fd.Precio ,
                fd.Cantidad ,
                p.Imagen
        FROM    dbo.facturadetalle fd WITH ( NOLOCK )
                INNER JOIN dbo.productos p WITH ( NOLOCK ) ON p.Codigo = fd.Codigo
        WHERE   IdFactura = @IdFactura
			
        COMMIT;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRAN;
            END;
		
        SELECT  Resultado = -1 ,
                Mensaje = ERROR_MESSAGE();				
    END CATCH;










GO
/****** Object:  StoredProcedure [dbo].[usp_FacturasSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_FacturasSelect] @IdUsuario INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    SELECT  IdFactura ,
            IdUsuario ,
            Fecha ,
            Monto ,
            Tarjeta ,
            Titular
    FROM    dbo.facturas WITH ( NOLOCK )
    WHERE   IdUsuario=@IdUsuario

GO
/****** Object:  StoredProcedure [dbo].[usp_MenuSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_MenuSelect]
    (
      @IdUsuario VARCHAR(50) = ''
    )
AS
    IF ( @IdUsuario > 0 )
        BEGIN 
            SELECT  X.IdMenu ,
                    X.Menu ,
                    X.Pagina ,
                    X.IdSubMenu ,
                    X.RequiereLogin ,
                    X.IdCategoria
            FROM    ( SELECT    M.IdMenu ,
                                M.Menu ,
                                M.Pagina ,
                                M.IdSubMenu ,
                                M.RequiereLogin ,
                                IdCategoria = 0
                      FROM      dbo.menu M WITH ( NOLOCK )
                                INNER JOIN dbo.rolesxmenu RM WITH ( NOLOCK ) ON RM.IdMenu = M.IdMenu
                                INNER JOIN dbo.roles R WITH ( NOLOCK ) ON R.Id = RM.IdRol
                                INNER JOIN dbo.usuarios U WITH ( NOLOCK ) ON U.IdRol = R.Id
                                                              AND U.IdUsuario = @IdUsuario
                      UNION ALL
                      SELECT    IdMenu = 0 ,
                                Menu = Categoria ,
                                Pagina = '' ,
                                IdSubMenu = ( SELECT    IdMenu
                                              FROM      dbo.menu WITH(NOLOCK)
                                              WHERE     Pagina LIKE  '%category.aspx%'
                                            ) ,
                                RequiereLogin = 0 ,
                                IdCategoria = Id
                      FROM      dbo.categorias WITH ( NOLOCK )
                    ) X

			
        END
    IF ( @IdUsuario = 0 )
        BEGIN
            SELECT  IdMenu ,
                    X.Menu ,
                    X.Pagina ,
                    X.IdSubMenu ,
                    X.RequiereLogin ,
                    X.IdCategoria
            FROM    ( SELECT    M.IdMenu ,
                                M.Menu ,
                                M.Pagina ,
                                M.IdSubMenu ,
                                M.RequiereLogin ,
                                IdCategoria = 0
                      FROM      dbo.menu M WITH ( NOLOCK )
                      WHERE     M.RequiereLogin = 0
                      UNION ALL
                      SELECT    IdMenu = 0 ,
                                Menu = Categoria ,
                                Pagina = '' ,
                                IdSubMenu = 2 ,
                                RequiereLogin = 0 ,
                                IdCategoria = Id
                      FROM      dbo.categorias WITH ( NOLOCK )
                    ) X
        END



GO
/****** Object:  StoredProcedure [dbo].[usp_productosDelete]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_productosDelete] 
    @Codigo varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_productosInsert]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_productosInsert] 
    @Codigo varchar(50),
    @Producto varchar(50) = NULL,
    @Existencia int = NULL,
    @Precio money = NULL,
    @IdCategoria int = NULL,
    @Imagen varchar(MAX) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen])
	SELECT @Codigo, @Producto, @Existencia, @Precio, @IdCategoria, @Imagen
	
	-- Begin Return Select <- do not remove
	SELECT [Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_productosSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_productosSelect]
    @Codigo VARCHAR(50) = '' ,
    @IdCategoria INT = 0 ,
    @Busqueda VARCHAR(MAX) = ''
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON 

    SELECT  [Codigo] ,
            [Producto] ,
            [Existencia] ,
            [Precio] ,
            [IdCategoria] ,
			Categoria,
            [Imagen]
    FROM    [dbo].[productos] a WITH ( NOLOCK )
	Inner join categorias  b WITH ( NOLOCK ) on a.IdCategoria = b.Id
    WHERE   ( [Codigo] = @Codigo
              OR @Codigo = ''
            )
            AND ( IdCategoria = @IdCategoria
                  OR @IdCategoria = 0
                )
            AND ( Producto LIKE '%' + @Busqueda+ '%'
                  OR @Busqueda = ''
                )

	







GO
/****** Object:  StoredProcedure [dbo].[usp_productosSelectTop]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_productosSelectTop]
    @Codigo VARCHAR(50) = '' ,
    @IdCategoria INT = 0
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON 

    SELECT  DISTINCT TOP 4 P.[Codigo] ,
            [Producto] ,
            [Existencia] ,
            P.[Precio] ,
            [IdCategoria] ,
            [Imagen]
    FROM    [dbo].[productos] P WITH ( NOLOCK )
            INNER JOIN dbo.facturadetalle FD WITH ( NOLOCK ) ON FD.Codigo = P.Codigo
            INNER JOIN dbo.facturas F WITH ( NOLOCK ) ON FD.IdFactura = F.IdFactura
    
	







GO
/****** Object:  StoredProcedure [dbo].[usp_productosUpdate]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_productosUpdate] 
    @Codigo varchar(50),
    @Producto varchar(50) = NULL,
    @Existencia int = NULL,
    @Precio money = NULL,
    @IdCategoria int = NULL,
    @Imagen varchar(MAX) = ''
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[productos]
	SET    [Codigo] = @Codigo, [Producto] = @Producto, [Existencia] = @Existencia, [Precio] = @Precio, [IdCategoria] = @IdCategoria, [Imagen] = case when @Imagen is null then Imagen else @Imagen end
	WHERE  [Codigo] = @Codigo
	
	-- Begin Return Select <- do not remove
	SELECT [Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo	
	-- End Return Select <- do not remove

	COMMIT



GO
/****** Object:  StoredProcedure [dbo].[usp_RoleSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[usp_RoleSelect]

AS   
 
    SELECT Id, Rol
    FROM roles 

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosDelete]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosDelete] 
    @Usuario varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[usuarios]
	WHERE  [Usuario] = @Usuario

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosInsert]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_usuariosInsert]
    @Usuario VARCHAR(50) ,
    @Nombre VARCHAR(50) ,
    @Contrasena VARCHAR(50) ,
    @IdRol INT ,
    @Estado BIT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    IF EXISTS ( SELECT  *
                FROM    dbo.usuarios WITH ( NOLOCK )
                WHERE   Usuario = @Usuario )
        BEGIN	
		RAISERROR('El correo electronico ya existe registrado!!!',16,4)
        END
    ELSE
        BEGIN
            INSERT  INTO [dbo].[usuarios]
                    ( [Usuario] ,
                      [Nombre] ,
                      [Contrasena] ,
                      [IdRol] ,
                      [Estado] ,
                      [FechaSuscripcion]
                    )
                    SELECT  @Usuario ,
                            @Nombre ,
                            @Contrasena ,
                            @IdRol ,
                            @Estado ,
                            GETDATE()
        END
		


GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosSelect]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosSelect] 
    @Usuario varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Usuario], [Nombre], [Contrasena], [IdRol] 
	FROM   [dbo].[usuarios] 
	WHERE  ([Usuario] = @Usuario OR @Usuario IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosUpdate]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosUpdate] 
	@IdUsuario VARCHAR(50),
    @Usuario VARCHAR(50),
    @Nombre VARCHAR(50),
    @Contrasena VARCHAR(50),
    @IdRol INT,
	@IdEstado bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[usuarios]
	SET    [Usuario] = @Usuario, [Nombre] = @Nombre, [Contrasena] = @Contrasena, [IdRol] = @IdRol, [Estado]= @IdEstado
    WHERE  [Usuario] = @Usuario
	
	-- Begin Return Select <- do not remove
	SELECT [Usuario], [Nombre], [Contrasena], [IdRol]
	FROM   [dbo].[usuarios] WITH(NOLOCK)
	WHERE  [Usuario] = @Usuario	
	-- End Return Select <- do not remove

	COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosUpdatePassword]    Script Date: 12/08/2016 09:01:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[usp_usuariosUpdatePassword]
	@Password VARCHAR(50),
	@Usuario VARCHAR(50)

	as

	UPDATE [dbo].[usuarios]
	SET    [Contrasena] = @Password 
	WHERE  [Usuario] = @Usuario;



GO
USE [master]
GO
ALTER DATABASE [UAM] SET  READ_WRITE 
GO
