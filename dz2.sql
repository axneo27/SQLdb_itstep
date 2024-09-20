create database Academy;
use Academy;

create table Groups(
Id int primary key identity(1,1) not null, 
Name_ nvarchar(10) unique check(Name_ <> '') not null,
Rating int check(Rating>=0 and Rating<=5) not null,
Year_ int not null check(Year_>=1 and Year_<=5)
);
create table Departments(
Id int primary key identity(1,1) not null,
Financing money not null check(Financing >=0) default 0,
Name_ nvarchar(100) not null check(Name_ <> '') unique
);
create table Faculties(
Id int primary key identity(1,1) not null,
Name_ nvarchar(100) not null check(Name_ <> '') unique
);
create table Teachers(
Id int primary key identity(1,1) not null,
EmploymentDate date not null check(EmploymentDate >= '1990-01-01'),
Name_ nvarchar(max) not null check(Name_ <> ''),
Premium money not null check(Premium >=0) default 0,
Salary money not null check(Salary > 0),
Surname nvarchar(max) not null check(Surname <> '')
);
