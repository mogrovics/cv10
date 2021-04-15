-- Subjects table
CREATE TABLE [dbo].[Subjects] (
    [Abbreviation] NCHAR (10)    NOT NULL,
    [Name]         NVARCHAR (50) NULL,
    CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED ([Abbreviation] ASC)
);

-- Students table
CREATE TABLE [dbo].[Students] (
    [Id]        INT           NOT NULL,
    [Name]      NVARCHAR (50) NULL,
    [Surname]   NVARCHAR (50) NULL,
    [BirthDate] DATE          NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([Id] ASC)
);

-- Registration table
CREATE TABLE [dbo].[Registration] (
    [StudentId] INT        NOT NULL,
    [Subject]   NCHAR (10) NOT NULL,
    CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED ([StudentId] ASC, [Subject] ASC),
    CONSTRAINT [FK_Registration_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id]),
    CONSTRAINT [FK_Registration_Subjects] FOREIGN KEY ([Subject]) REFERENCES [dbo].[Subjects] ([Abbreviation])
);

-- Marks table
CREATE TABLE [dbo].[Marks] (
    [StudentId] INT        NOT NULL,
    [Subject]   NCHAR (10) NOT NULL,
    [Date]      DATE       NULL,
    [Mark]      FLOAT (53) NULL,
    CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED ([StudentId] ASC, [Subject] ASC),
    CONSTRAINT [FK_Marks_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id]),
    CONSTRAINT [FK_Marks_Subjects] FOREIGN KEY ([Subject]) REFERENCES [dbo].[Subjects] ([Abbreviation])
);

-- add subjects data
INSERT INTO [dbo].[Subjects] ([Abbreviation], [Name]) VALUES ('BPC-AKR', 'Aplikovaná kryptografie'),
                                                             ('BPC-IC2', 'Bezpečnost ICT 2'),
                                                             ('BPC-OOP', 'Objektově orientované programování'),
                                                             ('BPC-SPR', 'Softwarové právo'),
                                                             ('BPC-TIN', 'Teoretická informatika')

-- add students data
INSERT INTO [dbo].[Students] ([Id], [Name], [Surname], [BirthDate]) VALUES (1, 'Benjamin', 'Pierce', '1997-11-23'),
                                                                           (2, 'John', 'McIntyre', '1998-05-15'),
                                                                           (3, 'B.J.', 'Hunnicutt', '1997-12-07'),
                                                                           (4, 'Henry', 'Blake', '1998-01-11'),
                                                                           (5, 'Sherman', 'Potter', '1996-07-31'),
                                                                           (6, 'Margaret', 'Houlihan', '1997-04-20'),
                                                                           (7, 'Frank', 'Burns', '1996-08-19'),
                                                                           (8, 'Charles', 'Winchester', N'1998-12-09'),
                                                                           (9, 'Fred', 'Burns', NULL)

-- add registration data (students and subjects)
INSERT INTO [dbo].[Registration] ([StudentId], [Subject]) VALUES (1, 'BPC-AKR'), (1, 'BPC-SPR'), (1, 'BPC-TIN'),
                                                                 (2, 'BPC-IC2'), (2, 'BPC-OOP'), (2, 'BPC-TIN'),
                                                                 (3, 'BPC-OOP'), (3, 'BPC-SPR'),
                                                                 (4, 'BPC-TIN'),
                                                                 (5, 'BPC-AKR'), (5, 'BPC-OOP'),
                                                                 (6, 'BPC-IC2'), (6, 'BPC-OOP'), (6, 'BPC-TIN'),
                                                                 (7, 'BPC-SPR'),
                                                                 (8, 'BPC-AKR'), (8, 'BPC-TIN')

-- add marks data (students, subjects, dates and marks)
INSERT INTO [dbo].[Marks] ([StudentId], [Subject], [Date], [Mark]) VALUES (1, 'BPC-AKR', '2021-02-01', 91), (1, 'BPC-SPR', '2021-02-01', 89), (1, 'BPC-TIN', '2021-02-01', 63),
                                                                          (2, 'BPC-IC2', '2021-02-01', 86), (2, 'BPC-OOP', '2021-02-01', 78), (2, 'BPC-TIN', '2021-02-01', 70),
                                                                          (3, 'BPC-OOP', '2021-02-01', 85), (3, 'BPC-SPR', '2021-02-01', 80),
                                                                          (4, 'BPC-TIN', '2021-02-01', 65),
                                                                          (5, 'BPC-AKR', '2021-02-01', 80), (5, 'BPC-OOP', '2021-02-01', 84),
                                                                          (6, 'BPC-IC2', '2021-02-01', 91), (6, 'BPC-OOP', '2021-02-01', 69), (6, 'BPC-TIN', '2021-02-01', 86),
                                                                          (7, 'BPC-SPR', '2021-02-01', 76),
                                                                          (8, 'BPC-AKR', '2021-02-01', 67), (8, 'BPC-TIN', '2021-02-01', 55)