		NAME:DURGESH K.PAWAR
			FY34227
			
			ASS:6
1:
testfy34227=> create table area1(a_name varchar(20)primary key,a_type varchar(20)check(a_type in('urban','rular')));
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "area1_pkey" for table "area1"
CREATE TABLE

testfy34227=> \d area1;
            Table "public.area1"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 a_name | character varying(20) | not null
 a_type | character varying(20) | 
Indexes:
    "area1_pkey" PRIMARY KEY, btree (a_name)
Check constraints:
    "area1_a_type_check" CHECK (a_type::text = 'urban'::text OR a_type::text = 'rular'::text)


testfy34227=> SELECT * FROM AREA1;
 a_name | a_type 
--------+--------
 AAA    | urban
 BBB    | urban
 CCC    | urban
 DDD    | rular
 EEE    | rular
 FFF    | rular
(6 rows)

testfy34227=> CREATE TABLE PERSON1(P_NUMBER INT PRIMARY KEY,P_NAME VARCHAR(20),BIRTH_DATE DATE,INCOME FLOAT,A_NAME VARCHAR(20)REFERENCES AREA1(A_NAME)ON DELETE CASCADE ON UPDATE CASCADE);
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "person1_pkey" for table "person1"
CREATE TABLE

testfy34227=> \d PERSON1;
             Table "public.person1"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 p_number   | integer               | not null
 p_name     | character varying(20) | 
 birth_date | date                  | 
 income     | double precision      | 
 a_name     | character varying(20) | 
Indexes:
    "person1_pkey" PRIMARY KEY, btree (p_number)
Foreign-key constraints:
    "person1_a_name_fkey" FOREIGN KEY (a_name) REFERENCES area1(a_name) ON UPDATE CASCADE ON DELETE CASCADE


testfy34227=> SELECT * FROM PERSON1 VALUES;
 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
       12 | PAVAN    | 1997-08-12 |  49000 | CCC
       13 | ASHWINI  | 1999-08-06 |  60000 | BBB
       14 | ANKITA   | 1999-08-31 |  55000 | DDD
       15 | VIKAS    | 1997-10-10 |  40000 | EEE
       16 | KARISHMA | 1997-12-10 |  30000 | FFF
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
       18 | VIKAS    | 1997-10-10 |  40000 | BBB
       19 | VIKAS    | 1997-10-10 |  40000 | CCC
       20 | VIKAS    | 1997-10-10 |  40000 | DDD
       21 | SATISH   | 1997-10-10 |  40000 | EEE
       22 | SATISH   | 1997-10-10 |  40000 | FFF
(12 rows)

		1:
testfy34227=> SELECT P_NAME FROM PERSON1 WHERE A_NAME='AAA'; 
  p_name  
----------
 DURGESH
 KARISHMA
(2 rows)

		2:
testfy34227=> select p_name from person1 where p_name like 'K%',select max p_name;
  p_name  
----------
 KARISHMA
 KARISHMA
(2 rows)
k
(2)
		3:
testfy34227=> select extract(month from birth_date)from person1 where birth_date='1997-10-10';
  date_part 
-----------
        10
        10
        10
        10
        10
        10
(6 rows)

		4:		
testfy34227=> select count(*) from person1 where birth_date='1997-10-10';
 count 
-------
     6
(1 row)
		5:
testfy34227=> select count(*) from person1 where income<50000;
 count 
-------
     9
(1 row)
		6:
testfy34227=>  select distinct p_name from person1 where income between 30000 and 55000;
  p_name  
----------
 ANKITA
 DURGESH
 KARISHMA
 PAVAN
 SATISH
 VIKAS
(6 rows)


		7:
testfy34227=> select avg(income)from person1;
       avg        
------------------
 42833.3333333333
(1 row)
		8:
testfy34227=> select avg(income)from person1 where a_name='AAA';
  avg  
-------
 40000
(1 row)
		8:
testfy34227=> select sum(income)from person1 where a_name='BBB';
  sum   
--------
 100000
(1 row)

		9:
testfy34227=> select a_name,max(income) from person1 group by a_name;
 a_name |  max  
--------+-------
 FFF    | 40000
 DDD    | 55000
 AAA    | 50000
 BBB    | 60000
 EEE    | 40000
 CCC    | 49000
(6 rows)

	10:
testfy34227=> select count(*),a_name from person1 group by a_name;
 count | a_name 
-------+--------
     2 | FFF
     2 | DDD
     2 | AAA
     2 | BBB
     2 | EEE
     2 | CCC
(6 rows)


testfy34227=> select * from person1 where(a_name='AAA' and income>3000);

 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
(2 rows)

testfy34227=> select count(*) from person1 where(a_name='AAA' and income<3000);
 count 
-------
     0
(1 row)

testfy34227=> select count(*) from person1 where(a_name='AAA' and income>3000);
 count 
-------
     2
(1 row)
		13:
testfy34227=> select * from person1 order by p_number,a_name desc;
 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
       12 | PAVAN    | 1997-08-12 |  49000 | CCC
       13 | ASHWINI  | 1999-08-06 |  60000 | BBB
       14 | ANKITA   | 1999-08-31 |  55000 | DDD
       15 | VIKAS    | 1997-10-10 |  40000 | EEE
       16 | KARISHMA | 1997-12-10 |  30000 | FFF
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
       18 | VIKAS    | 1997-10-10 |  40000 | BBB
       19 | VIKAS    | 1997-10-10 |  40000 | CCC
       20 | VIKAS    | 1997-10-10 |  40000 | DDD
       21 | SATISH   | 1997-10-10 |  40000 | EEE
       22 | SATISH   | 1997-10-10 |  40000 | FFF
(12 rows)

	12:
testfy34227=> select * from person1 order by p_number desc;
 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       22 | SATISH   | 1997-10-10 |  40000 | FFF
       21 | SATISH   | 1997-10-10 |  40000 | EEE
       20 | VIKAS    | 1997-10-10 |  40000 | DDD
       19 | VIKAS    | 1997-10-10 |  40000 | CCC
       18 | VIKAS    | 1997-10-10 |  40000 | BBB
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
       16 | KARISHMA | 1997-12-10 |  30000 | FFF
       15 | VIKAS    | 1997-10-10 |  40000 | EEE
       14 | ANKITA   | 1999-08-31 |  55000 | DDD
       13 | ASHWINI  | 1999-08-06 |  60000 | BBB
       12 | PAVAN    | 1997-08-12 |  49000 | CCC
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
(12 rows)

testfy34227=> select a_name,min(income) from person1 group by a_name; a_name |  min  
--------+-------
 FFF    | 30000
 DDD    | 40000
 AAA    | 30000
 BBB    | 40000
 EEE    | 40000
 CCC    | 40000
(6 rows)

testfy34227=> update person1 set a_name='BBB' where a_name='CCC'; 
UPDATE 2
testfy34227=> SELECT * FROM PERSON1;
 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
       13 | ASHWINI  | 1999-08-06 |  60000 | BBB
       14 | ANKITA   | 1999-08-31 |  55000 | DDD
       15 | VIKAS    | 1997-10-10 |  40000 | EEE
       16 | KARISHMA | 1997-12-10 |  30000 | FFF
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
       18 | VIKAS    | 1997-10-10 |  40000 | BBB
       20 | VIKAS    | 1997-10-10 |  40000 | DDD
       21 | SATISH   | 1997-10-10 |  40000 | EEE
       22 | SATISH   | 1997-10-10 |  40000 | FFF
       12 | PAVAN    | 1997-08-12 |  49000 | BBB
       19 | VIKAS    | 1997-10-10 |  40000 | BBB
(12 rows)

testfy34227=> delete from person1 where a_name='aaa';
DELETE 0
testfy34227=> select * from person1;
 p_number |  p_name  | birth_date | income | a_name 
----------+----------+------------+--------+--------
       11 | DURGESH  | 1998-08-11 |  50000 | AAA
       13 | ASHWINI  | 1999-08-06 |  60000 | BBB
       14 | ANKITA   | 1999-08-31 |  55000 | DDD
       15 | VIKAS    | 1997-10-10 |  40000 | EEE
       16 | KARISHMA | 1997-12-10 |  30000 | FFF
       17 | KARISHMA | 1997-12-10 |  30000 | AAA
       18 | VIKAS    | 1997-10-10 |  40000 | BBB
       20 | VIKAS    | 1997-10-10 |  40000 | DDD
       21 | SATISH   | 1997-10-10 |  40000 | EEE
       22 | SATISH   | 1997-10-10 |  40000 | FFF
       12 | PAVAN    | 1997-08-12 |  49000 | BBB
       19 | VIKAS    | 1997-10-10 |  40000 | BBB
(12 rows)


2:


		(2)

testfy34227=> select avg(balance),branch_no from account group by branch_no having avg(balance)>1200;
         avg         | branch_no 
---------------------+-----------
 366200.000000000000 |    414206
  37200.000000000000 |    414205
  36200.000000000000 |    414204
  35200.000000000000 |    414203
  34200.000000000000 |    414202
(5 rows)


		(3)
testfy34227=> select loan_no from loan where loan_amount=null;
 loan_no 
---------
(0 rows)

		(4)

testfy34227=>  select cust_name from customer where cust_no in(select cust_no from cust_loan where loan_no in(select loan_no from branch))order by cust_name;
 cust_name 
-----------
 durgesh
 pavan
 satish
 vikas
 vishesh
(5 rows)




		(5)
testfy34227=> select cust_name from customer where cust_address like'%eol%';
 cust_name 
-----------
 durgesh
 vikas
 satish
(3 rows)

		(6)
testfy34227=> select avg(balance)from account where branch_no in(select branch_no from branch where branch_city='deola');
         avg         
---------------------
 200200.000000000000
(1 row)

		(7)
testfy34227=> select distinct avg(balance)from account,branch where branch.branch_no=account.acc_no;
 avg 
-----
    
(1 row)

or
testfy34227=> select avg(balance)from account;
         avg         
---------------------
 101800.000000000000
(1 row)



		(8)
testfy34227=> select cust_name,loan.loan_no from customer,loan,cust_loan where customer.cust_no=cust_loan.cust_no and loan.loan_no=cust_loan.loan_no and cust_city='deola';
 cust_name | loan_no 
-----------+---------
 satish    |     123
 vikas     |     124
 vikas     |     125
 vikas     |     126
(4 rows)


		(9)

testfy34227=> select sum(loan_amount)from loan where branch_no in(select branch_no from branch where branch_city='satana');
  sum  
-------
 24000
(1 row)


		(10)
testfy34227=> select count(*) from customer;
 count 
-------
     5
(1 row)

