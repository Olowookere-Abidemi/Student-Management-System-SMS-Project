
-- STUDENT & ENROLLMENT REPORTS

-- A. How many students are currently enrolled in each course?

	SELECT 
	    c.CourseName,
	    COUNT(e.StudentID) AS NumberOfStudents
	FROM Enrollments e
	JOIN Courses c ON e.CourseID = c.CourseID
	GROUP BY c.CourseName
	ORDER BY NumberOfStudents DESC;

--B. Which students are enrolled in multiple courses, and which courses are they taking?

	SELECT 
	    s.StudentID,
	    s.FullName,
	    COUNT(e.CourseID) AS CoursesEnrolled
	FROM Students s
	JOIN Enrollments e ON s.StudentID = e.StudentID
	GROUP BY s.StudentID, s.FullName
	HAVING COUNT(e.CourseID) > 1
	ORDER BY CoursesEnrolled DESC;

--To see the actual courses they are taking:

	SELECT 
	    s.StudentID,
	    s.FullName,
	    c.CourseID,
	    c.CourseName
	FROM Students s
	JOIN Enrollments e ON s.StudentID = e.StudentID
	JOIN Courses c ON e.CourseID = c.CourseID
	ORDER BY s.StudentID;

--C. What is the total number of students per department across all courses?

	SELECT 
	    d.DepartmentName,
	    COUNT(DISTINCT s.StudentID) AS TotalStudents
	FROM Departments d
	JOIN Students s ON d.DepartmentID = s.DepartmentID
	GROUP BY d.DepartmentName
	ORDER BY TotalStudents DESC;


-- COURSE & INSTRUCTOR ANALYSIS

--D. Which courses have the highest number of enrollments?

	SELECT 
	    c.CourseID,
	    c.CourseName,
	    COUNT(e.EnrollmentID) AS Enrollments
	FROM Courses c
	JOIN Enrollments e ON c.CourseID = e.CourseID
	GROUP BY c.CourseID, c.CourseName
	ORDER BY Enrollments DESC;

--E. Which department has the least number of students?

	SELECT 
	    d.DepartmentName,
	    COUNT(s.StudentID) AS StudentCount
	FROM Departments d
	LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
	GROUP BY d.DepartmentName
	ORDER BY StudentCount ASC
	LIMIT 1;



-- DATA INTEGRITY & OPERATIONAL INSIGHTS

--F. Are there any students not enrolled in any course?

	SELECT 
	    s.StudentID,
	    s.FullName
	FROM Students s
	LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
	WHERE e.StudentID IS NULL;

--G. How many courses does each student take on average?

	SELECT 
	    ROUND(AVG(course_count), 2) AS AvgCoursesPerStudent
	FROM (
	    SELECT 
	        StudentID,
	        COUNT(CourseID) AS course_count
	    FROM Enrollments
	    GROUP BY StudentID
	) sub;


--G. What is the gender distribution of students across courses and instructors?
	SELECT 
	    c.CourseName,
	    i.FirstName ,
	    i.LastName ,
	    s.Gender,
	    COUNT(s.StudentID) AS GenderCount
	FROM Enrollments e
	JOIN Students s ON e.StudentID = s.StudentID
	JOIN Courses c ON e.CourseID = c.CourseID
	JOIN Instructors i ON e.InstructorID = i.InstructorID
	GROUP BY c.CourseName, i.FirstName, i.LastName, s.Gender;

-- H. Which course has the highest number of male or female students enrolled?
	SELECT 
	    c.CourseName,
	    s.Gender,
	    COUNT(*) AS GenderCount
	FROM Enrollments e
	JOIN Students s ON e.StudentID = s.StudentID
	JOIN Courses c ON e.CourseID = c.CourseID
	GROUP BY c.CourseName, s.Gender
	ORDER BY GenderCount DESC
	LIMIT 2;
