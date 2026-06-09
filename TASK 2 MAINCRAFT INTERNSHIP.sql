-- =========================================
-- TASK 2 : EXTENDING THE STUDENT MANAGEMENT DATABASE
-- =========================================

-- =========================================
-- CREATE COURSES TABLE
-- =========================================

USE StudentManagement;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100)
);

-- =========================================
-- INSERT COURSES
-- =========================================

INSERT INTO Courses (CourseName)
VALUES
('Database Management'),
('Data Structures'),
('Web Development'),
('Python Programming'),
('Machine Learning');

-- =========================================
-- CREATE ENROLLMENTS TABLE
-- =========================================

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade INT,

    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),

    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)
);

-- =========================================
-- INSERT ENROLLMENT RECORDS
-- =========================================

INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES
(1,1,85),
(1,2,78),

(2,1,92),
(2,3,88),

(3,2,65),
(3,4,70),

(4,1,90),
(4,5,84),

(5,3,35),
(5,4,40),

(6,2,82),
(6,5,79),

(7,1,96),
(7,4,94),

(8,3,88),
(8,5,81),

(9,2,38),
(9,4,45),

(10,1,91),
(10,5,89);

-- =========================================
-- TASK 2 QUERY 1
-- LIST ALL STUDENTS ENROLLED IN EACH COURSE
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    c.CourseName,
    e.Grade
FROM Enrollments e
JOIN Students s
ON e.StudentID = s.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
ORDER BY c.CourseName;

-- =========================================
-- TASK 2 QUERY 2
-- FIND AVERAGE GRADE PER COURSE
-- =========================================

SELECT
    c.CourseName,
    AVG(e.Grade) AS AverageGrade
FROM Enrollments e
JOIN Courses c
ON e.CourseID = c.CourseID
GROUP BY c.CourseName;

-- =========================================
-- TASK 2 QUERY 3
-- FIND TOP 3 STUDENTS OVERALL
-- =========================================

SELECT
    s.StudentID,
    s.Name,
    AVG(e.Grade) AS AverageScore
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
ORDER BY AverageScore DESC
LIMIT 3;

-- =========================================
-- TASK 2 QUERY 4
-- COUNT STUDENTS WHO FAILED
-- =========================================

SELECT
    COUNT(*) AS FailedStudents
FROM Enrollments
WHERE Grade < 40;

-- =========================================
-- OPTIONAL OUTPUT TABLES
-- =========================================

SELECT * FROM Courses;
SELECT * FROM Enrollments;

