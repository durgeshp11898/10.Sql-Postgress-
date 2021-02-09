		NAME:PAWAR DURGESH KARBHARI
			fy34227
		ASS:5

1:
testfy34227=> create table owner1(o_name varchar(20) primary 
key,address varchar(30),phone text);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "owner1_pkey" for table "owner1"

CREATE TABLE
testfy34227=> \d owner1;
            Table "public.owner1"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 o_name  | character varying(20) | not null
 address | character varying(30) | 
 phone   | text                  | 
Indexes:
    "owner1_pkey" PRIMARY KEY, btree (o_name)

testfy34227=> create table property1(p_number int primary key,description varchar(20),area text,o_name varchar(20)references owner1(o_name)on delete cascade on update cascade);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "property1_pkey" for table "property1"

CREATE TABLE
testfy34227=> \d property1;
            Table "public.property1"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 p_number    | integer               | not null
 description | character varying(20) | 
 area        | text                  | 
 o_name      | character varying(20) | 
Indexes:
    "property1_pkey" PRIMARY KEY, btree (p_number)
Foreign-key constraints:
    "property1_o_name_fkey" FOREIGN KEY (o_name) REFERENCES owner1(o_name) ON UPDATE CASCADE ON DELETE CASCADE


testfy34227=> select * from owner1;
  o_name  | address |   phone    
----------+---------+------------
 mr.nene  | pune-3  | 9860854876
 mr.joshi | pune-4  | 9075727991
(2 rows)
 
testfy34227=> select * from property1;
 p_number | description |   area    |  o_name  
----------+-------------+-----------+----------
       11 | on farming  | pune-1231 | mr.joshi
       12 | on job      | pune-1231 | mr.joshi
       13 | on job      | pune-1231 | mr.nene
       14 | on farmimng | pune-1231 | mr.nene
(4 rows)

testfy34227=> update owner1 set phone=9890278008 where o_name='mr.nene';
UPDATE 1

testfy34227=> select * from owner1;
  o_name  | address |   phone    
----------+---------+------------
 mr.joshi | pune-4  | 9075727991
 mr.nene  | pune-3  | 9890278008
(2 rows)

testfy34227=> delete from property1 where area='pune-1231'and o_name='mr.joshi';

DELETE 2
testfy34227=> select * from owner1;\
  o_name  | address |   phone    
----------+---------+------------
 mr.joshi | pune-4  | 9075727991
 mr.nene  | pune-3  | 9890278008
(2 rows)

2:

testfy34227=> create table owner1(o_name varchar(20) primary 
key,address varchar(30),phone text);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "owner1_pkey" for table "owner1"

CREATE TABLE
testfy34227=> \d owner1;
            Table "public.owner1"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 o_name  | character varying(20) | not null
 address | character varying(30) | 
 phone   | text                  | 
Indexes:
    "owner1_pkey" PRIMARY KEY, btree (o_name)

testfy34227=> create table property1(p_number int primary key,description varchar(20),area text,o_name varchar(20)references owner1(o_name)on delete cascade on update cascade);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "property1_pkey" for table "property1"

CREATE TABLE
testfy34227=> \d property1;
            Table "public.property1"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 p_number    | integer               | not null
 description | character varying(20) | 
 area        | text                  | 
 o_name      | character varying(20) | 
Indexes:
    "property1_pkey" PRIMARY KEY, btree (p_number)
Foreign-key constraints:
    "property1_o_name_fkey" FOREIGN KEY (o_name) REFERENCES owner1(o_name) ON UPDATE CASCADE ON DELETE CASCADE


testfy34227=> select * from owner1;
  o_name  | address |   phone    
----------+---------+------------
 mr.nene  | pune-3  | 9860854876
 mr.joshi | pune-4  | 9075727991
(2 rows)
 
testfy34227=> select * from property1;
 p_number | description |   area    |  o_name  
----------+-------------+-----------+----------
       11 | on farming  | pune-1231 | mr.joshi
       12 | on job      | pune-1231 | mr.joshi
       13 | on job      | pune-1231 | mr.nene
       14 | on farmimng | pune-1231 | mr.nene
(4 rows)

testfy34227=> update owner1 set phone=9890278008 where o_name='mr.nene';
UPDATE 1

testfy34227=> select * from owner1;
  o_name  | address |   phone    
----------+---------+------------
 mr.joshi | pune-4  | 9075727991
 mr.nene  | pune-3  | 9890278008
(2 rows)

testfy34227=> delete from property1 where area='pune-1231'and o_name='mr.joshi';

DELETE 2
testfy34227=> select * from owner1;\
  o_name  | address |   phone    
----------+---------+------------
 mr.joshi | pune-4  | 9075727991
 mr.nene  | pune-3  | 9890278008
(2 rows)

3:
testfy34227=> create table client(c_no int primary key,c_name varchar(20),c_address varchar(20));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "client_pkey" for table "client"
CREATE TABLE
testfy34227=> \d client;
             Table "public.client"
  Column   |         Type          | Modifiers 
-----------+-----------------------+-----------
 c_no      | integer               | not null
 c_name    | character varying(20) | 
 c_address | character varying(20) | 
Indexes:
    "client_pkey" PRIMARY KEY, btree (c_no)


testfy34227=> select * from client;
 c_no | c_name | c_address 
------+--------+-----------
   11 | raju   | pune
   12 | pavan  | solapur
(2 rows)

testfy34227=> create table sales(s_no int primary key,s_o_date date,c_no int references client(c_no));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "sales_pkey" for table "sales"
CREATE TABLE
testfy34227=> \d sales;
      Table "public.sales"
  Column  |  Type   | Modifiers 
----------+---------+-----------
 s_no     | integer | not null
 s_o_date | date    | 
 c_no     | integer | 
Indexes:
    "sales_pkey" PRIMARY KEY, btree (s_no)
Foreign-key constraints:
    "sales_c_no_fkey" FOREIGN KEY (c_no) REFERENCES client(c_no)

testfy34227=> select * from sales values;
 s_no |  s_o_date  | c_no 
------+------------+------
    1 | 1998-12-08 |   11
    2 | 1998-11-08 |   11
    3 | 1998-10-08 |   11
    4 | 1998-09-08 |   12
    5 | 1998-08-08 |   12
    6 | 1998-07-08 |   12
(6 rows)

testfy34227=> update sales set s_o_date='1998-10-08' where c_no='11';
UPDATE 3
testfy34227=> select * from sales;
 s_no |  s_o_date  | c_no 
------+------------+------
    4 | 1998-09-08 |   12
    5 | 1998-08-08 |   12
    6 | 1998-07-08 |   12
    1 | 1998-10-08 |   11
    2 | 1998-10-08 |   11
    3 | 1998-10-08 |   11
(6 rows)

testfy34227=> delete from sales where s_o_date>'1998-10-07';
DELETE 3
testfy34227=> select * from sales;
 s_no |  s_o_date  | c_no 
------+------------+------
    4 | 1998-09-08 |   12
    5 | 1998-08-08 |   12
    6 | 1998-07-08 |   12
(3 rows)

testfy34227=> delete from sales where c_no='12';
DELETE 3
testfy34227=> select * from sales;
 s_no | s_o_date | c_no 
------+----------+------
(0 rows)

testfy34227=> 

4:
testfy34227=> create table student1(stud_id int primary key,stud_name varchar(20),stud_add varchar(20),status varchar(20)check(status in('pass','fail')));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "student1_pkey" for table "student1"
CREATE TABLE

testfy34227=> \d student1;
            Table "public.student1"
  Column   |         Type          | Modifiers 
-----------+-----------------------+-----------
 stud_id   | integer               | not null
 stud_name | character varying(20) | 
 stud_add  | character varying(20) | 
 status    | character varying(20) | 
Indexes:
    "student1_pkey" PRIMARY KEY, btree (stud_id)
Check constraints:
    "student1_status_check" CHECK (status::text = 'pass'::text OR status::text = 'fail'::text)

testfy34227=> select * from student1 values;
 stud_id | stud_name | stud_add | status 
---------+-----------+----------+--------
       1 | ashwini   | deola    | pass
       2 | prashant  | satana   | fail
       3 | durgesh   | bhaur    | pass
       4 | mayur     | bhavde   | fail
       5 | vaishnvi  | deola    | pass
(5 rows)

testfy34227=> create table teacher1(tech_id int primary key,t_name varchar(20),t_add varchar(20));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "teacher1_pkey" for table "teacher1"
CREATE TABLE

testfy34227=> \d teacher1;
           Table "public.teacher1"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 tech_id | integer               | not null
 t_name  | character varying(20) | 
 t_add   | character varying(20) | 
Indexes:
    "teacher1_pkey" PRIMARY KEY, btree (tech_id)


testfy34227=> select * from teacher1 values; tech_id |  t_name  |    t_add    
---------+----------+-------------
      11 | durgesh  | bhaur deola
      12 | ankita   | vigay nagar
      13 | karishma | matane
(3 rows)

testfy34227=> create table subject1(sub_id int primary key,sub_name varchar(20)not null,tech_id int,foreign key(tech_id)references teacher1(tech_id));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "subject1_pkey" for table "subject1"
CREATE TABLE

testfy34227=> \d subject1;
           Table "public.subject1"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 sub_id   | integer               | not null
 sub_name | character varying(20) | not null
 tech_id  | integer               | 
Indexes:
    "subject1_pkey" PRIMARY KEY, btree (sub_id)
Foreign-key constraints:
    "subject1_tech_id_fkey" FOREIGN KEY (tech_id) REFERENCES teacher1(tech_id)

testfy34227=> select * from subject1;
 sub_id |   sub_name   | tech_id 
--------+--------------+---------
     21 | c programing |      11
     22 | database     |      12
     23 | mathematics  |      13
(3 rows)

testfy34227=> create table stud_sub(stud_id int,foreign key(stud_id)references student1(stud_id),sub_id int,foreign key(sub_id)references subject1(sub_id),marks int,grade char);
CREATE TABLE

testfy34227=> \d stud_sub;
      Table "public.stud_sub"
 Column  |     Type     | Modifiers 
---------+--------------+-----------
 stud_id | integer      | 
 sub_id  | integer      | 
 marks   | integer      | 
 grade   | character(1) | 
Foreign-key constraints:
    "stud_sub_stud_id_fkey" FOREIGN KEY (stud_id) REFERENCES student1(stud_id)
    "stud_sub_sub_id_fkey" FOREIGN KEY (sub_id) REFERENCES subject1(sub_id)

testfy34227=> select * from stud_sub;
 stud_id | sub_id | marks | grade 
---------+--------+-------+-------
       1 |     21 |    70 | A
     
       3 |     23 |    60 | B
       4 |     22 |    40 | c
       5 |     21 |    74 | A
(5 rows)

1:
testfy34227=> update stud_sub set marks=75 where stud_id=1 and sub_id=21;
UPDATE 1
testfy34227=> select * from stud_sub;
 stud_id | sub_id | marks | grade 
---------+--------+-------+-------
       2 |     22 |    80 | A
       3 |     23 |    60 | B
       4 |     22 |    40 | c_
       5 |     21 |    75 | A
       1 |     21 |    75 | A
(5 rows)

2:
testfy34227=> update subject1 set sub_name='drowing' where sub_name='computer';
UPDATE 0
testfy34227=> update subject1 set sub_name='computer' where sub_name='drowing';
UPDATE 0

testfy34227=> select * from subject1;
 sub_id |   sub_name   | tech_id 
--------+--------------+---------
     21 | c programing |      11
     23 | mathematics  |      13
     22 | drwing       |      12
(3 rows)

3:
testfy34227=> delete from stud_sub where sub_id=22;
DELETE 2
testfy34227=> select * from stud_sub;
 stud_id | sub_id | marks | grade 
---------+--------+-------+-------
       3 |     23 |    60 | B
       5 |     21 |    75 | A
       1 |     21 |    75 | A
(3 rows)

4:
testfy34227=> delete from student1 where status='fail';
DELETE 2
testfy34227=> select * from student1;
 stud_id | stud_name | stud_add | status 
---------+-----------+----------+--------
       1 | ashwini   | deola    | pass
       3 | durgesh   | bhaur    | pass
       5 | vaishnvi  | deola    | pass
(3 rows)

testfy34227=> 
  2 |     22 |    80 | A
