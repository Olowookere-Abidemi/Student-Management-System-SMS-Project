-- 1. Departments Table

CREATE TABLE Departments (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

SELECT * FROM Departments

-- 2. Students Table

CREATE TABLE Students (
    StudentID VARCHAR(15) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    DOB DATE NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    Level SMALLINT CHECK (Level IN (100, 200, 300, 400, 500)),
    EntryYear SMALLINT CHECK (EntryYear BETWEEN 2000 AND EXTRACT(YEAR FROM CURRENT_DATE)::SMALLINT),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

SELECT * FROM Students

-- 3. Courses Table

CREATE TABLE Courses (
    CourseID VARCHAR(15) PRIMARY KEY,
    CourseName VARCHAR(150) NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    Level SMALLINT CHECK (Level IN (100, 200, 300, 400, 500)),
    CreditUnit SMALLINT CHECK (CreditUnit BETWEEN 1 AND 4),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

SELECT * FROM Courses

-- 4. Instructors Table

CREATE TABLE Instructors (
    InstructorID VARCHAR(15) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    Specialization VARCHAR(150),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

SELECT * FROM Instructors

-- 5. Enrollments Table

CREATE TABLE Enrollments (
    EnrollmentID VARCHAR(15) PRIMARY KEY,
    StudentID VARCHAR(15) NOT NULL,
    CourseID VARCHAR(15) NOT NULL,
    InstructorID VARCHAR(15) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

SELECT * FROM Enrollments

