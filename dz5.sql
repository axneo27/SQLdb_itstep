use Academy
--1
select count(t.Id) as [Teachers]
from Teachers as t
join Lectures on Lectures.TeacherId = t.Id
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on Groups.Id = GroupsLectures.GroupId
join Departments on Departments.Id = Groups.DepartmentId
where Departments.Name = 'Software Development'
--2
select count(l.Id) as [Lectures]
from Lectures as l, Teachers as t
where l.TeacherId = t.Id and t.Name_ = 'Dave McQueen'
--3
select count(s.Id) as [Subjects]
from Subjects as s
join Lectures on Lectures.SubjectId = s.Id
where Lectures.LectureRoom = 'D201'
--4
select l.LectureRoom, count(l.Id) as [Lectures]
from Lectures as l
group by l.LectureRoom
--5
select count(distinct s.Id) as [Students]
from Students as s
join Groups on Groups.Id = s.GroupId
join GroupsLectures on GroupsLectures.GroupId = Groups.Id
join Lectures on Lectures.Id = GroupsLectures.LectureId
join Teachers on Teachers.Id = Lectures.TeacherId
where Teachers.Name_ = 'Jack Underhill'
--6
select avg(t.Salary) as 'Average salary'
from Teachers as t
join Lectures as l on l.TeacherId = t.Id
join GroupsLectures on GroupsLectures.LectureId = l.Id
join Groups on Groups.Id = GroupsLectures.GroupId
join Departments on Departments.Id = Groups.DepartmentId
join Faculties on Departments.FacultyId = Faculties.Id
where Faculties.Name = 'Computer Science'
--7
select min(gc.Students) as [Min], max(gc.Students) as [Max] 
from (
select count(s.Id) as [Students], g.Name as [Group name]
from Students as s, Groups as g
where g.Id = s.GroupId
group by g.Name) as gc
--8
select avg(d.Financing) as [Average]
from Departments as d
--9
select t.Name_ + ' ' + t.Surname as [Full name], 
count(distinct s.Id) as 'Subjects'
from Teachers as t
join Lectures as l on l.TeacherId = t.Id
join Subjects as s on s.Id = l.SubjectId
group by t.Name_, t.Surname
--10
select gl.DayOfWeek, count(l.Id) as [Lectures]
from Lectures as l, GroupsLectures as gl
where l.Id = gl.LectureId
group by gl.DayOfWeek
order by gl.DayOfWeek
--11
select l.LectureRoom, count(distinct d.Id) as [Departments]
from Lectures as l
join GroupsLectures as gl on gl.LectureId = l.Id
join Groups as g on g.Id = gl.GroupId
join Departments as d on d.Id = g.DepartmentId
group by l.LectureRoom
--12
select f.Name, count(distinct sub.Id) as [Subjects]
from Faculties as f
join Departments as d on d.FacultyId = f.Id
join Groups on Groups.DepartmentId = d.Id
join GroupsLectures on GroupsLectures.GroupId = Groups.Id
join Lectures on Lectures.Id = GroupsLectures.LectureId
join Subjects as sub on sub.Id = Lectures.SubjectId 
group by f.Name
--13
select count(l.Id) as [Lecture Count], 
t.Name_ + ' ' + l.LectureRoom as [Teacher - Lecture Room]
from Lectures AS l, Teachers as t
where l.TeacherId = t.Id
group by t.Name_, l.LectureRoom
