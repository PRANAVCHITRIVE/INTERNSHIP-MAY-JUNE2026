

-- Create Database
CREATE DATABASE StudentManagement;

-- Use Database
USE StudentManagement;
-- Create Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);




-- 2. INSERT DATA
INSERT INTO Students
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Aarav', 'M', 18, 'A', 85, 90, 88),
('Priya', 'F', 17, 'A', 92, 95, 91),
('Rahul', 'M', 18, 'B', 76, 80, 72),
('Sneha', 'F', 17, 'A', 89, 84, 90),
('Karan', 'M', 19, 'C', 65, 70, 68),
('Anjali', 'F', 18, 'B', 78, 82, 85),
('Vikram', 'M', 17, 'A', 95, 93, 97),
('Meera', 'F', 18, 'B', 88, 79, 84),
('Rohan', 'M', 19, 'C', 60, 67, 70),
('Isha', 'F', 17, 'A', 91, 89, 94);




-- SQL QUERIES TO PERFORM
-- 1. Show all student details
SELECT * FROM Students;
-- 2. Average score in each subject
SELECT 
AVG(MathScore) AS AvgMathScore,
AVG(ScienceScore) AS AvgScienceScore,
AVG(EnglishScore) AS AvgEnglishScore
FROM Students;

-- 3. Top performer (highest total score)
SELECT 
StudentID,
Name,
(MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- 4. Count students per grade
SELECT 
Grade,
COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

-- 5. Average score by gender
SELECT 
Gender,
AVG(MathScore) AS AvgMath,
AVG(ScienceScore) AS AvgScience,
AVG(EnglishScore) AS AvgEnglish
FROM Students
GROUP BY Gender;

-- 6. Students with Math score > 80
SELECT *
FROM Students
WHERE MathScore > 80;

-- 7. Update a student's grade
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 5;

-- Verify Updated Record
SELECT * FROM Students
WHERE StudentID = 5;

