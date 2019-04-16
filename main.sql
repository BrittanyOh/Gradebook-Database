-- 3) Show the tables
SELECT * FROM Professors;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Departments;
SELECT * FROM Enrollment;
SELECT * FROM Categories;
SELECT * FROM Assignments;
SELECT * FROM Student_Grades;

-- 4) Computer the average/highest/lowest score of an assignment
-- Chose to use assignmentID = 30
SELECT AVG(POINTS) FROM Student_Grades WHERE assignmentID=30;
SELECT MAX(POINTS) FROM Student_Grades WHERE assignmentID=30;
SELECT MIN(POINTS) FROM Student_Grades WHERE assignmentID=30;

-- 5) List all of the students in a given course
-- List all current students and there current classes
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students, Courses, Enrollment
WHERE Students.studentID = Enrollment.studentID
AND Enrollment.courseID = Courses.courseID;

-- List all students currently enrolled in 'Destinys Story' courseID = 4
SELECT DISTINCT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students, Courses, Enrollment
WHERE Students.studentID = Enrollment.studentID
AND Courses.courseID = 4;

-- 6) List all of the students in a course and all of their scores on every assignment
-- Check assignments from 'Destinys Story' courseID = 4
SELECT DISTINCT s.firstName, s.lastName, sg.*, Courses.CourseName
FROM Courses, Student_Grades sg
JOIN Students s ON s.studentID = sg.studentID
JOIN Enrollment e ON e.studentID = sg.studentID
WHERE Courses.courseID=4;

-- 7) Add an assignment to a course
-- Added an assignment to Test worth 100 points
INSERT INTO Assignments (CategoryID, PointsPossible) VALUES (1, 100);

-- 8) Change the percentages of the categories for a course
SELECT * FROM Categories;
UPDATE Categories
    SET percent = 50
    WHERE categoryID = 1;
SELECT * FROM Categories;
UPDATE Categories
    SET percent=5
    WHERE categoryID = 2;
SELECT * FROM Categories;
UPDATE Categories
  SET percent=5
  WHERE categoryID = 3;
SELECT * FROM Categories;
UPDATE Categories
  SET percent=40
  WHERE categoryID = 3;
SELECT * FROM Categories;

-- 9) Add 2 points to the score of each student on an assignment
-- Added 2 points to all students on assignment 7
SELECT DISTINCT s.*, sg.* FROM Student_Grades sg, Students s where sg.studentID = s.studentID AND sg.assignmentID=7;

UPDATE Student_Grades sg
    JOIN Students s on s.studentID = sg.studentID
    SET Points = Points + 2
    Where assignmentID = 7;

SELECT DISTINCT s.*, sg.* FROM Student_Grades sg, Students s where sg.studentID = s.studentID AND sg.assignmentID=7;


-- 10) Add 2 points just to those students whose last name contains a ‘Q’.
-- Added 2 points to students containing Q in lastname on assignment 18
SELECT DISTINCT s.*, sg.* FROM Student_Grades sg, Students s where sg.studentID = s.studentID AND sg.assignmentID=18;

UPDATE Student_Grades sg
    JOIN Students s on s.studentID = sg.studentID
    SET Points = Points + 2
    Where assignmentID = 18
    and s.LastName like '%Q%';

SELECT DISTINCT s.*, sg.* FROM Student_Grades sg, Students s where sg.studentID = s.studentID AND sg.assignmentID=18;


-- 11) Compute the grade for a student
-- Computing final grade for student 1 from
SELECT SUM((sg.points/a.pointsPossible) * (ca.percent/total.counter)) AS Final_Grade
FROM Student_Grades sg
LEFT JOIN Assignments a ON sg.assignmentID = a.assignmentID
JOIN Categories ca ON ca.categoryID = a.categoryID
JOIN (SELECT ca.categoryID, count(*) AS counter FROM Student_Grades sg
        LEFT JOIN assignments a ON sg.assignmentID = a.assignmentID
        JOIN Categories ca ON ca.categoryID = a.categoryID
        WHERE courseID=3 AND studentID=1 GROUP BY ca.categoryID)
        total ON total.categoryID= ca.categoryID
WHERE courseID=3
AND studentID=1;


-- 12) Compute the grade for a student, where the lowest score for a given category is dropped.
-- Commute grade for course 3 and student 1 
SELECT SUM(
  IF(
    (ca.categoryName='Written Assignments' AND sg.points/a.PointsPossible<=lowest.grade),
    ca.percent/total.counter,
    (sg.points/a.pointsPossible) * (ca.percent/total.counter)
  )
) AS Final_Grade
FROM Student_Grades sg
LEFT JOIN Assignments a ON sg.assignmentID = a.assignmentID
JOIN Categories ca  on ca.categoryID = a.categoryID
JOIN (SELECT ca.categoryID, count(*) AS counter FROM Student_Grades sg
  LEFT JOIN Assignments a ON sg.assignmentID = a.assignmentID
  JOIN  Categories ca ON ca.categoryID = a.categoryID
  WHERE courseID=3 and studentID = 1 GROUP BY ca.categoryID)
  total ON total.categoryID = ca.categoryID
JOIN (SELECT ca.categoryID, MIN(sg.points/a.pointsPossible) as grade from Student_Grades sg
  LEFT JOIN Assignments a ON sg.assignmentID = a.assignmentID
  JOIN Categories ca ON ca.categoryID = a.categoryID
  WHERE courseID=3 and studentID=1 GROUP BY ca.categoryID)
  lowest ON lowest.categoryID = ca.CategoryID
WHERE courseID=3
AND studentID=1;
