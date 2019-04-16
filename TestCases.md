# Gradebook Testcases

## Professors
| ProfessorID | FirstName | LastName |
1 ,'Sam','Smith'
2, 'Erykah', 'Badu'
3,'Beyonce', 'Knowles'

## Assignments
| AssignmentID | CategoryID | PointsPossible |
1,1,100
2,1,100
3,1,100
4,1,50
5,2,100
6,2,50
7,2,50
8,3,75
9,4,75
10,4,100
11,4,75
12,4,100
13,4,50
14,2,75
15,1,200
16,4,100
17,2,100
18,3,100
19,4,50
20,1,50
21,1,100
22,2,100
23,1,50
24,2,50
25,3,75
26,4,100
27,1,75
28,1,100
29,2,75
30,4,100

## Departments
| Department | DepartmentID |
'History', 001
'Psychology', 002
'Music', 003

## Courses
| CourseID | DepartmentID | CourseNumber | CourseName | ProfessorID | Semester | Year |
1,001, 3,'Beyonce History',3,'Fall',2016
2, 003, 2, 'Intro to Music', 2, 'Spring', 2017
3,002,1,'Knowing Vibrations',1,'Fall',2019
4,001,4,'Destinys Story',3,'Spring', 2018

## Categories
| CategoryID | CourseID | CategoryName | Percent |
1,1,'Test',25
2,1,'Quiz',15
3,2,'Lab',10
4,3,'Written Assignments',50


## Enrollment
| StudentID | CourseID |
1,3
1,4
1,2
2,2
2,3
3,4
4,1
4,4
4,2
5,3

## Student_Grades
| StudentID | AssignmentID | Points |
1,9,75
1,10,100
1,11,74
1,12,99
1,21,100
1,22,95
1,23,49
1,24,49
1,25,75
1,26,100
1,27,73
1,28,100
1,29,75
1,30,100
2,8,65
2,9,65
2,10,76
2,11,38
2,12,20
3,18,86
3,19,48
3,20,32
3,23,35
3,24,35
3,25,60
3,26,60
3,27,50
3,28,80
3,29,50
4,1,82
4,2,78
4,3,85
4,4,42
4,5,78
4,6,41
4,7,40
4,13,40
4,14,60
4,15,164
4,16,80
4,17,74
4,18,86
4,19,48
4,20,32
4,30,88
5,1,100
5,2,80
5,3,83
5,4,0
5,5,0
5,6,50
5,7,40
5,8,50
5,16,57
5,18,58

# Students
| StudentID | FirstName | LastName |
1,'Ohalete','Brittany'
2,'Bria','Lee'
3, 'Valarie', 'Ogwo'
4,'Josh', 'Udeh'
5,'Duck','Worth'
