use Academy

--1
select Name_, Financing, Id 
from Departments
order by Id desc
--2
select Name_ as 'Group Name', Rating as 'Group Rating'
from Groups
--3
select Surname, (Salary/Premium)*100 as 'Salary/Premium', 
(Salary/(Premium+Salary))*100 as 'Salary/Prem+Sal'
from Teachers
--4
SELECT 'The dean of faculty ' + Name_ + ' is ' + Dean AS Result
FROM Faculties
--5
select Surname
from Teachers
where isProfessor = 1 and Salary > 1050
--6
select Name_ 
from Departments
where Financing < 11000 or Financing > 25000
--7
select Name_ 
from Faculties
where Name_ <> 'Computer Science'
--8
select Surname, Position
from Teachers
where isProfessor = 0
--9
select Surname, Position, Salary, Premium
from Teachers
where isAssistant = 1 and Premium between 160 and 550
--10
select Surname, Salary
from Teachers
where isAssistant = 1
--11
select Surname, Position
from Teachers
where EmploymentDate < '2000-01-01'
--12
select Name_
from Departments
where Name_ < 'Software Develompent'
order by Name_
--13
select Surname
from Teachers
where isAssistant = 1 and (Salary+Premium) <=1200
--14
select Name_
from Groups
where Year_ = 5 and Rating between 2 and 4
--15
select Surname
from Teachers
where isAssistant = 1 and (Salary<550 or Premium < 200)
