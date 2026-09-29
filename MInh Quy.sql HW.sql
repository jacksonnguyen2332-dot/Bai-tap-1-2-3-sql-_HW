-- ============================================================
-- SQL Homework
-- University Database + COMPANY Database
-- ============================================================

/* ============================================================
   BAI TAP 1 - UNIVERSITY DATABASE
   ============================================================ */

IF DB_ID('University') IS NULL
BEGIN
    CREATE DATABASE University;
END;
GO

USE University;
GO

-- Drop tables in dependency order if they already exist
IF OBJECT_ID('dbo.Assigned', 'U') IS NOT NULL DROP TABLE dbo.Assigned;
IF OBJECT_ID('dbo.Course', 'U') IS NOT NULL DROP TABLE dbo.Course;
IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL DROP TABLE dbo.Student;
IF OBJECT_ID('dbo.Professor', 'U') IS NOT NULL DROP TABLE dbo.Professor;
GO

-- 1. Student
CREATE TABLE dbo.Student (
    Student_ID INT NOT NULL PRIMARY KEY,
    StudentName NVARCHAR(50) NOT NULL,
    StudentBirth DATE NULL,
    IsMale BIT NULL
);
GO

-- 2. Professor
CREATE TABLE dbo.Professor (
    Employee_ID INT NOT NULL PRIMARY KEY,
    ProfessorName NVARCHAR(50) NOT NULL
);
GO

-- 3. Course
CREATE TABLE dbo.Course (
    Course_ID INT NOT NULL PRIMARY KEY,
    CourseName NVARCHAR(50) NOT NULL,
    ProfessorID INT NOT NULL,
    CONSTRAINT FK_Course_Professor
        FOREIGN KEY (ProfessorID)
        REFERENCES dbo.Professor(Employee_ID)
);
GO

-- 4. Assigned
CREATE TABLE dbo.Assigned (
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Note NVARCHAR(MAX) NULL,

    CONSTRAINT PK_Assigned
        PRIMARY KEY (Student_ID, Course_ID),

    CONSTRAINT FK_Assigned_Student
        FOREIGN KEY (Student_ID)
        REFERENCES dbo.Student(Student_ID),

    CONSTRAINT FK_Assigned_Course
        FOREIGN KEY (Course_ID)
        REFERENCES dbo.Course(Course_ID)
);
GO

-- Insert data into Student
INSERT INTO dbo.Student
    (Student_ID, StudentName, StudentBirth, IsMale)
VALUES
    (1, N'A', '2000-10-01', NULL),
    (2, N'B', '2000-12-01', NULL),
    (3, N'C', '2000-10-10', 0),
    (4, N'D', '2000-08-20', 1),
    (5, N'E', '2000-05-15', NULL),
    (6, N'F', '2000-05-12', NULL);
GO

-- Insert data into Professor
INSERT INTO dbo.Professor
    (Employee_ID, ProfessorName)
VALUES
    (1, N'A'),
    (2, N'B'),
    (3, N'C'),
    (4, N'D');
GO

-- Insert data into Course
INSERT INTO dbo.Course
    (Course_ID, CourseName, ProfessorID)
VALUES
    (1, N'thuật toán', 1),
    (2, N'toán', 2),
    (3, N'vật lý', 4);
GO

-- Insert data into Assigned
INSERT INTO dbo.Assigned
    (Student_ID, Course_ID, Note)
VALUES
    (1, 1, NULL),
    (1, 2, N'Test'),
    (2, 1, NULL),
    (2, 3, NULL);
GO

-- Check University data
SELECT * FROM dbo.Student;
SELECT * FROM dbo.Professor;
SELECT * FROM dbo.Course;
SELECT * FROM dbo.Assigned;
GO


/* ============================================================
   BAI TAP 2 - COMPANY DATABASE
   ============================================================ */

USE master;
GO

IF DB_ID('COMPANY') IS NULL
BEGIN
    CREATE DATABASE COMPANY;
END;
GO

USE COMPANY;
GO

IF OBJECT_ID('dbo.CUSTOMERS', 'U') IS NOT NULL
    DROP TABLE dbo.CUSTOMERS;
GO

CREATE TABLE dbo.CUSTOMERS (
    ID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Age SMALLINT NULL,
    Address NVARCHAR(MAX) NULL,
    Salary DECIMAL(18,0) NULL
);
GO


/* ============================================================
   BAI TAP 3 - INSERT DATA INTO CUSTOMERS
   ============================================================ */

INSERT INTO dbo.CUSTOMERS
    (ID, Name, Age, Address, Salary)
VALUES
    (1, N'Ha Anh', 32, N'Da Nang', 2000),
    (2, N'Van Ha', 25, N'Ha Noi', 1500),
    (3, N'Vu Bang', 23, N'Vinh', 2000),
    (4, N'Thu Minh', 25, N'Ha Noi', 6500);
GO

-- Check COMPANY data
SELECT * FROM dbo.CUSTOMERS;
GO
