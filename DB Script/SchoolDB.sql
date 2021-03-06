USE [dbbtCARSAp1]
GO
/****** Object:  StoredProcedure [dbo].[SC_Student_DeleteStudent]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SC_Student_DeleteStudent]
	-- Add the parameters for the stored procedure here
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [dbo].[Student]
	where StudentID = @StudentId

END




GO
/****** Object:  StoredProcedure [dbo].[SC_Student_InsertStudentInfo]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SC_Student_InsertStudentInfo]
	-- Add the parameters for the stored procedure here
	@StandardId int = null,
	@StudentName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     INSERT INTO [dbbtCARSAp1].[dbo].[Student]
           ([StudentName]
           ,[StandardId])
     VALUES
           (
           @StudentName,
@StandardId
)
SELECT SCOPE_IDENTITY() AS StudentId

END




GO
/****** Object:  StoredProcedure [dbo].[SC_Student_StudentCourse_Course_GetCoursesByStudentId]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SC_Student_StudentCourse_Course_GetCoursesByStudentId]
	-- Add the parameters for the stored procedure here
	@StudentId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select c.courseid, c.coursename,c.Location, c.TeacherId
from student s left outer join studentcourse sc on sc.studentid = s.studentid left outer join course c on c.courseid = sc.courseid
where s.studentid = @StudentId
END




GO
/****** Object:  StoredProcedure [dbo].[SC_Student_UpdateStudent]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SC_Student_UpdateStudent]
	-- Add the parameters for the stored procedure here
	@StudentId int,
	@StandardId int = null,
	@StudentName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update [dbbtCARSAp1].[dbo].[Student] 
	set StudentName = @StudentName,
	StandardId = @StandardId
	where StudentID = @StudentId;

END




GO
/****** Object:  Table [dbo].[SC_Course]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC_Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NULL,
	[Location] [geography] NULL,
	[TeacherId] [int] NULL,
 CONSTRAINT [PK_Course_1] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC_Standard]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC_Standard](
	[StandardId] [int] IDENTITY(1,1) NOT NULL,
	[StandardName] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Standard] PRIMARY KEY CLUSTERED 
(
	[StandardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC_Student]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC_Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NULL,
	[StandardId] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC_StudentAddress]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC_StudentAddress](
	[StudentID] [int] NOT NULL,
	[Address1] [varchar](50) NOT NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentAddress] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC_StudentCourse]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_StudentCourse](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SC_Teacher]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC_Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](50) NULL,
	[StandardId] [int] NULL CONSTRAINT [DF_Teacher_StandardId]  DEFAULT ((0)),
 CONSTRAINT [PK_Teacher_1] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SC_Student_StudentCourse_Course_View_StudentCourse]    Script Date: 9/19/2016 12:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SC_Student_StudentCourse_Course_View_StudentCourse]
AS
SELECT     dbo.SC_Student.StudentID, dbo.SC_Student.StudentName, dbo.SC_Course.CourseId, dbo.SC_Course.CourseName
FROM         dbo.SC_Student INNER JOIN
                      dbo.SC_StudentCourse ON dbo.SC_Student.StudentID = dbo.SC_StudentCourse.StudentId INNER JOIN
                      dbo.SC_Course ON dbo.SC_StudentCourse.CourseId = dbo.SC_Course.CourseId

GO
SET IDENTITY_INSERT [dbo].[SC_Course] ON 

INSERT [dbo].[SC_Course] ([CourseId], [CourseName], [Location], [TeacherId]) VALUES (1, N'Maths', NULL, 1)
INSERT [dbo].[SC_Course] ([CourseId], [CourseName], [Location], [TeacherId]) VALUES (2, N'Science', NULL, 2)
INSERT [dbo].[SC_Course] ([CourseId], [CourseName], [Location], [TeacherId]) VALUES (3, N'History', NULL, 3)
INSERT [dbo].[SC_Course] ([CourseId], [CourseName], [Location], [TeacherId]) VALUES (4, N'English', NULL, 4)
INSERT [dbo].[SC_Course] ([CourseId], [CourseName], [Location], [TeacherId]) VALUES (5, N'Spanish', NULL, 5)
SET IDENTITY_INSERT [dbo].[SC_Course] OFF
SET IDENTITY_INSERT [dbo].[SC_Standard] ON 

INSERT [dbo].[SC_Standard] ([StandardId], [StandardName], [Description]) VALUES (1, N'Standard1', N'Standard 1\Grade1')
INSERT [dbo].[SC_Standard] ([StandardId], [StandardName], [Description]) VALUES (2, N'Standard2', NULL)
INSERT [dbo].[SC_Standard] ([StandardId], [StandardName], [Description]) VALUES (3, N'Standard3', NULL)
INSERT [dbo].[SC_Standard] ([StandardId], [StandardName], [Description]) VALUES (4, N'Standard4', NULL)
INSERT [dbo].[SC_Standard] ([StandardId], [StandardName], [Description]) VALUES (5, N'Standard5', NULL)
SET IDENTITY_INSERT [dbo].[SC_Standard] OFF
SET IDENTITY_INSERT [dbo].[SC_Student] ON 

INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (1, N'Student1', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (2, N'Student2', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (3, N'Student3', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (4, N'Student4', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (5, N'Student5', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (6, N'Student6', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (7, N'Student7', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (8, N'Student8', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (9, N'Student9', NULL)
INSERT [dbo].[SC_Student] ([StudentID], [StudentName], [StandardId]) VALUES (10, N'Student10', NULL)
SET IDENTITY_INSERT [dbo].[SC_Student] OFF
INSERT [dbo].[SC_StudentAddress] ([StudentID], [Address1], [Address2], [City], [State]) VALUES (1, N'Student1Address1', N'Student1Address2', N'Student1City', N'Student1State')
INSERT [dbo].[SC_StudentAddress] ([StudentID], [Address1], [Address2], [City], [State]) VALUES (2, N'Student2Address1', N'Student2Address2', N'Student2City', N'Student2State')
INSERT [dbo].[SC_StudentAddress] ([StudentID], [Address1], [Address2], [City], [State]) VALUES (3, N'Student3Address1', N'Student3Address2', N'Student3City', N'Student3State')
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (1, 3)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (1, 4)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (1, 5)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (2, 3)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (2, 4)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (2, 5)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (3, 4)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (4, 1)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (4, 2)
INSERT [dbo].[SC_StudentCourse] ([StudentId], [CourseId]) VALUES (5, 4)
SET IDENTITY_INSERT [dbo].[SC_Teacher] ON 

INSERT [dbo].[SC_Teacher] ([TeacherId], [TeacherName], [StandardId]) VALUES (2, N'Teacher2', 2)
INSERT [dbo].[SC_Teacher] ([TeacherId], [TeacherName], [StandardId]) VALUES (3, N'Teacher3', 3)
INSERT [dbo].[SC_Teacher] ([TeacherId], [TeacherName], [StandardId]) VALUES (4, N'Teacher4', 4)
INSERT [dbo].[SC_Teacher] ([TeacherId], [TeacherName], [StandardId]) VALUES (5, N'Teacher5', 5)
INSERT [dbo].[SC_Teacher] ([TeacherId], [TeacherName], [StandardId]) VALUES (7, N'Teacher7', 1)
SET IDENTITY_INSERT [dbo].[SC_Teacher] OFF
ALTER TABLE [dbo].[SC_Course]  WITH NOCHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[SC_Teacher] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SC_Course] NOCHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[SC_Student]  WITH NOCHECK ADD  CONSTRAINT [FK_Student_Standard] FOREIGN KEY([StandardId])
REFERENCES [dbo].[SC_Standard] ([StandardId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SC_Student] NOCHECK CONSTRAINT [FK_Student_Standard]
GO
ALTER TABLE [dbo].[SC_StudentAddress]  WITH CHECK ADD  CONSTRAINT [FK_StudentAddress_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[SC_Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SC_StudentAddress] CHECK CONSTRAINT [FK_StudentAddress_Student]
GO
ALTER TABLE [dbo].[SC_StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[SC_Course] ([CourseId])
GO
ALTER TABLE [dbo].[SC_StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[SC_StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[SC_Student] ([StudentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SC_StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student]
GO
ALTER TABLE [dbo].[SC_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Standard] FOREIGN KEY([StandardId])
REFERENCES [dbo].[SC_Standard] ([StandardId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SC_Teacher] CHECK CONSTRAINT [FK_Teacher_Standard]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SC_Student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC_StudentCourse"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 84
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC_Course"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 114
               Right = 567
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
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SC_Student_StudentCourse_Course_View_StudentCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SC_Student_StudentCourse_Course_View_StudentCourse'
GO
