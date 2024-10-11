
--1
select Teachers.Name_ + ' ' + Teachers.Surname as 'Teacher`s fullname', Groups.Name
from Teachers
CROSS JOIN
Groups
--2
select Faculties.Name
from Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id
where Departments.FacultyId = Faculties.Id and Departments.Financing > Faculties.Financing
--3
select Curators.Surname, Groups.Name + '' as 'Group Name'
from Curators
join GroupsCurators on GroupsCurators.CuratorId = Curators.Id
join Groups on GroupsCurators.GroupId = Groups.Id
--4
select Teachers.Name_ + ' ' + Teachers.Surname as 'Teacher`s fullname', Groups.Name + '' as 'Group Name'
from Teachers
join Lectures on Lectures.TeacherId = Teachers.Id
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on GroupsLectures.GroupId = Groups.Id
--5
select Teachers.Surname, Faculties.Name
from Teachers
join Lectures on Lectures.TeacherId = Teachers.Id
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on GroupsLectures.GroupId = Groups.Id
join Departments on Groups.DepartmentId = Departments.Id
join Faculties on Departments.FacultyId = Faculties.Id
--6
select Departments.Name + '' as 'Department name', Groups.Name + '' as 'Group name'
from Groups
join Departments on Groups.DepartmentId = Departments.Id
--7
select Subjects.Name 
from Subjects
join Lectures on Lectures.SubjectId = Subjects.Id
join Teachers on Lectures.TeacherId = Teachers.Id
where Teachers.Name_ = 'Samantha Adams'
--8
select Departments.Name
from Departments
join Groups on Groups.DepartmentId = Departments.Id
join GroupsLectures on GroupsLectures.GroupId = Groups.Id
join Lectures on Lectures.Id = GroupsLectures.LectureId
join Subjects on Subjects.Id = Lectures.SubjectId
where Subjects.Name = 'DataBase Theory'
--9
select Groups.Name from Groups
join Departments on Departments.Id = Groups.DepartmentId
join Faculties on Departments.FacultyId = Faculties.Id
where Faculties.Name = 'Computer Science'
--10
select Groups.Name, Faculties.Name from Groups
join Departments on Departments.Id = Groups.DepartmentId
join Faculties on Departments.FacultyId = Faculties.Id
where Groups.Year = 5
--11
select Teachers.Name_ + ' ' + Teachers.Surname as 'Fullname',
Subjects.Name as 'Subject name', 
Groups.Name as 'Group name'
from Teachers
join Lectures on Lectures.TeacherId = Teachers.Id
join Subjects on Subjects.Id = Lectures.SubjectId
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on Groups.Id = GroupsLectures.GroupId
where Lectures.LectureRoom = 'B103'

