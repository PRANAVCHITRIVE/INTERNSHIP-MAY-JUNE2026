-- =========================================
-- TASK 4 : ANALYTICAL REPORTS
-- =========================================

USE StudentManagement;

-- =========================================
-- REPORT 1
-- AVERAGE GRADE BY GENDER
-- =========================================

SELECT
    s.Gender,
    ROUND(AVG(e.Grade),2) AS AverageGrade
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
GROUP BY s.Gender;


-- =========================================
-- REPORT 2
-- PASS RATE PER COURSE
-- PASS MARK = 40
-- =========================================

SELECT
    c.CourseName,

    COUNT(*) AS TotalStudents,

    SUM(
        CASE
            WHEN e.Grade >= 40 THEN 1
            ELSE 0
        END
    ) AS PassedStudents,

    ROUND(
        SUM(
            CASE
                WHEN e.Grade >= 40 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS PassPercentage

FROM Enrollments e
JOIN Courses c
    ON e.CourseID = c.CourseID

GROUP BY c.CourseName

ORDER BY PassPercentage DESC;


-- =========================================
-- REPORT 3
-- TOP 3 STUDENTS OVERALL
-- BASED ON AVERAGE GRADE
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    ROUND(AVG(e.Grade),2) AS AverageGrade

FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID

GROUP BY s.StudentID, s.Name

ORDER BY AverageGrade DESC

LIMIT 3;


-- =========================================
-- REPORT 4
-- STUDENTS ENROLLED IN MORE THAN 2 COURSES
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    COUNT(e.CourseID) AS NumberOfCourses

FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID

GROUP BY s.StudentID, s.Name

HAVING COUNT(e.CourseID) > 2

ORDER BY NumberOfCourses DESC;


-- =========================================
-- REPORT 5 (OPTIONAL ADVANCED)
-- IMPROVEMENT REPORT
-- =========================================

-- Current database does not contain
-- Semester/Term information.
-- Therefore this report cannot be generated
-- unless a Semester column is added.


-- =========================================
-- OUTPUT TABLES FOR SCREENSHOTS
-- =========================================

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;