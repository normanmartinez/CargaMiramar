USE [Miramar]
GO
ALTER TABLE [dbo].[AuditLogMiramar] DROP CONSTRAINT [FK_AuditLogMiramar_Results]
GO
ALTER TABLE [dbo].[AuditLogMiramar] DROP CONSTRAINT [FK_AuditLogMiramar_Actions]
GO
ALTER TABLE [dbo].[Actions] DROP CONSTRAINT [FK_Actions_ActionsType]
GO
ALTER TABLE [dbo].[AuditLogMiramar] DROP CONSTRAINT [DF_AuditLogMiramar_IsRowCurrent]
GO
ALTER TABLE [dbo].[AuditLogMiramar] DROP CONSTRAINT [DF_AuditLogMiramar_Points]
GO
ALTER TABLE [dbo].[AuditLogMiramar] DROP CONSTRAINT [DF_AuditLogMiramar_ActionDateTime]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 11-12-2016 10:34:43 ******/
DROP TABLE [dbo].[Results]
GO
/****** Object:  Table [dbo].[AuditLogMiramar]    Script Date: 11-12-2016 10:34:43 ******/
DROP TABLE [dbo].[AuditLogMiramar]
GO
/****** Object:  Table [dbo].[ActionsType]    Script Date: 11-12-2016 10:34:43 ******/
DROP TABLE [dbo].[ActionsType]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 11-12-2016 10:34:43 ******/
DROP TABLE [dbo].[Actions]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 11-12-2016 10:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionDescription] [varchar](100) NOT NULL,
	[ActionTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActionsType]    Script Date: 11-12-2016 10:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionsType](
	[ActionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ActionTypeDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ActionsType] PRIMARY KEY CLUSTERED 
(
	[ActionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditLogMiramar]    Script Date: 11-12-2016 10:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogMiramar](
	[AuditLogID] [int] IDENTITY(1,1) NOT NULL,
	[ActionDateTime] [datetime] NOT NULL,
	[RUT] [varchar](10) NOT NULL,
	[ActionID] [int] NOT NULL,
	[ResultID] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[NextActionDateTime] [date] NULL,
	[IsRowCurrent] [char](1) NOT NULL,
	[ProductNumber] [int] NULL,
 CONSTRAINT [PK_AuditLogMiramar] PRIMARY KEY CLUSTERED 
(
	[AuditLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Results]    Script Date: 11-12-2016 10:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[ResultDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AuditLogMiramar] ADD  CONSTRAINT [DF_AuditLogMiramar_ActionDateTime]  DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [dbo].[AuditLogMiramar] ADD  CONSTRAINT [DF_AuditLogMiramar_Points]  DEFAULT ((0)) FOR [Points]
GO
ALTER TABLE [dbo].[AuditLogMiramar] ADD  CONSTRAINT [DF_AuditLogMiramar_IsRowCurrent]  DEFAULT ((1)) FOR [IsRowCurrent]
GO
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_ActionsType] FOREIGN KEY([ActionTypeID])
REFERENCES [dbo].[ActionsType] ([ActionTypeID])
GO
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_ActionsType]
GO
ALTER TABLE [dbo].[AuditLogMiramar]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogMiramar_Actions] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ActionID])
GO
ALTER TABLE [dbo].[AuditLogMiramar] CHECK CONSTRAINT [FK_AuditLogMiramar_Actions]
GO
ALTER TABLE [dbo].[AuditLogMiramar]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogMiramar_Results] FOREIGN KEY([ResultID])
REFERENCES [dbo].[Results] ([ResultID])
GO
ALTER TABLE [dbo].[AuditLogMiramar] CHECK CONSTRAINT [FK_AuditLogMiramar_Results]
GO
