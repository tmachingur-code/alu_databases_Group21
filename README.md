# ALU Database Schema Project — Group 21

A MySQL relational database for a school system, built as a group assignment.

## Database

- Name: `group21`
- Engine: MySQL

## Entities

| Table | Owner | Depends on |
|---|---|---|
| Classroom | Member B | — |
| Students | Member A | Classroom |
| Faculty | Member C | — |
| Courses | Member D | Faculty, Classroom |
| Extra_Curricular_Activities | Member E | Faculty |
| Student_Courses (junction) | Member E | Students, Courses |
| Student_Activities (junction) | Member E | Students, Extra_Curricular_Activities |

## How to run

1. Clone the repo:
   ```bash
   git clone https://github.com/tmachingur-code/alu_databases_Group21.git
   cd alu_databases_Group21
   ```
2. Open `group21.sql` in your MySQL client

3. Run the full script top to bottom. It will:
   - Create the `group21` database
   - Create all 7 tables in dependency order
   - Insert sample data
   - Run each member's UPDATE / DELETE / SELECT statements
   - Run the group JOIN and aggregate queries

## Team

| Member | Table(s) owned |
|---|---|
| Member A | Students |
| Member B | Classroom |
| Member C | Faculty |
| Member D | Courses |
| Member E | Extra_Curricular_Activities, Student_Courses, Student_Activities |
