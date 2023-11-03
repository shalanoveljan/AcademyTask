Create Database Academy

Use Academy

Create Table Groups
(
Id int identity primary key,
Name nvarchar(100) Unique

)

Create Table Students
(
Id int identity primary key,
Name nvarchar(100),
SurName nvarchar(100),
GroupId int Foreign Key References Groups(Id)
)

Alter Table Students 
Add Grade int ;

Insert into Groups 
Values
('P236'),
('P235')


Insert Into Students
Values
('Elcan','Salanov',1,70),
('Zehra','Rzazade',1,80),
('Nicat','Ezizov',1,75),
('Hemid','Memmedov',2,85),
('Faiq','Rustemli',2,90)

Select * From Students s
Join Groups g
ON s.GroupId=g.Id
where s.GroupId=1

Select g.Name 'Group Name' ,Count(*) 'StudentCount in Group' From Students s 
Join Groups g
On s.GroupId=g.Id
Group By g.Name

Create View usv_StudentsInfo
As
Select s.Name 'Student Name',g.Name 'Group Name',s.SurName,s.Grade From Students s
Join Groups g 
On s.GroupId=g.Id

Create Procedure usp_Students 
@grade int
As
Begin

Select * From usv_StudentsInfo where Grade>@grade

End

exec usp_Students 82


Create Function usf_Students
@group nvarchar(100)
returns int
As

Begin

declare @stuCount=Count()
Select * From (
Select Count(*) 'StudentCount in Group' From Students s 
Join Groups g
On s.GroupId=g.Id
Group By g.id
) newSelect 

return stuCount


End



