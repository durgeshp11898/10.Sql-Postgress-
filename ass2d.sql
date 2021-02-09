		
		NAME:DURGESH K.PAWAR
		FY34227
	
		set:a
1:
create table dept(dno int primary key,dname varchar(20),loc varchar(30));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "dept_pkey" for table "dept"
CREATE TABLE

testfy34227=> \d dept;
            Table "public.dept"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 dno    | integer               | not null
 dname  | character varying(20) | 
 loc    | character varying(30) | 
Indexes:
    "dept_pkey" PRIMARY KEY, btree (dno)



create table emp(eno int primary key,ename varchar(20),designation varchar(20),salary float,dno int references dept(dno)on delete cascade on update cascade);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "emp_pkey" for table "emp"
CREATE TABLE


 select * from dept;
 dno |      dname       |     loc      
-----+------------------+--------------
   1 | computer science | first floor
   2 | electronic       | second floor
   3 | math             | third floor
   4 | stast            | fourth floor
(4 rows)


testfy34227=> \d emp;
               Table "public.emp"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 eno         | integer               | not null
 ename       | character varying(20) | 
 designation | character varying(20) | 
 salary      | double precision      | 
 dno         | integer               | 
Indexes:
    "emp_pkey" PRIMARY KEY, btree (eno)
Foreign-key constraints:
    "emp_dno_fkey" FOREIGN KEY (dno) REFERENCES dept(dno) ON UPDATE CASCADE ON DELETE CASCADE


 select * from  emp;
 eno | ename | designation | salary | dno 
-----+-------+-------------+--------+-----
(0 rows)

 select * from emp;
 eno |  ename  | designation | salary | dno 
-----+---------+-------------+--------+-----
   1 | durgesh | fybsc       |  30000 |   2
   2 | pavan   |             |  35000 |   1
   3 | raju    | sybsc       |  34000 |   3
   4 | tejas   | tybsc       |  33000 |   4
   5 | mauli   | bsc         |  32000 |   2
   6 | ajinkya | ba          |  32000 |   1
   7 | rohit   | bcom        |  32000 |   3
   8 | divya   | be          |  31000 |   1
(8 rows)


2:

 create table hospital(hno int primary key,name varchar(30),city varchar(30));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "hospital_pkey" for table "hospital"
CREATE TABLE

testfy34227=> \d hospital;
          Table "public.hospital"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 hno    | integer               | not null
 name   | character varying(30) | 
 city   | character varying(30) | 
Indexes:
    "hospital_pkey" PRIMARY KEY, btree (hno)


 select * from hospital;
 hno |        name        |       city        
-----+--------------------+-------------------
   1 | sancheti           | shivajinagar pune
   2 | puna hospitol      | deccan pune
   3 | rubi hall hospitol | ramvadi pune
   4 | sayadri hospitol   | kothrud pune
(4 rows)


 create table doctor(dno int primary key,dname varchar(20),city varchar(30));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "doctor_pkey" for table "doctor"
CREATE TABLE

testfy34227=> \d doctor;
           Table "public.doctor"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 dno    | integer               | not null
 dname  | character varying(20) | 
 city   | character varying(30) | 
Indexes:
    "doctor_pkey" PRIMARY KEY, btree (dno)


 select * from doctor;
 dno |  dname  |  city   
-----+---------+---------
   1 | durgesh | nashik
   2 | pavan   | solapur
   3 | shubham | a.nagar
   4 | datta   | solapur
(4 rows)


create table hos_doc(hno int,foreign key(hno)references hospital(hno),dno int,foreign key(dno)references doctor(dno));
CREATE TABLE

testfy34227=> \d hos_doc;
    Table "public.hos_doc"
 Column |  Type   | Modifiers 
--------+---------+-----------
 hno    | integer | 
 dno    | integer | 
Foreign-key constraints:
    "hos_doc_dno_fkey" FOREIGN KEY (dno) REFERENCES doctor(dno)
    "hos_doc_hno_fkey" FOREIGN KEY (hno) REFERENCES hospital(hno)


 select * from hos_doc;
 hno | dno 
-----+-----
   1 |   1
   1 |   2
   1 |   4
   2 |   3
   2 |   2
   3 |   2
   3 |   4
   3 |   3
   4 |   3
   4 |   4
   4 |   1
(11 rows)


3:
testfy34227=> create table bed(bed_no int primary key,roomno int,description varchar(30));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "bed_pkey" for table "bed"
CREATE TABLE

\d bed;
               Table "public.bed"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 bed_no      | integer               | not null
 roomno      | integer               | 
 description | character varying(30) | 
Indexes:
    "bed_pkey" PRIMARY KEY, btree (bed_no)


testfy34227=> select *from bed;
 bed_no | roomno | description 
--------+--------+-------------
      1 |     11 | water bed
      2 |     12 | cotton bed
      3 |     13 | air bed
      4 |     14 | strech bed
(4 rows)


testfy34227=> create table patient(p_no int primary key,name varchar(20),address text,bed_no int references bed unique);
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "patient_pkey" for table "patient"
NOTICE:  CREATE TABLE / UNIQUE will create implicit index "patient_bed_no_key" for table "patient"
CREATE TABLE

testfy34227=> \d patient;
           Table "public.patient"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 p_no    | integer               | not null
 name    | character varying(20) | 
 address | text                  | 
 bed_no  | integer               | 
Indexes:
    "patient_pkey" PRIMARY KEY, btree (p_no)
    "patient_bed_no_key" UNIQUE, btree (bed_no)
Foreign-key constraints:
    "patient_bed_no_fkey" FOREIGN KEY (bed_no) REFERENCES bed(bed_no)


testfy34227=> select * from patient;
 p_no |      name      |     address     | bed_no 
------+----------------+-----------------+--------
   21 | Rohit mane     | karvenagar_pune |      3
   22 |  mauli pujari  | warje_pune      |      1
   23 |  tejas smart   | kothrud_pune    |      4
   24 |  pavan supekar | katraj_pune     |      2
(4 rows)

		
		set:b

testfy34227=> create table district(d_code int primary key,d_name varchar(20),tax_rate float);
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "district_pkey" for table "district"
CREATE TABLE
 
testfy34227=> \d district;
           Table "public.district"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 d_code   | integer               | not null
 d_name   | character varying(20) | 
 tax_rate | double precision      | 
Indexes:
    "district_pkey" PRIMARY KEY, btree (d_code)


testfy34227=> select * from district;
 d_code |  d_name   | tax_rate 
--------+-----------+----------
      1 | Nashik    |     3000
      2 | pune      |     4000
      3 | nandurbar |     5000
      4 | dhule     |     6000
(4 rows)



testfy34227=> create table owner(o_name varchar(20)primary key,address varchar(20),phone int);
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "owner_pkey" for table "owner"
CREATE TABLE

testfy34227=> \d owner;
            Table "public.owner"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 o_name  | character varying(20) | not null
 address | character varying(20) | 
 phone   | integer               | 
Indexes:
    "owner_pkey" PRIMARY KEY, btree (o_name)


INSERT 0 1
testfy34227=> select * from owner;
 o_name  |     address     | phone  
---------+-----------------+--------
 Durgesh | deola nashik    | 282206
 vikas   | satana nashik   | 282206
 satish  | kalwan nashik   | 282207
 milind  | malegaon nashik | 282208
(4 rows)

testfy34227=> create table property(p_number int primary key,description varchar(20),area text,o_name varchar(20) references owner(o_name) on delete cascade on update cascade,d_code int references district(d_code) on delete cascade on update cascade);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "property_pkey" for table "property"
CREATE TABLE

        
testfy34227=> \d property;
             Table "public.property"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 p_number    | integer               | not null
 description | character varying(20) | 
 area        | text                  | 
 o_name      | character varying(20) | 
 d_code      | integer               | 
Indexes:
    "property_pkey" PRIMARY KEY, btree (p_number)
Foreign-key constraints:
    "property_d_code_fkey" FOREIGN KEY (d_code) REFERENCES district(d_code) ON UPDATE CASCADE ON DELETE CASCADE
    "property_o_name_fkey" FOREIGN KEY (o_name) REFERENCES "owner"(o_name) ON UPDATE CASCADE ON DELETE CASCADE


 select * from doctor;
 dno |  dname  |  city   
-----+---------+---------
   1 | durgesh | nashik
   2 | pavan   | solapur
   3 | shubham | a.nagar
   4 | datta   | solapur
(4 rows)

testfy34227=> select * from property;
 p_number | description |  area   | o_name | d_code 
----------+-------------+---------+--------+--------
        1 | on job      | 1234567 | vikas  |      3
        2 | on farming  | 12567   | satish |      3
        3 | on job      | 4567    | milind |      4
(3 rows)

testfy34227=> insert into property values(4,'on job','4567','vikas','4');
INSERT 0 1
testfy34227=> select * from property;
 p_number | description |  area   | o_name | d_code 
----------+-------------+---------+--------+--------
        1 | on job      | 1234567 | vikas  |      3
        2 | on farming  | 12567   | satish |      3
        3 | on job      | 4567    | milind |      4
        4 | on job      | 4567    | vikas  |      4
(4 rows)
 

2:
testfy34227=> create table employee(emp_no int primary key,name varchar(20),address text,city varchar(20),dept_name varchar(20)); 

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "employee_pkey" for table "employee"
CREATE TABLE

testfy34227=> \d employee;
            Table "public.employee"
  Column   |         Type          | Modifiers 
-----------+-----------------------+-----------
 emp_no    | integer               | not null
 name      | character varying(20) | 
 address   | text                  | 
 city      | character varying(20) | 
 dept_name | character varying(20) | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (emp_no)




testfy34227=> select * from employee;
 emp_no |   name   |                address                 |   city   |  dept_name  
--------+----------+----------------------------------------+----------+-------------
     11 | durgesh  | a/p bhaur.tal-deola,dist-naashik       | deola    | computer
     12 | vikas    | a/p tahrabadh.tal-satana,dist-naashik  | satana   | mathematics
     13 | prashant | a/p saundane.tal-malegaon,dist-naashik | malegaon | statistics
     14 | satish   | a/p niwane.tal-kalawan,dist-naashik    | kalwan   | mechanical
     15 | ashish   | a/p vigaynagar.tal-deola,dist-naashik  | kalwan   | mechanical
(5 rows)

testfy34227=> create table project(p_no int primary key,p_name varchar(20),status varchar(20));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "project_pkey" for table "project"
CREATE TABLE
testfy34227=> \d project;
           Table "public.project"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 p_no   | integer               | not null
 p_name | character varying(20) | 
 status | character varying(20) | 
Indexes:
    "project_pkey" PRIMARY KEY, btree (p_no)
                                                          ^


testfy34227=> select * from project;
 p_no |     p_name     |   status   
------+----------------+------------
    1 | on computer    | complite
    2 | on mathematics | incomplite
    3 | on statstic    | incomplite
    4 | on mechnical   | complite
    5 | on mechnical   | complite
(5 rows)

testfy34227=> create table emp_pro(emp_no int,foreign key(emp_no)references employee(emp_no),p_no int,foreign key(p_no)references project(p_no),no_of_days_emp_worked_on_project int);
CREATE TABLE

testfy34227=> \d emp_pro;
                 Table "public.emp_pro"
              Column              |  Type   | Modifiers 
----------------------------------+---------+-----------
 emp_no                           | integer | 
 p_no                             | integer | 
 no_of_days_emp_worked_on_project | integer | 
Foreign-key constraints:
    "emp_pro_emp_no_fkey" FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
    "emp_pro_p_no_fkey" FOREIGN KEY (p_no) REFERENCES project(p_no)




testfy34227=> select * from emp_pro;
 emp_no | p_no | no_of_days_emp_worked_on_project 
--------+------+----------------------------------
     11 |    1 |                               22
     14 |    1 |                               20
     13 |    1 |                               30
     12 |    2 |                               15
     15 |    2 |                               12
     11 |    3 |                               24
     14 |    3 |                               40
     12 |    4 |                               50
     14 |    4 |                               10
     13 |    5 |                               33
     14 |    5 |                               33
(11 rows)

testfy34227=> 


3:
testfy34227=> create table book(book_no int primary key,name varchar(20),pub_name varchar(20));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "book_pkey" for table "book"
CREATE TABLE

testfy34227=> \d book;
             Table "public.book"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 book_no  | integer               | not null
 name     | character varying(20) | 
 pub_name | character varying(20) | 
Indexes:
    "book_pkey" PRIMARY KEY, btree (book_no)



testfy34227=> select * from book;
 book_no |     name      | pub_name 
---------+---------------+----------
       1 | wings of fire | durgesh
       2 | way of sucess | pramod
       3 | how to sucess | raohit
       4 | airspace      | raina
(4 rows)

testfy34227=> create table auther(auther_no int primary key,auther_name varchar(20));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "auther_pkey" for table "auther"
CREATE TABLE

testfy34227=> \d auther;
              Table "public.auther"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 auther_no   | integer               | not null
 auther_name | character varying(20) | 
Indexes:
    "auther_pkey" PRIMARY KEY, btree (auther_no)
                             ^


testfy34227=> select * from auther;
 auther_no | auther_name 
-----------+-------------
        11 | darshna
        12 | mansi
        13 | ashwini
        14 | ankita
(4 rows)

testfy34227=> create table book_auther(book_no int,foreign key(book_no)references book(book_no),auther_no int,foreign key(auther_no)references auther(auther_no),date_of_publication date);
CREATE TABLE

testfy34227=> \d book_auther;
        Table "public.book_auther"
       Column        |  Type   | Modifiers 
---------------------+---------+-----------
 book_no             | integer | 
 auther_no           | integer | 
 date_of_publication | date    | 
Foreign-key constraints:
    "book_auther_auther_no_fkey" FOREIGN KEY (auther_no) REFERENCES auther(auther_no)
    "book_auther_book_no_fkey" FOREIGN KEY (book_no) REFERENCES book(book_no)


testfy34227=> select * from book_auther;
 book_no | auther_no | date_of_publication 
---------+-----------+---------------------
       1 |        14 | 2016-12-11
       1 |        14 | 2016-02-10
       1 |        13 | 2016-02-10
       3 |        13 | 2016-02-10
       4 |        12 | 2016-03-10
       2 |        12 | 2016-04-10
(6 rows)




		set:c
testfy34227=> create table route(route_no int primary key,source varchar(20),destination varchar(20),no_of_stations int);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "route_pkey" for table "route"
CREATE TABLE

testfy34227=> \d route;
                Table "public.route"
     Column     |         Type          | Modifiers 
----------------+-----------------------+-----------
 route_no       | integer               | not null
 source         | character varying(20) | 
 destination    | character varying(20) | 
 no_of_stations | integer               | 
Indexes:
    "route_pkey" PRIMARY KEY, btree (route_no)


testfy34227=> select * from route;
 route_no |   source   | destination  | no_of_stations 
----------+------------+--------------+----------------
      102 | kothrud to | vishrantwadi |             33
      222 | satana     | pune         |             40
      224 | nandurbar  | pune         |             48
      223 | navapur    | pune         |             44
      225 | sakri      | pune         |             30
(5 rows)

testfy34227=> create table bus(bus_no int primary key,capacity int not null,depot_name varchar(20),route_no int,foreign key(route_no)references route(route_no));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "bus_pkey" for table "bus"
CREATE TABLE

testfy34227=> \d bus;
               Table "public.bus"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 bus_no     | integer               | not null
 capacity   | integer               | not null
 depot_name | character varying(20) | 
 route_no   | integer               | 

Indexes:
    "bus_pkey" PRIMARY KEY, btree (bus_no)
Foreign-key constraints:
    "bus_route_no_fkey" FOREIGN KEY (route_no) REFERENCES route(route_no)

testfy34227=> select * from bus;
 bus_no | capacity | depot_name | route_no 
--------+----------+------------+----------
(0 rows)



testfy34227=> select * from bus;
 bus_no | capacity | depot_name | route_no 
--------+----------+------------+----------
   2014 |       20 | kothrud    |      102
   1111 |       50 | satana     |      222
   2222 |       46 | nandurbar  |      224
   3333 |       48 | navapur    |      223
   4444 |       46 | sakri      |      225
(5 rows)

testfy34227=> create table driver(driver_no int primary key,driver_name varchar(20),licence_no int unique,address varchar(20),age int,salary float);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "driver_pkey" for table "driver"
NOTICE:  CREATE TABLE / UNIQUE will create implicit index "driver_licence_no_key" for table "driver"
CREATE TABLE

testfy34227=> \d driver;
              Table "public.driver"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 driver_no   | integer               | not null
 driver_name | character varying(20) | 
 licence_no  | integer               | 
 address     | character varying(20) | 
 age         | integer               | 
 salary      | double precision      | 

Indexes:
    "driver_pkey" PRIMARY KEY, btree (driver_no)
    "driver_licence_no_key" UNIQUE, btree (licence_no)


testfy34227=> insert into driver values(22,'durgesh','123321','a/p.satana-nashik','20','30000');
INSERT 0 1

testfy34227=> select * from driver;
 driver_no | driver_name | licence_no |      address      | age | salary 
-----------+-------------+------------+-------------------+-----+--------
        22 | durgesh     |     123321 | a/p.satana-nashik |  20 |  30000
(1 row)

testfy34227=> select * from driver;
 driver_no | driver_name | licence_no |      address      | age | salary 
-----------+-------------+------------+-------------------+-----+--------
        22 | durgesh     |     123321 | a/p.satana-nashik |  20 |  30000
        24 | milind      |    1233245 | a/p.nandurbar     |  30 |  25000
        26 | dinesh      |     123324 | a/p.sakri         |  40 |  26000
        28 | dipak       |       1233 | a/p.navapur       |  35 |  27000
        30 | nivrutti    |    1234567 | a/p.satana        |  32 |  33300
(5 rows)

                                  
testfy34227=> create table bus_driver(bus_no int,foreign key(bus_no)references bus(bus_no),driver_no int,foreign key(driver_no)references driver(driver_no),date_of_duty date,shift int check(shift int('0','1')));
CREATE TABLE

testfy34227d bus_driver;
     Table "pu=> \blic.bus_driver"
    Column    |  Type   | Modifiers 
--------------+---------+-----------
 bus_no       | integer | 
 driver_no    | integer | 
 date_of_duty | date    | 
 shift        | integer | 
Check constraints:
    "bus_driver_shift_check" CHECK (shift = 0 OR shift = 1)
Foreign-key constraints:
    "bus_driver_bus_no_fkey" FOREIGN KEY (bus_no) REFERENCES bus(bus_no)
    "bus_driver_driver_no_fkey" FOREIGN KEY (driver_no) REFERENCES driver(driver_no)





 \d bus_driver 
     Table "public.bus_driver"
    Column    |  Type   | Modifiers 
--------------+---------+-----------
 bus_no       | integer | 
 driver_no    | integer | 
 date_of_duty | date    | 
 shift        | integer | 
Check constraints:
    "bus_driver_shift_check" CHECK (shift = 0 OR shift = 1)
Foreign-key constraints:
    "bus_driver_bus_no_fkey" FOREIGN KEY (bus_no) REFERENCES bus(bus_no)
    "bus_driver_driver_no_fkey" FOREIGN KEY (driver_no) REFERENCES driver(driver_no)

testfy34227=> select * from bus_driver;
 bus_no | driver_no | date_of_duty | shift 
--------+-----------+--------------+-------
   1111 |        26 | 2016-10-12   |     0
   3333 |        22 | 2016-12-12   |     1
   2014 |        30 | 2016-12-20   |     1
   2222 |        24 | 2016-12-30   |     0
   4444 |        28 | 2016-12-31   |     0
(5 rows)



