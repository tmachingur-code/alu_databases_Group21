--ALU Database Schema Project
--Database: group21

CREATE DATABASE IF NOT EXISTS group21;
USE group21;


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
-- MEMBER A: STUDENTS TABLE
-- ============================================================
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('Tess Ikenwe', 'tess.ikenwe@alu.edu', 1, '2024-09-02'),
('Aline Uwase', 'aline.uwase@alu.edu', 2, '2024-09-02'),
('Eric Mugisha', 'eric.mugisha@alu.edu', 1, '2024-09-03'),
('Grace Niyonsaba', 'grace.niyonsaba@alu.edu', 3, '2024-09-03'),
('David Habimana', 'david.habimana@alu.edu', 4, '2024-09-04');

UPDATE Students
SET email = 'tess.ikenwe2@alu.edu'
WHERE student_id = 1;

DELETE FROM Students
WHERE student_id = 5;

SELECT * FROM Students
WHERE classroom_id = 1;


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

INSERT INTO Faculty (first_name, last_name, email, phone_number, department, hire_date, salary)
VALUES
('Alice', 'Mugisha', 'alice.mugisha@alu.edu', '0781234567', 'Computer Science', '2018-08-15', 65000.00),
('Brian', 'Kagame', 'brian.kagame@alu.edu', '0782345678', 'Mathematics', '2015-01-10', 60000.00),
('Chantal', 'Uwase', 'chantal.uwase@alu.edu', '0783456789', 'Fine Arts', '2020-09-01', 55000.00),
('David', 'Niyonzima', 'david.niyonzima@alu.edu', '0784567890', 'Languages', '2019-03-22', 58000.00),
('Eva', 'Mukamana', 'eva.mukamana@alu.edu', '0785678901', 'Leadership Studies', '2021-06-05', 62000.00);

UPDATE Faculty
SET salary = 68000.00
WHERE faculty_id = 1;

DELETE FROM Faculty
WHERE faculty_id = 5;

SELECT * FROM Faculty
WHERE department = 'Computer Science';

-- ============================================================
-- MEMBER D: COURSES TABLE
-- ============================================================

CREATE TABLE Courses (
	course_id  INT AUTO_INCREMENT PRIMARY KEY,
	course_name  VARCHAR(100) NOT NULL,
	credits  INT NOT NULL,
	faculty_id  INT NOT NULL,
	classroom_id  INT NOT NULL,
	CONSTRAINT fk_courses_faculty
	   FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
	CONSTRAINT fk_courses_classroom
	   FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);


INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Introduction to Programming', 3, 1, 1),
('Calculus I', 3, 2, 3),
('Studio Art', 2, 3, 2),
('French Language', 3, 4, 3),
('Data Structures', 4, 1, 4);



UPDATE Courses
SET credits = 4
WHERE course_id = 3;

DELETE FROM Courses
WHERE course_id = 5; 


SELECT * FROM Courses
WHERE faculty_id = 1;


-- ============================================================
-- MEMBER E: EXTRA_CURRICULAR_ACTIVITIES + JUNCTION TABLES
-- ============================================================

CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    faculty_advisor_id INT,
    CONSTRAINT fk_activities_faculty
        FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_studentcourses_student
        FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_studentcourses_course
        FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    PRIMARY KEY (student_id, activity_id),
    CONSTRAINT fk_studentactivities_student
        FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_studentactivities_activity
        FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);


INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id)
VALUES
('Chess Club', 'Games', 2),
('Debate Society', 'Academic', 1),
('Choir', 'Music', 3),
('Basketball Team', 'Sports', 4),
('Coding Club', 'Technology', 1);

INSERT INTO Student_Courses (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4);

INSERT INTO Student_Activities (student_id, activity_id)
VALUES
(1, 4),
(2, 1),
(2, 3),
(3, 2),
(4, 4);

UPDATE Extra_Curricular_Activities
SET faculty_advisor_id = 2
WHERE activity_id = 4;

DELETE FROM Extra_Curricular_Activities
WHERE activity_id = 5;

SELECT * FROM Extra_Curricular_Activities
WHERE category = 'Academic';


-- ============================================================
-- GROUP TASKS
-- ============================================================


-- Relationships check: confirmed all foreign keys reference
-- valid, existing primary keys in their target tables. No
-- orphaned references found across Students, Classroom,
-- Faculty, Courses, Extra_Curricular_Activities, or the two
-- junction tables.

-- ------------------------------------------------------------
-- Normalization check:
-- No table repeats data that belongs elsewhere — each entity
-- (Students, Classroom, Faculty, Courses, Activities) stores
-- only its own attributes, and relationships between entities
-- are captured through foreign keys rather than duplicated
-- columns. The many-to-many relationships (a student can take
-- many courses and a course can have many students; a student
-- can join many activities and an activity can have many
-- students) are correctly handled through the Student_Courses
-- and Student_Activities junction tables, rather than storing
-- repeated or comma-separated values inside the Students table
-- itself. This keeps the schema in a normalized form with no
-- redundant data.
-- ------------------------------------------------------------

-- Join query 1: Student enrolled in Course, taught by Faculty, in Classroom
SELECT
    s.name AS student_name,
    c.course_name,
    f.name AS faculty_name,
    cl.room_number
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;
 
-- Join query 2: Student participates in Activity, advised by Faculty
SELECT
    s.name AS student_name,
    a.activity_name,
    f.name AS advisor_name
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;
 
-- Join query 3: Student's classroom and building
SELECT
    s.name AS student_name,
    cl.room_number,
    cl.building
FROM Students s
JOIN Classroom cl ON s.classroom_id = cl.classroom_i


-- Aggregate query (COUNT / GROUP BY)
