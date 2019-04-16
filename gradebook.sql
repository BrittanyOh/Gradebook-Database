-- MAIN.SQL
-- These are the commands I used to create the Gradebook database and its additional tables
CREATE DATABASE Gradebook
USE Gradebook

CREATE TABLE Professors(
  ProfessorID int NOT NULL,
  FirstName varchar(30) NOT NULL,
  LastName varchar(30) NOT NULL,
  PRIMARY KEY (ProfessorID)
);

CREATE TABLE Students (
StudentID int NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
PRIMARY KEY (StudentID)
);

CREATE TABLE Courses (
CourseID int NOT NULL auto_increment,
DepartmentID int NOT NULL,
CourseNumber int NOT NULL,
CourseName varchar(50) NOT NULL,
ProfessorID int NOT NULL,
Semester varchar(10) NOT NULL,
Year int NOT NULL,
PRIMARY KEY (CourseID)
);

CREATE TABLE Departments(
  Department varchar(20) NOT NULL,
  DepartmentID int NOT NULL,
  PRIMARY KEY (DepartmentID)
);

CREATE TABLE Enrollment (
StudentID int NOT NULL,
CourseID int NOT NULL,
PRIMARY KEY (StudentID, CourseID)
);

CREATE TABLE Categories (
CategoryID int NOT NULL auto_increment,
CourseID int NOT NULL,
CategoryName varchar(20) NOT NULL,
Percent int NOT NULL,
PRIMARY KEY (CategoryID)
);

CREATE TABLE Assignments (
AssignmentID int NOT NULL auto_increment,
CategoryID int NOT NULL,
PointsPossible int DEFAULT 0 NOT NULL,
PRIMARY KEY(AssignmentID)
);

CREATE TABLE Student_Grades (
StudentID int NOT NULL,
AssignmentID int NOT NULL,
Points int DEFAULT 0 NOT NULL,
PRIMARY KEY (StudentID, AssignmentID)
);
