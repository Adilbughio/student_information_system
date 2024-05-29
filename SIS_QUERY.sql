--1. *Retrieve all student names:*
    
   SELECT Name FROM Students;
   

--2. *Retrieve all course names and their credits:*
    
   SELECT Course_Name, Credits FROM Courses;
   

--3. *Retrieve all enrolled students name  in a specific course id=2:*
   
   SELECT Students.Name FROM Students
   JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
   WHERE Enrollments.Course_ID = 2;
   

--4. *Retrieve all courses taken by a specific student:*
    
   SELECT Courses.Course_Name FROM Courses
   JOIN Enrollments ON Courses.Course_ID = Enrollments.Course_ID
   WHERE Enrollments.Student_ID = 3;
   

--5. *Retrieve the total number of enrolled students in each course:*
    
   SELECT Course_ID, COUNT(Student_ID) AS Enrolled_Students FROM Enrollments
   GROUP BY Course_ID;
   

--6. *Retrieve the names and emails of students who have enrolled in a specific course:*
    
   SELECT Students.Name, Students.Email FROM Students
   JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
   WHERE Enrollments.Course_ID = 3;
   

--7. *Retrieve the average grade of each student:*
    
   SELECT Student_ID, AVG(Grade) AS Average_Grade FROM Grades
   GROUP BY Student_ID;
   

--8. *Retrieve all students along with the number of courses they have received grades for:*
  
    SELECT Students.Name, COUNT(DISTINCT Grades.Course_ID) AS Graded_Courses FROM Students
    LEFT JOIN Grades ON Students.Student_ID = Grades.Student_ID
    GROUP BY Students.Name;
    

   

--9. *Retrieve all students who have not attended any classes:*
    
   SELECT Students.Name FROM Students
   LEFT JOIN Attendance ON Students.Student_ID = Attendance.Student_ID
   WHERE Attendance.Student_ID IS NULL;
   

--10. *Retrieve the highest grade in each course:*
     
    SELECT Course_ID, MAX(Grade) AS Highest_Grade FROM Grades
    GROUP BY Course_ID;
    

--11. *Retrieve all courses with more than 3 credits:*
     
    SELECT * FROM Courses WHERE Credits > 3;
    

--12. *Retrieve all students who have an email address ending with '@example.com':*
     
    SELECT * FROM Students WHERE Email LIKE '%@example.com';
    

--13. *Retrieve all courses with no enrolled students:*
     
    SELECT Courses.Course_Name FROM Courses
    LEFT JOIN Enrollments ON Courses.Course_ID = Enrollments.Course_ID
    WHERE Enrollments.Course_ID IS NULL;
    

--14. *Retrieve the total number of students in the Students table:*
     
    SELECT COUNT(*) AS Total_Students FROM Students;
    

--15. *Retrieve the student who has the highest grade in a specific course:*
     
    SELECT Students.Name FROM Students
    JOIN Grades ON Students.Student_ID = Grades.Student_ID
    WHERE Grades.Course_ID = 1
    ORDER BY Grades.Grade DESC
   

--16. *Retrieve all students and their corresponding course enrollments:*
     
    SELECT Students.Name, Courses.Course_Name FROM Students
    JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
    JOIN Courses ON Enrollments.Course_ID = Courses.Course_ID;
    

--17. *Retrieve all courses with their respective departments:*
     
    SELECT Course_Name, Department FROM Courses;
    

--18. *Retrieve all courses with their enrollment counts:*
     
    SELECT Courses.Course_Name, COUNT(Enrollments.Enrollment_ID) AS Enrollment_Count FROM Courses
    LEFT JOIN Enrollments ON Courses.Course_ID = Enrollments.Course_ID
    GROUP BY Courses.Course_Name;
    

--19. *Retrieve all students who have attended a class on a specific date:*
     
    SELECT Students.Name FROM Students
    JOIN Attendance ON Students.Student_ID = Attendance.Student_ID
    WHERE Attendance.Date = '2022-01-12';
    

--20. *Retrieve the average grade for a specific student in all their courses:*
     
    SELECT AVG(Grade) AS Average_Grade FROM Grades
    WHERE Student_ID = 7;
    

--21. *Retrieve all students who have the same phone number:*
     
    SELECT Phone, COUNT(*) AS Count FROM Students
    GROUP BY Phone HAVING COUNT(*) > 1;
    

--22 Retrieve the total number of assignments graded per course:*
 
    SELECT Course_ID, COUNT(Grade_ID) AS Total_Assignments FROM Grades
    GROUP BY Course_ID;
     
 --23. *Retrieve the highest grade obtained by each student:*
     
    SELECT Student_ID, MAX(Grade) AS Highest_Grade FROM Grades
    GROUP BY Student_ID;
    

--24. *Retrieve all courses with enrollment dates after a specific date:*
     
    SELECT Courses.Course_Name FROM Courses
    JOIN Enrollments ON Courses.Course_ID = Enrollments.Course_ID
    WHERE Enrollments.Enrollment_Date > '2021-02-15';
    

--25. *Retrieve all students who have a grade less than 80 in any course:*
     
    SELECT DISTINCT Students.Name FROM Students
    JOIN Grades ON Students.Student_ID = Grades.Student_ID
    WHERE Grades.Grade < 80;
    

--26. *Retrieve the number of students enrolled in each course department:*
     
    SELECT Courses.Department, COUNT(Students.Student_ID) AS Enrolled_Students FROM Courses
    JOIN Enrollments ON Courses.Course_ID = Enrollments.Course_ID
    JOIN Students ON Enrollments.Student_ID = Students.Student_ID
    GROUP BY Courses.Department;
    

--27. Retrieve the total number of classes attended by each student:*
    
    SELECT Students.Name, COUNT(Attendance.Attendance_ID) AS Classes_Attended FROM Students
    JOIN Attendance ON Students.Student_ID = Attendance.Student_ID
    GROUP BY Students.Name;
     
	     

--28. *Retrieve all students who have not been graded in any course:*
     
    SELECT Students.Name FROM Students
    LEFT JOIN Grades ON Students.Student_ID = Grades.Student_ID
    WHERE Grades.Student_ID IS NULL;
    

--29. *Retrieve the number of courses each student is enrolled in:*
     
    SELECT Student_ID, COUNT(Course_ID) AS Enrolled_Courses FROM Enrollments
    GROUP BY Student_ID;
    

--30. *Retrieve all students who have attended a class with a specific attendance status:*
     
    SELECT Students.Name FROM Students
    JOIN Attendance ON Students.Student_ID = Attendance.Student_ID
    WHERE Attendance.Attendance_Status = '<status>';
    

--31. *Retrieve the average grade for each assignment for a specific course:*
     
    SELECT Assignment_Name, AVG(Grade) AS Average_Grade FROM Grades
    WHERE Course_ID = 3
    GROUP BY Assignment_Name;
    

--32. Retrieve all courses that have never been assigned a grade:*
   
    SELECT Courses.Course_Name FROM Courses
    LEFT JOIN Grades ON Courses.Course_ID = Grades.Course_ID
    WHERE Grades.Course_ID IS NULL;
    

--33. *Retrieve the course with the highest enrollment:*
     
    SELECT Course_ID, COUNT(Student_ID) AS Enrolled_Students FROM Enrollments
    GROUP BY Course_ID
    ORDER BY Enrolled_Students DESC
    
    

--34. *Retrieve the students who have enrolled in all available courses:*
     
    SELECT Students.Name FROM Students
    WHERE NOT EXISTS (
        SELECT * FROM Courses
        WHERE NOT EXISTS (
            SELECT * FROM Enrollments
            WHERE Enrollments.Student_ID = Students.Student_ID
            AND Enrollments.Course_ID = Courses.Course_ID
        )
    );
    

--35. *Retrieve the course(s) with the lowest average grade:*
     
    SELECT Course_ID, AVG(Grade) AS Average_Grade FROM Grades
    GROUP BY Course_ID
    ORDER BY Average_Grade ASC
    
    

--36. *Retrieve the students who have not attended any class in a specific course:*
     
    SELECT Students.Name FROM Students
    LEFT JOIN Attendance ON Students.Student_ID = Attendance.Student_ID
    WHERE Attendance.Course_ID = 4 AND Attendance.Student_ID IS NULL;
    

--37. *Retrieve the course with the most assignments:*
     
    SELECT Course_ID, COUNT(Assignment_Name) AS Assignment_Count FROM Grades
    GROUP BY Course_ID
    ORDER BY Assignment_Count DESC
    
    

--38. *Retrieve the courses where all students have attended classes:*
     
    SELECT Course_ID FROM Enrollments
    GROUP BY Course_ID
    HAVING COUNT(DISTINCT Student_ID) = (SELECT COUNT(*) FROM Students);
    

--39.Retrieve the names of students along with the total number of grades they have received:*
  
    SELECT Students.Name, COUNT(Grades.Grade_ID) AS Total_Grades FROM Students
    LEFT JOIN Grades ON Students.Student_ID = Grades.Student_ID
    GROUP BY Students.Name;
         

--40.Retrieve the names of students whose names contain a specific substring (e.g., 'John') using LIKE:*
    
    SELECT Name FROM Students
    WHERE Name LIKE '%John%';     
    

--41. *Retrieve the students who have the same address:*
     
    SELECT Address, COUNT(*) AS Count FROM Students
    GROUP BY Address HAVING COUNT(*) > 1;
    

--42. Retrieve the total number of students who have received grades within a specified range (e.g., between 80 and 90) using BETWEEN:*
    
    SELECT COUNT(DISTINCT Student_ID) AS Students_In_Range FROM Grades
    WHERE Grade BETWEEN 80 AND 90;
    

--43. *Retrieve the courses with the highest average grade:*
     
    SELECT Course_ID, AVG(Grade) AS Average_Grade FROM Grades
    GROUP BY Course_ID
    ORDER BY Average_Grade DESC
   
    

--44. *Retrieve the students who have the same name:*
     
    SELECT Name, COUNT(*) AS Count FROM Students
    GROUP BY Name HAVING COUNT(*) > 1;
    

--45. 68. Retrieve the course with the highest average grade using AVG and JOIN:*
   
    SELECT top 1 Courses.Course_Name, AVG(Grades.Grade) AS Average_Grade FROM Courses
    JOIN Grades ON Courses.Course_ID = Grades.Course_ID
    GROUP BY Courses.Course_Name
    ORDER BY Average_Grade DESC
   
    

--46. *Retrieve the courses with no attendance recorded:*
     
    SELECT Courses.Course_Name FROM Courses
    LEFT JOIN Attendance ON Courses.Course_ID = Attendance.Course_ID
    WHERE Attendance.Course_ID IS NULL;
    

--47. count total number of students in our system.

SELECT COUNT(students.name) as Total_students
FROM students


--48. *Retrieve the courses where all enrolled students have passed (grade >= 60):*
     
    SELECT Course_ID FROM Enrollments
    WHERE Course_ID NOT IN (
        SELECT Course_ID FROM Grades
        WHERE Grade < 60
    );
    

--49. *Retrieve the students who have attended the least number of classes:*
     
    SELECT Student_ID, COUNT(Attendance_ID) AS Class_Count FROM Attendance
    GROUP BY Student_ID
    ORDER BY Class_Count ASC
   

--50. *Retrieve the students who have not enrolled in any course:*
     
    SELECT Students.Name FROM Students
    LEFT JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
    WHERE Enrollments.Student_ID IS NULL;