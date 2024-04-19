create database Course;

use Course;

create table Countries
(
    [Id] int primary key identity(1,1),
    [Name] nvarchar (50)
)

insert into Countries ([Name])
values
    ('Azerbaycan'),
    ('Turkiye'),
    ('Italya'),
    ('Almanya'),
    ('Fransa')


select * from Countries


create table Cities
(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [CountryId] int ,
    foreign key (CountryId) references Countries(Id)
)

insert into Cities ([Name],[CountryId])
values
    ('Baku', 1),
    ('Terter', 1),
    ('Ankara', 2),
    ('Frankfurt', 4),
    ('Berlin', 3),
    ('Roma', 3),
    ('Paris', 3)


select * from Cities


create table Students
(
    [Id] int primary key identity(1,1),
    [FullName] nvarchar(50),
    [Age] int,
    [Email] nvarchar (50),
    [CityId] int ,
    foreign key (CityId) references Cities(Id)
)

insert into Students ([FullName],[Age],[Email],[CityId])
values
    ('Semed Huseynov', 27, 'semed@gmail.com', 2),
    ('Tunzale Memmedova', 25, 'tuni@gmail.com', 2),
    ('Ilham  Abasli', 20, 'ilham@gmail.com', 4),
    ('Nise Nerimanova', 26, 'nise@gmail.com', 2),
    ('Aqshin Veliyev', 27, 'aqshin@gmail.com', 6),
    ('Arzu Kerimli', 27, 'arzu@gmail.com', 5),
    ('Oruc Mehrabov', 26, 'oruc@gmail.com', 1),
    ('Omer Eleskerli', 16, 'omer@gmail.com', 4),
    ('Meryem Aliyeva', 24, 'meryem@gmail.com', 5),
    ('Elnur Seferli', 19, 'elnur@gmail.com', 1)


select * from Students


create table Teachers
(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Salary] float,
    [CityId] int ,
    foreign key (CityId) references Cities(Id)
)

insert into Teachers ([Name],[Salary],[CityId])
values
    ('Cavid Bashirov', 3500, 3),
    ('Suleyman Dadashov', 3500, 1),
    ('Ali Aliyev', 2300, 4),
    ('Memmed Memmedli', 2000, 5),
    ('Aide Aslanova', 2500, 6)


select * from Teachers


create table Rooms
(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Capacity] int,
)

insert into Rooms ([Name],[Capacity])
values
    ('Sirius',18),
    ('Jupiter',20),
    ('Saturn',13),
    ('Pluton',15),
    ('TeacherRoom', 30)



select * from Rooms


create table Groups
(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [RoomId] int ,
    foreign key (RoomId) references Rooms(Id)
)

insert into Groups ([Name],[RoomId])
values
    ('P418',1),
    ('P419',2),
    ('P139',3),
    ('P146',2),
    ('K456',1),
    ('K345',4)
    

select * from Groups


create table TeachersGroups
(
    [Id] int primary key identity (1,1),
    [TeacherId] int ,
    [GroupId] int ,
    foreign key (TeacherId) references Teachers(id),
    foreign key (GroupId) references Groups(id)
)

insert into TeachersGroups ([TeacherId],[GroupId])
values
    (1,1),
    (2,5),
    (3,2),
    (5,3),
    (4,7),
    (3,4),
    (2,6)
   

select * from TeachersGroups


create table StudentsGroups
(
    [Id] int primary key identity (1,1),
    [StudentId] int ,
    [GroupId] int ,
    foreign key (StudentId) references Students(id),
    foreign key (GroupId) references Groups(id)
)

select * from StudentsGroups


create table StaffMembers
(
    [Id] int primary key identity(1,1),
    [FullName] nvarchar(50),
    [Age] int,
    [Address] nvarchar (50),
    [Salary] float,
    [CityId] int ,
    [RoomId] int ,
    foreign key (CityId) references Cities(Id),
    foreign key (RoomId) references Rooms(Id)
)

select * from StaffMembers

create table Roles
(
    [Id] int primary key identity(1,1),
    [Specialist] nvarchar(50),
    [StaffMembersId] int ,
    foreign key (StaffMembersId) references StaffMembers(Id)
)


select * from Roles





