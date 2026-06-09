-- =========================================
-- TASK 3 : ADVANCED SQL ANALYSIS
-- =========================================

-- =========================================
-- QUERY 1
-- TOP STUDENT IN EACH COURSE
-- =========================================

USE StudentManagement;

SELECT
    c.CourseName,
    s.StudentID,
    s.Name,
    e.Grade
FROM Enrollments e
JOIN Students s
    ON e.StudentID = s.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE e.Grade = (
    SELECT MAX(e2.Grade)
    FROM Enrollments e2
    WHERE e2.CourseID = e.CourseID
)
ORDER BY c.CourseName;

-- =========================================
-- QUERY 2
-- PASS RATE PER COURSE
-- (GRADE >= 40)
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
    ) AS PassRatePercentage

FROM Enrollments e
JOIN Courses c
    ON e.CourseID = c.CourseID

GROUP BY c.CourseName;

-- =========================================
-- QUERY 3
-- OVERALL TOPPER ACROSS ALL COURSES
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    AVG(e.Grade) AS AverageGrade

FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID

GROUP BY s.StudentID, s.Name

ORDER BY AverageGrade DESC

LIMIT 1;

-- =========================================
-- QUERY 4
-- STUDENTS ENROLLED IN MULTIPLE COURSES
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    COUNT(e.CourseID) AS NumberOfCourses

FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID

GROUP BY s.StudentID, s.Name

HAVING COUNT(e.CourseID) > 1

ORDER BY NumberOfCourses DESC;

-- =========================================
-- OPTIONAL OUTPUTS FOR SCREENSHOTS
-- =========================================

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;