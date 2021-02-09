	NAME:PAWAR DURGESH KARBHARI
		fy34227
	ASS:7
testfy34227=> create table emp2(e_id int primary key,e_name varchar(20),address varchar(20),b_date date);
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "emp2_pkey" for table "emp2"

CREATE TABLE

testfy34227=> \d emp2;
             Table "public.emp2"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 e_id    | integer               | not null
 e_name  | character varying(20) | 
 address | character varying(20) | 
 b_date  | date                  | 
Indexes:
    "emp2_pkey" PRIMARY KEY, btree (e_id)

testfy34227=> select * from emp2;
 e_id | e_name  |    address    |   b_date   
------+---------+---------------+------------
    1 | durgesh | satana.nashik | 1998-08-11
    2 | vikas   | deola.nashik  | 1997-10-10
(2 rows)
                                      ^
testfy34227=> create table investor(i_name varchar(20),i_no int primary key,i_date date,i_amt float,e_id int,foreign key(e_id)references emp2(e_id));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "investor_pkey" for table "investor"
CREATE TABLE

testfy34227=> \d investor;
          Table "public.investor"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 i_name | character varying(20) | 
 i_no   | integer               | not null
 i_date | date                  | 
 i_amt  | double precision      | 
 e_id   | integer               | 
Indexes:
    "investor_pkey" PRIMARY KEY, btree (i_no)
Foreign-key constraints:
    "investor_e_id_fkey" FOREIGN KEY (e_id) REFERENCES emp2(e_id)

testfy34227=> select * from investor;
   i_name   | i_no |   i_date   | i_amt | e_id 
------------+------+------------+-------+------
 amruta     |   11 | 2017-01-01 | 12345 |    1
 pavankumar |   12 | 2017-02-02 |  1235 |    2
 rohit      |   13 | 2017-10-05 | 12354 |    1
 raju       |   14 | 2017-02-15 | 12364 |    2
(4 rows)

		1:
testfy34227=> select e_name from emp1 union select i_name from investor;
   e_name   
------------
 alisha
 amruta
 durgesh
 pavankumar
 raju
 rohit
(6 rows)

testfy34227=> 

)

			B:
testfy34227=>  select e_name from emp2 union all select i_name from investor;
   e_name   
------------
 durgesh
 vikas
 amruta
 pavankumar
 rohit
 raju
(6 rows)


		C:                                                 
testfy34227=> select e_id from emp2 intersect select e_id from investor;

   e_name   
------------
 durgesh
 vikas
 amruta
 pavankumar
 
(4 rows)

		D:
testfy34227=>  select e_name from emp2 union all select i_name from investor;
   e_name   
------------
 durgesh
 vikas
 amruta
 pavankumar
 rohit
 raju
(6 rows)

2:

testfy34227=> create table student3(student_no int primary key,student_name varchar(20),address varchar(30),class varchar(5));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "student3_pkey" for table "student3"
CREATE TABLE

testfy34227=> \d student3;
             Table "public.student3"
    Column    |         Type          | Modifiers 
--------------+-----------------------+-----------
 student_no   | integer               | not null
 student_name | character varying(20) | 
 address      | character varying(30) | 
 class        | character varying(5)  | 
Indexes:
    "student3_pkey" PRIMARY KEY, btree (student_no)

testfy34227=> select * from student3;
 student_no | student_name | address | class 
------------+--------------+---------+-------
          1 | durgesh      | satana  | ty
          2 | pavan        | solapur | sy
          3 | shubham      | anagar  | fy
(3 rows)

testfy34227=> create table subject3(subject_no int primary key,subject_name varchar(20));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "subject3_pkey" for table "subject3"
CREATE TABLE
testfy34227=> \d subject3;
             Table "public.subject3"
    Column    |         Type          | Modifiers 
--------------+-----------------------+-----------
 subject_no   | integer               | not null
 subject_name | character varying(20) | 
Indexes:
    "subject3_pkey" PRIMARY KEY, btree (subject_no)

testfy34227=> select * from subject3;
 subject_no | subject_name 
------------+--------------
         11 | electronics
         12 | database
         13 | stastistics
(3 rows)


testfy34227=> create table stud_sub(student_no int,foreign key(student_no)references student3(student_no),subject_no int ,foreign key(subject_no)references subject3(subject_no),marks int ,stastus varchar(20));
CREATE TABLE
testfy34227=> 
testfy34227=> \d stud_sub;
            Table "public.stud_sub"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 student_no | integer               | 
 subject_no | integer               | 
 marks      | integer               | 
 stastus    | character varying(20) | 
Foreign-key constraints:
    "stud_sub_student_no_fkey" FOREIGN KEY (student_no) REFERENCES student3(student_no)
    "stud_sub_subject_no_fkey" FOREIGN KEY (subject_no) REFERENCES subject3(subject_no)


testfy34227=> select * from stud_sub;
 student_no | subject_no | marks | stastus 
------------+------------+-------+---------
          1 |         11 |    75 | pass
          1 |         12 |    25 | fail
          2 |         13 |    65 | pass
          2 |         11 |    30 | fail
          3 |         13 |    65 | pass
          3 |         12 |    55 | pass
(6 rows)

		a:

testfy34227=> select student_name from student3 where student_no in(select student_no from stud_sub where subject_no in(select subject_no from subject3 where subject_name='electronic'or subject_name='database'));
 student_name 
--------------
 durgesh
 shubham
(2 rows)

 
		b:
testfy34227=> select student_name from student3 where student_no in (select student_no in(select student_no from stud_sub where stastus in('pass','fail')));

		c:
testfy34227=> select student_name from student3 where student_no in(select student_no from stud_sub where suject_no in(select subject_no from subject3 where subject_name='databae'and class not in('fy')));
 
		
		D:
testfy34227=> select student_name from student3 where student_no in(select student_no from stud_sub where stastus not in('fail'));
 student_name 
--------------
 durgesh
 pavan
 shubham
(3 rows)


		E:
testfy34227=> select student_name from student3 where address not in('satana');
 student_name 
--------------
 pavan
 shubham
(2 rows)

testfy34227=> 

3:
		a:
testfy34227=> select acc_no from account union all select loan_no from loan;
 acc_no 
--------
   6017
   6018
   6019
   6020
   6021
    123
    124
    125
    126
    127
(10 rows)


		B:
testfy34227=> select acc_no from account except select  loan_no from loan;
 acc_no 
--------
   6017
   6018
   6019
   6020
   6021
(5 rows)


	c:
testfy34227=> select loan_no from loan intersect select loan_amount from loan;
 loan_no 
---------
(0 rows)
	

		D:
testfy34227=> select acc_no from account union all select loan_no from loan;
 acc_no 
--------
   6017
   6018
   6019
   6020
   6021
    123
    124
    125
    126
    127
(10 rows)


