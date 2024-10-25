--1
select l.Name 
from LectureRooms as l
join Schedules as s on s.LectureRoomId = l.Id
join Lectures as ll on ll.Id = s.LectureId
join Teachers as t on t.Id = ll.TeacherId
where t.Name_ = 'Edward Hopper'
--2
select a.Surname
from Assistants as a
join Teachers on Teachers.Id = a.TeacherId
join Lectures on Lectures.TeacherId = Teachers.Id
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on Groups.Id = GroupsLectures.GroupId
where Groups.Name = 'F505'
--3
select s.Name
from Subjects as s
join Lectures on Lectures.SubjectId = s.Id
join Teachers on Teachers.Id = Lectures.TeacherId
join GroupsLectures on GroupsLectures.LectureId = Lectures.Id
join Groups on Groups.Id = GroupsLectures.Id
where Groups.Year = 5 and Teachers.Name_ = 'Alex Carmack'
--4
select t.Surname
from Teachers as t
join Lectures on Lectures.TeacherId = t.Id
join Schedules on Schedules.LectureId = Lectures.Id
where Schedules.DayOfWeek != 1
--5
select lr.Name, lr.Building
from LectureRooms as lr
where not exists (
	select 1
	from Schedules as s
	where lr.Id = s.LectureRoomId
	and s.Week = 2 and s.DayOfWeek = 3 and s.Class = 3
)
--6
select t.Name_ + ' ' + t.Surname as [Full name]
from Teachers as t
join Deans as d on d.TeacherId = t.Id
join Faculties as f on f.DeanId = d.Id
join Departments as dd on f.Id = dd.FacultyId
where f.Name = 'Computer Science' and dd.Name != 'Software Development'
--7
select f.Building
from Faculties as f
union all
select dd.Building
from Departments as dd
union all
select lr.Building 
from LectureRooms as lr
--8
select d.Name + ' ' + d.Surname as [Full name] from Deans as d
union all
select h.Name + ' ' + h.Surname as [Full name] from Heads as h
union all
select t.Name_ + ' ' + t.Surname as [Full name] from Teachers as t
union all
select c.Name + ' ' + c.Surname + 'c' as [Full name] from Curators as c
union all
select a.Name + ' ' + a.Surname as [Full name] from Assistants as a
--9
select distinct s.DayOfWeek from Schedules as s
join LectureRooms as lr on lr.Id = s.LectureRoomId
where lr.Name = 'A311' or lr.Name = 'A104'
