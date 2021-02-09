		NAME:DURGESH K.PAWAR
		FY34227
		
1)                                          ^
testfy34227=> create table player(player_id int primary key,name varchar(50),birth_date date,birth_place varchar(100));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "player_pkey" for table "player"
CREATE TABLE

2)
testfy34227=> create table student(roll_no int primary key,class varchar(20) unique,weight numeric(6,2),height numeric(6,2));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "student_pkey" for table "student"
NOTICE:  CREATE TABLE / UNIQUE will create implicit index "student_class_key" for table "student"
CREATE TABLE

3)
testfy34227=> create table project(project_id int primary key,project_name varchar(20),project_description text,status boolean);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "project_pkey" for table "project"
CREATE TABLE

4)
testfy34227=> create table donor(donor_no int primary key,donor_name varchar(20),blood_group char(5),last_date date);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "donor_pkey" for table "donor"
CREATE TABLE
testfy34227=> 

		SET:B
1)
testfy34227=> create table property(property_id int primary key,property_desc text,area varchar(20),rate float,agri_status boolean);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "property_pkey" for table "property"
CREATE TABLE

2)
testfy34227=> create table actor(actor_id int primary key,actor_name varchar(30),birth_date date);

3)                                           ^
testfy34227=> create table movie(movie_no int primary key,movie_name varchar(20),release_year char(15));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "movie_pkey" for table "movie"
CREATE TABLE

4)
testfy34227=> create table hospital(hno int primary key,hname char(30),hcity varchar(20));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "hospital_pkey" for table "hospital"
CREATE TABLE
testfy34227=> 

		SET:C
1)
testfy34227=> create table teacher(teacher_no int primary key,t_name varchar(20),qualification char(30),address varchar(40));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "teacher_pkey" for table "teacher"
CREATE TABLE

2)
testfy34227=> create table driver(driver_no int primary key,permit_no int unique,d_name varchar(20),address varchar(30));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "driver_pkey" for table "driver"
NOTICE:  CREATE TABLE / UNIQUE will create implicit index "driver_permit_no_key" for table "driver"
CREATE TABLE
testfy34227=> 

