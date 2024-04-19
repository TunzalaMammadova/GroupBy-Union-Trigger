use CourseP418 

select [FullName] from Teachers
union
select [FullName] from Students


select [FullName] from Teachers
union all
select [FullName] from Students


select [FullName] from Teachers
intersect
select [FullName] from Students


select [FullName] from Students
except
select [FullName] from Teachers


create table Doctors(
    [Id] int primary key identity,
    [Name] nvarchar(50),
    [Address] nvarchar(50)
)

insert into Doctors([Name],[Address])
values ('Semed Huseynov', 'Ehmedli'),
       ('Tunzale Memmedova', 'Nesimi'),
       ('Ilham Abasli','Lokbatan')


select * from Doctors


delete from Doctors


select count (*) as 'Count' ,Age
from Students
group by Age
order by Age Desc


declare @counter int 
set @counter=1
while (@counter<=10)
begin 
print 'the counter value is' + convert (nvarchar,@counter)
set @counter = @counter + 1
end 



select getdate()



create table StudentLogs(
    [Id] int primary key identity,
    [StudentId]int,
    [Operation] nvarchar(20),
    [Date] datetime
)


select * from StudentLogs


select * from Students



-- create trigger trg_writeLogAfterCerate on Students
-- after insert 
-- as 
-- begin 
-- insert into StudentLogs([StudentId],[Operation],[Date])
-- select [Id],'Insert', getdate() from inserted
-- end 


-- insert into Students([Fullname],[Age],[Address])
-- values ('Omer Elesgerli',16,'Khetai')



-- create trigger trg_writeLogAfterEdit on Students
-- after update 
-- as 
-- begin 
-- insert into StudentLogs([StudentId],[Operation],[Date])
-- select [Id],'Update', getdate() from deleted
-- end 



-- update  Students
-- set [address] = 'Ehmdeli'
-- where [Id]= 2



-- select * from StudentLogs where [Operation]= 'update'
-- order by [date] desc



create table EmployeeUpdateLogs(
    [Id] int primary key identity,
    [EmployeeName] nvarchar(100),
    [OldEmail] nvarchar (50),
    [NewEmail] nvarchar (50),
    [Operation] nvarchar(50),
    [Date] datetime
)



create trigger trg_writeLogAfterUpdateEmail on Employees
after update 
as 
begin 
declare @oldEmail nvarchar (200) = (select [Email] from deleted)
declare @fullName nvarchar (200) = (select [Name] from deleted)
declare @newEmail nvarchar (200) = (select [Email] from inserted)
insert into EmployeeUpdateLogs([EmployeeName],[OldEmail],[NewEmail],[Operation],[Date])
values (@fullName,@oldEmail,@newEmail,'Update', getdate())
end 


update Employees
set [Email] = 'salam@gmail.com'
where [Id]=2



select * from EmployeeUpdateLogs


select * from Employees


use CourseP418



