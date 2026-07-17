--ALU Database Schema Project
--Database: group21

CREATE DATABASE IF NOT EXISTS group21;
USE group21;

-- ============================================================
-- MEMBER A: STUDENTS TABLE
-- ============================================================

CREATE TABLE


INSERT (5+ rows)


UPDATE


DELETE


SELECT with WHERE


-- ============================================================
-- MEMBER B: CLASSROOM TABLE
-- ============================================================

CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number varchar(10) not null,
    building VARCHAR(50) not null,
    capacity INT not null
);


INSERT INTO Classroom (classroom_id, room_number, building, capacity)
VALUES
(001, '101', 'Science Building', 40),
(002, '102', 'Fine Arts Center', 50),
(003, '103', 'Language Lab', 30),
(004, '104', 'Technology Laboratory', 25),
(005, '105', 'Leadership Center', 50);


UPDATE Classroom
SET capacity = 45
WHERE classroom_id = 001;


DELETE FROM Classroom
WHERE classroom_id = 005;


SELECT * FROM Classroom
WHERE building = 'Science Building';


-- ============================================================
-- MEMBER C: FACULTY TABLE
-- ============================================================

CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    department VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2)
);

-INSERT (5+ rows)


UPDATE


DELETE


SELECT with WHERE


-- ============================================================
-- MEMBER D: COURSES TABLE
-- ============================================================

CREATE TABLE


INSERT (5+ rows)


UPDATE


DELETE


SELECT with WHERE


-- ============================================================
-- MEMBER E: EXTRA_CURRICULAR_ACTIVITIES + JUNCTION TABLES
-- ============================================================

CREATE TABLE 


CREATE TABLE Student_Courses


CREATE TABLE Student_Activities


INSERT (5+ rows each)


UPDATE


DELETE


SELECT with WHERE


-- ============================================================
-- GROUP TASKS
-- ============================================================


-- Join query 1


-- Join query 2


-- Join query 3


-- Aggregate query (COUNT / GROUP BY)
