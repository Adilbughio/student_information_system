
CREATE DATABASE SIS;

USE SIS;

--CREATING TABLES ---

CREATE TABLE Students (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Phone VARCHAR(20),
  Address VARCHAR(100)
);

CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,
  Course_Name VARCHAR(50),
  Credits INT,
  Department VARCHAR(50)
);

CREATE TABLE Enrollments (
  Enrollment_ID INT PRIMARY KEY,
  Student_ID INT,
  Course_ID INT,
  Enrollment_Date DATE,
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE Grades (
  Grade_ID INT PRIMARY KEY,
  Student_ID INT,
  Course_ID INT,
  Assignment_Name VARCHAR(50),
  Grade INT,
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE Attendance (
  Attendance_ID INT PRIMARY KEY,
  Student_ID INT,
  Course_ID INT,
  Date DATE,
  Attendance_Status VARCHAR(10),
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

--Insert Records:

INSERT INTO Students (Student_ID, Name, Email, Phone, Address)
VALUES
(1, 'John Doe', 'johndoe@example.com', '1234567890', '123 Main St'),
(2, 'Jane Smith', 'janesmith@example.com', '9876543210', '456 Elm St'),
(3, 'Bob Johnson', 'bobjohnson@example.com', '5678901234', '789 Oak St'),
(4, 'Alice Brown', 'alicebrown@example.com', '2345678901', '321 Maple St'),
(5, 'Mike Davis', 'mikedavis@example.com', '9012345678', '567 Pine St'),
(6, 'Emily Taylor', 'emilytaylor@example.com', '6789012345', '901 Cedar St'),
(7, 'Sarah Lee', 'sarahlee@example.com', '3456789012', '234 Walnut St'),
(8, 'Kevin White', 'kevinwhite@example.com', '1234890765', '678 Spruce St'),
(9, 'Lisa Harris', 'lisaharris@example.com', '7654321098', '890 Fir St'),
(10, 'Tom Jackson', 'tomjackson@example.com', '4567890123', '567 Larch St');

--Courses Table:

INSERT INTO Courses (Course_ID, Course_Name, Credits, Department)
VALUES
(1, 'Introduction to Computer Science', 3, 'Computer Science'),
(2, 'Calculus', 4, 'Mathematics'),
(3, 'English Literature', 3, 'English'),
(4, 'Biology', 4, 'Biology'),
(5, 'Physics', 4, 'Physics'),
(6, 'Data Structures', 3, 'Computer Science'),
(7, 'Algorithms', 3, 'Computer Science'),
(8, 'Operating Systems', 3, 'Computer Science'),
(9, 'Database Systems', 3, 'Computer Science'),
(10, 'Software Engineering', 3, 'Computer Science');

--Enrollments Table:

INSERT INTO Enrollments (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date)
VALUES
(1, 1, 1, '2022-01-01'),
(2, 2, 2, '2022-01-05'),
(3, 3, 3, '2022-01-10'),
(4, 1, 4, '2022-01-15'),
(5, 2, 5, '2022-01-20'),
(6, 3, 6, '2022-01-25'),
(7, 1, 7, '2022-02-01'),
(8, 2, 8, '2022-02-05'),
(9, 3, 9, '2022-02-10'),
(10, 1, 10, '2022-02-15');

--Grades Table:

INSERT INTO Grades (Grade_ID, Student_ID, Course_ID, Assignment_Name, Grade)
VALUES
(1, 1, 1, 'Homework 1', 85.00),
(2, 2, 2, 'Quiz 1', 90.00),
(3, 3, 3, 'Midterm Exam', 78.00),
(4, 1, 4, 'Homework 2', 92.00),
(5, 2, 5, 'Project', 88.00),
(6, 3, 6, 'Final Exam', 95.00),
(7, 1, 7, 'Homework 3', 89.00),
(8, 2, 8, 'Quiz 2', 91.00),
(9, 3, 9, 'Group Project', 82.00),
(10, 1, 10, 'Final Project', 98.00);

INSERT INTO Attendance (Attendance_ID, Student_ID, Course_ID, Date, Attendance_Status) VALUES
(3, 3, 3, '2022-01-12', 'Present'),
(4, 1, 1, '2022-01-08', 'Late'),
(5, 2, 2, '2022-01-15', 'Absent'),
(6, 3, 6, '2022-02-02', 'Present'),
(7, 1, 7, '2022-02-10', 'Present'),
(8, 2, 8, '2022-02-12', 'Late'),
(9, 3, 9, '2022-02-15', 'Absent'),
(10, 1, 10, '2022-02-20', 'Present');

