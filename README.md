# Student-Management-System-SMS-Project
A relational SQL-based Student Management System (SMS) designed to replace Excel workflows, ensuring data integrity, efficient academic record management, and dynamic reporting for the Faculty of Environmental Science.

# 📘 Student Management System (SMS)

## Table of Contents

1. [Project Overview](#project-overview)  
2. [Objectives](#objectives)  
   - [Specific Goals](#specific-goals)  
3. [Database Design](#database-design)  
   - [Schema Overview](#schema-overview)  
   - [Entity Relationship Diagram (ERD)](#entity-relationship-diagram-erd)  
   - [Tables and Relationships](#tables-and-relationships)  
4. [Data Definition Language (DDL) Scripts](#data-definition-language-ddl-scripts)  
5. [Data Manipulation Language (DML) Scripts](#data-manipulation-language-dml-scripts)  
6. [Insights and Analysis](#insights-and-analysis)  
   - [Student Enrollment](#student-enrollment)  
   - [Departmental Analytics](#departmental-analytics)  
   - [Course and Instructor Analysis](#course-and-instructor-analysis)  
   - [Operational Insights](#operational-insights)  
   - [Gender Ratio Overview](#gender-ratio-overview)  
7. [Implementation Highlights](#implementation-highlights)  
8. [Future Recommendations](#future-recommendations)  
9. [Conclusion](#conclusion)  
10. [Files Included](#files-included)

---

## Project Overview

The **Student Management System (SMS)** was developed to replace spreadsheet-based student records at the Faculty of Environmental Science with a robust SQL-based solution. This system ensures structured data storage, minimizes redundancy, and enables powerful queries and insights.

### 🔑 Key Features:

- Centralized data management for students, courses, instructors, departments, and enrollments  
- Enforced data integrity via primary/foreign keys and constraints  
- Insightful queries for academic planning and administration  

---

## Objectives

- **Design a relational database** for managing students, courses, instructors, departments, and enrollments.
- **Facilitate dynamic and structured data operations**, such as course registration, instructor allocation, and student tracking.
- **Generate insightful reports** for academic and administrative use.

## Specific Goals

- Ensure **data accuracy and referential integrity** using foreign key constraints and validation rules.
- **Migrate** from flat Excel files to a **normalized SQL database**.
- Enable efficient querying for **metrics** such as:
  - Enrollment trends
  - Departmental performance


---

## Database Design

### Schema Overview

The SMS database includes the following core tables:

- **Departments**: Defines academic departments.
- **Students**: Stores student biodata, departmental affiliation, and entry year.
- **Courses**: Holds course information, including credit units and department alignment.
- **Instructors**: Captures staff details and their areas of specialization.
- **Enrollments**: Connects students with courses and instructors (many-to-many relationship).

### Entity Relationship Diagram (ERD)

- **One Department** ➝ **Many Students**
- **One Department** ➝ **Many Courses**
- **One Instructor** ➝ **Many Enrollments** (via courses)
- **One Student** ➝ **Many Enrollments** ➝ **Many Courses**

![ER Diagram](https://github.com/Olowookere-Abidemi/Student-Management-System-SMS-Project/blob/main/ER%20Diagram.png?raw=true)

### Tables and Relationships

#### 🏢 Departments
- `DepartmentID` (PK)  
- `DepartmentName`  

#### 👨‍🎓 Students
- `StudentID` (PK)  
- `FirstName`, `LastName`  
- `Gender` *(CHECK: 'Male', 'Female')*  
- `DOB`, `EntryYear`  
- `DepartmentID` (FK)  
- `Level` *(CHECK: 100–500)*  

#### 📘 Courses
- `CourseID` (PK)  
- `CourseName`, `CreditUnit`  
- `Level`, `DepartmentID` (FK)  

#### 👨‍🏫 Instructors
- `InstructorID` (PK)  
- `FirstName`, `LastName`  
- `Gender`, `Email`, `Specialization`  
- `DepartmentID` (FK)  

#### 📋 Enrollments
- `EnrollmentID` (PK)  
- `StudentID` (FK)  
- `CourseID` (FK)  
- `InstructorID` (FK)  
- `EnrollmentDate`  

---

## Data Definition Language (DDL) Scripts

The DDL scripts define the structure of the database, including tables, columns, data types, and constraints. These scripts ensure the database adheres to the designed schema and maintains data integrity.

- Created database: `SMS`
- Defined tables:
  - `Departments`
  - `Students`
  - `Courses`
  - `Instructors`
  - `Enrollments`
- Used appropriate data types:
  - `VARCHAR`, `DATE`, `SMALLINT`, etc.
- Applied constraints:
  - `CHECK`, `NOT NULL`, `PRIMARY KEY`, `FOREIGN KEY`


> 📄 *Refer to [`ddl.sql`](https://github.com/Olowookere-Abidemi/Student-Management-System-SMS-Project/blob/main/DDL%20SCRIPT.sql) for full implementation.*

---

## Data Manipulation Language (DML) Scripts

DML scripts handle the insertion, updating, filtering and deletion of data within the database. They are essential for populating the database with initial data and for ongoing data management.

- Populated tables with **real-world data** extracted from faculty spreadsheets.
- Wrote complex queries to:
  - 📊 **Track enrollments**
  - ❌ **Identify unregistered students**
  - 🚻 **Analyze gender distributions**
  - 🧮 **Count courses per student**
  - 📉📈 **Monitor departmental growth and decline**

> 📄 *Refer to [`dml.sql`](https://github.com/Olowookere-Abidemi/Student-Management-System-SMS-Project/blob/main/DML%20SCRIPT.sql) for full implementation.*

---

## Insights and Analysis

### Student Enrollment

#### 🔝 Top Enrolled Courses
- **BUI20001 – Aggregate Visionary ROI**: 14 students  
- **URP30004 – Implement Enterprise Solutions**: 12 students  

#### ⚖️ Uniform Course Load
- **All 240 students** enrolled in **exactly 3 courses**

---

### Departmental Analytics

- **Most Students**: Architecture — 49 students  
- **Least Students**: Urban & Regional Planning — 33 students  
- **Balanced Distribution**: Only a **16-student difference** between the highest and lowest department populations

---

### Course and Instructor Analysis

#### ⬇️ Low Enrollment Courses
- **92 out of 150 courses** had **5 or fewer students**
- **2 courses** had **zero enrollment**

#### 🧑‍🏫 Gender Trends by Instructor

| Instructor       | Female Students | Male Students | Balance         |
|------------------|------------------|----------------|------------------|
| Samantha Brooks  | 15               | 6              | Female dominant |
| Jason Ford       | 2                | 10             | Male dominant   |
| Olivia Bishop    | 10               | 10             | Perfect balance |

---

### Operational Insights

- ✅ **All students registered** — indicating a **streamlined enrollment process**
- 📈 **Average course load**: 3.00 courses per student

---

### Gender Ratio Overview

- **Female**: 393 students (**54.6%**)  
- **Male**: 327 students (**45.4%**)

#### 🧪 Notable Gender-Specific Courses

- **SVG – Embrace Dot-Com ROI**: 8 female students (**100% female**)  
- **QS – Drive Intuitive E-Markets**: 3 male students (**100% male**)  
- **BUI – Aggregate Visionary ROI**: Gender balanced (**7 male, 7 female**)

---

## Implementation Highlights

- ✅ **Consistent Naming**: `STU_`, `INS_`, etc. used for clarity  
- ✅ **Constraints**: `CHECK`, `NOT NULL`, and foreign keys implemented  
- ✅ **Data Import**: Structured **CSV files** used for populating data  
- ✅ **Optimized Queries**: Efficient use of `GROUP BY`, `JOIN`s, and indexes

---

## Future Recommendations

### 🖥️ Web Front-End
- Integrate a **dashboard interface** to enable:
  - User-friendly interaction
  - Live querying and data visualization
  - Real-time enrollment status monitoring

### 📜 Audit Logging
- Implement detailed **audit logs** to track:
  - Enrollment modifications
  - Grade updates
  - Instructor/course assignment changes

### 🧱 Schema Expansion
Expand the existing relational schema to support:

- **Assessment Tracking**
  - Store and manage test scores, assignment results, and final grades
- **Graduation Eligibility**
  - Automate checks for credit completion and graduation requirements
  - Generate academic transcripts
- **Curriculum Structuring**
  - Manage **course prerequisites**
  - Enable **semester-based course scheduling**

---

## Conclusion

This project demonstrates the transformation of fragmented academic records into a **powerful relational database system** using **PostgreSQL**. The result is a secure, scalable, and insightful **Student Management System (SMS)** for the **Faculty of Environmental Science**.

- ✅ Maintains **data integrity**  
- ✅ Supports **academic planning**  
- ✅ Scales with **institutional growth**

## Files Included

- **`ddl.sql`** – Contains the SQL script for **schema creation**, including all table definitions with appropriate constraints and relationships.

- **`dml.sql`** – Contains **data manipulation queries**, insightful reports, and data integrity checks for the Student Management System.

- **`ERD Diagram`** – A graphical **Entity-Relationship Diagram** showing how the tables (Students, Courses, Departments, Instructors, Enrollments) are interconnected.

- **`Dataset`** – Excel file containing the raw data used to populate the database (e.g., student records, course lists, instructor details).

- **`README.md`** – This **documentation file** providing an overview, objectives, schema explanation, analysis insights, implementation details, and future enhancements of the project.
