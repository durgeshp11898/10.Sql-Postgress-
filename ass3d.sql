		NAME:DURGESH K.PAWAR
		FY34227
		
1:
testfy34227=> create table machine(m_id int primary key,m_name varchar(20) not null check(m_name=upper(m_name)),m_type varchar(20)check(m_type in('DRILLING','MILLIMNG','LATHE','TURNING','GRINDING')),m_price float check(m_price>0),m_cost float check(m_cost<m_price) );

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "machine_pkey" for table "machine"
CREATE TABLE
testfy34227=> \d macine;
Did not find any relation named "macine".
testfy34227=> \d machine;
           Table "public.machine"

 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 m_id    | integer               | not null
 m_name  | character varying(20) | not null
 m_type  | character varying(20) | 
 m_price | double precision      | 
 m_cost  | double precision      | 
Indexes:
    "machine_pkey" PRIMARY KEY, btree (m_id)
Check constraints:
    "machine_check" CHECK (m_cost < m_price)
    "machine_m_name_check" CHECK (m_name::text = upper(m_name::text))
    "machine_m_price_check" CHECK (m_price > 0::double precision)
    "machine_m_type_check" CHECK (m_type::text = 'DRILLING'::text OR m_type::text = 'MILLIMNG'::text OR m_type::text = 'LATHE'::text OR m_type::text = 'TURNING'::text OR m_type::text = 'GRINDING'::text)

testfy34227=> insert into machine values(111,'DRILLING','LATHE','123456','12345');
INSERT 0 1

testfy34227=> select * from machine;
 m_id |  m_name  | m_type | m_price | m_cost 
------+----------+--------+---------+--------
  111 | DRILLING | LATHE  |  123456 |  12345
(1 row)


testfy34227=> insert into machine values(115,'ABCDEG','GRINDING','123457','12343');
INSERT 0 1
testfy34227=> select * from machine;
 m_id |  m_name  |  m_type  | m_price | m_cost 
------+----------+----------+---------+--------
  111 | DRILLING | LATHE    |  123456 |  12345
  112 | ABCD     | DRILLING | 1234567 | 123451
  113 | ABCDE    | MILLIMNG | 1234568 | 123452
  114 | ABCDEF   | TURNING  |  123456 |  12342
  115 | ABCDEG   | GRINDING |  123457 |  12343
(5 rows)

2:

testfy34227=> create table policy(p_no int primary key,p_name varchar(20) not null check(p_name=lower(p_name)),p_type varchar(20)check(p_type in('life','vehicle','accident')),p_s_d date,p_i_d date check(p_s_d>p_i_d));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "policy_pkey" for table "policy"
CREATE TABLE

testfy34227=> \d policy;
           Table "public.policy"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 p_no   | integer               | not null
 p_name | character varying(20) | not null
 p_type | character varying(20) | 
 p_s_d  | date                  | 
 p_i_d  | date                  | 
Indexes:
    "policy_pkey" PRIMARY KEY, btree (p_no)
Check constraints:
    "policy_check" CHECK (p_s_d > p_i_d)
    "policy_p_name_check" CHECK (p_name::text = lower(p_name::text))
    "policy_p_type_check" CHECK (p_type::text = 'life'::text OR p_type::text = 'vehicle'::text OR p_type::text = 'accident'::text)

testfy34227=> insert into policy values(23,'abcde','accident','08-11-2002','07-10-2001');
INSERT 0 1
testfy34227=> select * from policy;
 p_no | p_name |  p_type  |   p_s_d    |   p_i_d    
------+--------+----------+------------+------------
   11 | lic    | life     | 2000-08-11 | 1999-07-10
   22 | abcd   | vehicle  | 2001-08-11 | 2000-07-10
   23 | abcde  | accident | 2002-08-11 | 2001-07-10
(3 rows)

3:
testfy34227=> create table employe(e_id int primary key,e_name varchar(20)not null check(e_name=upper(e_name)),e_desig varchar(10)check(e_desig in('manager','staff','worker')),e_sal float check(e_sal>0),e_uid text unique);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "employe_pkey" for table "employe"
NOTICE:  CREATE TABLE / UNIQUE will create implicit index "employe_e_uid_key" for table "employe"
CREATE TABLE
testfy34227=> \d employe;
           Table "public.employe"
 Column  |         Type          | Modifiers 
---------+-----------------------+-----------
 e_id    | integer               | not null
 e_name  | character varying(20) | not null
 e_desig | character varying(10) | 
 e_sal   | double precision      | 
 e_uid   | text                  | 
Indexes:
    "employe_pkey" PRIMARY KEY, btree (e_id)
    "employe_e_uid_key" UNIQUE, btree (e_uid)
Check constraints:
    "employe_e_desig_check" CHECK (e_desig::text = 'manager'::text OR e_desig::text = 'staff'::text OR e_desig::text = 'worker'::text)
    "employe_e_name_check" CHECK (e_name::text = upper(e_name::text))
    "employe_e_sal_check" CHECK (e_sal > 0::double precision)


testfy34227=> select * from employe;
 e_id | e_name  | e_desig | e_sal | e_uid  
------+---------+---------+-------+--------
  111 | DURGESH | staff   | 98765 | 334455
  222 | PAVAN   | manager | 98764 | 334466
  333 | RAJU    | worker  | 98763 | 334462
(3 rows)

testfy34227=> 


4:
testfy34227=> create table hotell(h_no int primary key,h_name varchar(20),city varchar(20)); 
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "hotell_pkey" for table "hotell"
CREATE TABLE
testfy34227=> \d hotell
           Table "public.hotell"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 h_no   | integer               | not null
 h_name | character varying(20) | 
 city   | character varying(20) | 
Indexes:
    "hotell_pkey" PRIMARY KEY, btree (h_no)

testfy34227=> select * from hotell;
 h_no |  h_name   |   city    
------+-----------+-----------
  123 | godhavari | deola
  124 | avadhut   | satana
  125 | rajstan   | sangmaner
  126 | hemant    | alephata
(4 rows)

::::
testfy34227=> create table roomm(r_no int primary key check(r_no>=1 and r_no<=100),r_type varchar(20)check(r_type in('single','double','family')),price int check(price>=500 and price<=1000));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "roomm_pkey" for table "roomm"

CREATE TABLE
testfy34227=> \d roomm;
            Table "public.roomm"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 r_no   | integer               | not null
 r_type | character varying(20) | 
 price  | integer               | 
Indexes:
    "roomm_pkey" PRIMARY KEY, btree (r_no)
Check constraints:
    "roomm_price_check" CHECK (price >= 500 AND price <= 1000)
    "roomm_r_no_check" CHECK (r_no >= 1 AND r_no <= 100)
    "roomm_r_type_check" CHECK (r_type::text = 'single'::text OR r_type::text = 'double'::text OR r_type::text = 'family'::text)


testfy34227=> select * from roomm;
 r_no | r_type | price 
------+--------+-------
   11 | single |   600
   21 | double |   700
   31 | family |   900
(3 rows)

:::
testfy34227=> create table guestt(g_no int primary key,g_name 
varchar(20),g_address varchar(20));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "guestt_pkey" for table "guestt"

CREATE TABLE
testfy34227=> \d guestt;
             Table "public.guestt"
  Column   |         Type          | Modifiers 
-----------+-----------------------+-----------
 g_no      | integer               | not null
 g_name    | character varying(20) | 
 g_address | character varying(20) | 
Indexes:
    "guestt_pkey" PRIMARY KEY, btree (g_no)

testfy34227=> select * from guestt;
 g_no |     g_name      | g_address  
------+-----------------+------------
  111 | rahul surwanshi | a/p.deola
 1222 | prashant pawar  | a/p.satana
  333 | priyanka aher   | a/p.kalwan
(3 rows)
:::::

testfy34227=> create table bookingg(h_no int,foreign key(h_no)references hotell(h_no),r_no int,foreign key(r_no)references roomm(r_no),date_from date,g_no int,foreign key(g_no)references guestt(g_no),date_to date check(date_from>date_to));
CREATE TABLE
testfy34227=> \d bookingg;
     Table "public.bookingg"
  Column   |  Type   | Modifiers 
-----------+---------+-----------
 h_no      | integer | 
 r_no      | integer | 
 date_from | date    | 
 g_no      | integer | 
 date_to   | date    | 
Check constraints:
    "bookingg_check" CHECK (date_from > date_to)
Foreign-key constraints:
    "bookingg_g_no_fkey" FOREIGN KEY (g_no) REFERENCES guestt(g_no)
    "bookingg_h_no_fkey" FOREIGN KEY (h_no) REFERENCES hotell(h_no)
    "bookingg_r_no_fkey" FOREIGN KEY (r_no) REFERENCES roomm(r_no)


testfy34227=> select * from bookingg;
 h_no | r_no | date_from  | g_no |  date_to   
------+------+------------+------+------------
  123 |   11 | 2016-06-11 |  111 | 2016-05-11
  124 |   21 | 2016-07-11 | 1222 | 2016-06-11
  125 |   31 | 2016-07-11 |  333 | 2016-06-11
(3 rows)

testfy34227=> 


5:

testfy34227=> create table branch(branch_no int primary key,branch_name varchar(30)not null,branch_city varchar(20));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "branch_pkey" for table "branch"

CREATE TABLE
testfy34227=> \d branch;
              Table "public.branch"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 branch_no   | integer               | not null
 branch_name | character varying(30) | not null
 branch_city | character varying(20) | 
Indexes:
    "branch_pkey" PRIMARY KEY, btree (branch_no)


INSERT 0 1
testfy34227=> insert into branch values(414206,'deola 
branch','deola');
INSERT 0 1

testfy34227=> select * from branch;
 branch_no |   branch_name   | branch_city 
-----------+-----------------+-------------
    414202 | bhaur branch    | deola
    414203 | satana branch   | satana
    414204 | kalwan branch   | kalwan
    414205 | malegaon branch | malegaon
    414206 | deola branch    | deola
(5 rows)

testfy34227=> create table customer(cust_no int primary key,cust_name varchar(20),cust_address text,cust_city varchar(20));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "customer_pkey" for table "customer"
CREATE TABLE

testfy34227=> \d customer;
             Table "public.customer"
    Column    |         Type          | Modifiers 
--------------+-----------------------+-----------
 cust_no      | integer               | not null
 cust_name    | character varying(20) | 
 cust_address | text                  | 
 cust_city    | character varying(20) | 
Indexes:
    "customer_pkey" PRIMARY KEY, btree (cust_no)

testfy34227=> insert into customer values(11,'durgesh','deola.nashik','satana');

testfy34227=> select * from customer;
 cust_no | cust_name |  cust_address   | cust_city 
---------+-----------+-----------------+-----------
      11 | durgesh   | deola.nashik    | satana
      12 | vikas     | deola.nashik    | deola
      13 | satish    | deola.nashik    | deola
      14 | vishesh   | kalwan.nashik   | kalwan
      15 | pavan     | malegaon.nashik | malegaon
(5 rows)

testfy34227=> create table account(acc_no int primary key,acc_type varchar(20),balance int);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "account_pkey" for table "account"
CREATE TABLE

testfy34227=> \d account;
            Table "public.account"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 acc_no   | integer               | not null
 acc_type | character varying(20) | 
 balance  | integer               | 
Indexes:
    "account_pkey" PRIMARY KEY, btree (acc_no)
                                      ^
testfy34227=> create table account(acc_no int primary key,acc_type varchar(20),balance int,branch_no int,foreign key(branch_no)references branch(branch_no),check(acc_type in('saving','current')));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "account_pkey" for table "account"
CREATE TABLE

testfy34227=> \d account;
            Table "public.account"
  Column   |         Type          | Modifiers 
-----------+-----------------------+-----------
 acc_no    | integer               | not null
 acc_type  | character varying(20) | 
 balance   | integer               | 
 branch_no | integer               | 
Indexes:
    "account_pkey" PRIMARY KEY, btree (acc_no)
Check constraints:
    "account_acc_type_check" CHECK (acc_type::text = 'saving'::text OR acc_type::text = 'currrnt'::text)
Foreign-key constraints:
    "account_branch_no_fkey" FOREIGN KEY (branch_no) REFERENCES branch(branch_no)

testfy34227=> insert into account values(6021,'saving','366200','414206');
INSERT 0 1

testfy34227=> select * from account;
 acc_no | acc_type | balance | branch_no 
--------+----------+---------+-----------
   6017 | saving   |   34200 |    414202
   6018 | currrnt  |   35200 |    414203
   6019 | currrnt  |   36200 |    414204
   6020 | saving   |   37200 |    414205
   6021 | saving   |  366200 |    414206
(5 rows)

testfy34227=> create table loan(loan_no int primary key,loan_amount int,no_of_years int,branch_no int,foreign key(branch_no)references branch(branch_no));

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "loan_pkey" for table "loan"
CREATE TABLE

testfy34227=> \d loan;
        Table "public.loan"
   Column    |  Type   | Modifiers 
-------------+---------+-----------
 loan_no     | integer | not null
 loan_amount | integer | 
 no_of_years | integer | 
 branch_no   | integer | 
Indexes:
    "loan_pkey" PRIMARY KEY, btree (loan_no)
Foreign-key constraints:
    "loan_branch_no_fkey" FOREIGN KEY (branch_no) REFERENCES branch(branch_no)

testfy34227=> insert into loan values(123,'23000','2','414202');
INSERT 0 1

testfy34227=> select * from loan;
 loan_no | loan_amount | no_of_years | branch_no 
---------+-------------+-------------+-----------
     123 |       23000 |           2 |    414202
     124 |       24000 |           3 |    414203
     125 |       25000 |           4 |    414204
     126 |       26000 |           5 |    414205
     127 |       27000 |           6 |    414206
(5 rows)
                                                             ^
testfy34227=> create table cust_acc(cust_no int,foreign key(cust_no)references customer(cust_no),acc_no int,foreign key(acc_no)references account(acc_no));

CREATE TABLE

testfy34227=> \d cust_acc;
    Table "public.cust_acc"
 Column  |  Type   | Modifiers 
---------+---------+-----------
 cust_no | integer | 
 acc_no  | integer | 
Foreign-key constraints:
    "cust_acc_acc_no_fkey" FOREIGN KEY (acc_no) REFERENCES account(acc_no)
    "cust_acc_cust_no_fkey" FOREIGN KEY (cust_no) REFERENCES customer(cust_no)

testfy34227=> insert into cust_acc values(11,'6017');
INSERT 0 1

testfy34227=> select * from cust_acc;
 cust_no | acc_no 
---------+--------
      11 |   6017
      12 |   6017
      15 |   6017
      13 |   6018
      13 |   6019
      15 |   6020
      15 |   6021
      14 |   6021
(8 rows)
                                                             ^
testfy34227=> create table cust_loan(cust_no int,foreign key(cust_no)references customer(cust_no),loan_no int ,foreign key(loan_no)references loan(loan_no));
CREATE TABLE

testfy34227=> \d cust_loan;
   Table "public.cust_loan"
 Column  |  Type   | Modifiers 
---------+---------+-----------
 cust_no | integer | 
 loan_no | integer | 
Foreign-key constraints:
    "cust_loan_cust_no_fkey" FOREIGN KEY (cust_no) REFERENCES customer(cust_no)
    "cust_loan_loan_no_fkey" FOREIGN KEY (loan_no) REFERENCES loan(loan_no)

testfy34227=> insert into cust_loan values(11,'123');
INSERT 0 1

testfy34227=> select * from cust_loan;
 cust_no | loan_no 
---------+---------
      11 |     123
      13 |     123
      12 |     124
      14 |     124
      15 |     125
      12 |     125
      12 |     126
(7 rows)

