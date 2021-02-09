		NAME:PAWAR DURGESH KARBHARI
			FY34227

			ASS:4

1:

1:

testfy34227=> alter table employe add designation varchar(20);
ALTER TABLE
testfy34227=> \d employe;
             Table "public.employe"
   Column    |         Type          | Modifiers 
-------------+-----------------------+-----------
 e_id        | integer               | not null
 e_name      | character varying(20) | not null
 e_desig     | character varying(10) | 
 e_sal       | double precision      | 
 e_uid       | text                  | 
 designation | character varying(20) | 
Indexes:
    "employe_pkey" PRIMARY KEY, btree (e_id)
    "employe_e_uid_key" UNIQUE, btree (e_uid)
Check constraints:
    "employe_e_desig_check" CHECK (e_desig::text = 'manager'::text OR e_desig::text = 'staff'::text OR e_desig::text = 'worker'::text)
    "employe_e_name_check" CHECK (e_name::text = upper(e_name::text))
    "employe_e_sal_check" CHECK (e_sal > 0::double precision)


testfy34227=> select * from employe;
 e_id | e_name  | e_desig | e_sal  | e_uid  | designation 
------+---------+---------+--------+--------+-------------
  111 | DURGESH | staff   |  98765 | 334455 | 
  222 | PAVAN   | manager |  98764 | 334466 | 
  333 | RAJU    | worker  |  98763 | 334462 | 
   21 | DURGESH | staff   | 123456 | 222    | computer
   22 | RAJU    | worker  | 123455 | 223    | mechanical
   23 | PAVAN   | manager | 123454 | 224    | electrical
(6 rows)


2:
testfy34227=> create table studentt(student_no int primary key,s_name varchar(20),d_o_b date);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "studentt_pkey" for table "studentt"

CREATE TABLE
testfy34227=> \d studentt;
            Table "public.studentt"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 student_no | integer               | not null
 s_name     | character varying(20) | 
 d_o_b      | date                  | 
Indexes:
    "studentt_pkey" PRIMARY KEY, btree (student_no)

testfy34227=> alter table studentt add address text not null;
ALTER TABLE

testfy34227=> \d studentt;
            Table "public.studentt"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 student_no | integer               | not null
 s_name     | character varying(20) | 
 d_o_b      | date                  | 
 address    | text                  | not null
Indexes:
    "studentt_pkey" PRIMARY KEY, btree (student_no)

testfy34227=> alter table studentt add phone int;
ALTER TABLE

testfy34227=> \d studentt;
            Table "public.studentt"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 student_no | integer               | not null
 s_name     | character varying(20) | 
 d_o_b      | date                  | 
 address    | text                  | not null
 phone      | integer               | 
Indexes:
    "studentt_pkey" PRIMARY KEY, btree (student_no)

testfy34227=> select * from studentt;
 student_no | s_name  |   d_o_b    |         address          | phone  
------------+---------+------------+--------------------------+--------
      34227 | durgesh | 1998-08-11 | a.p bhaur tal.deola      | 282206
      34280 | dyanraj | 1998-11-11 | a.p satana tal.satana    | 282207
      34260 | pavan   | 1998-11-09 | a.p solapur dist solapur | 282208
(3 rows)

testfy34227=> 

3:
testfy34227=> alter table project add constraint p_name check(p_name like 'o%');
ALTER TABLE
testfy34227=> \d project;
           Table "public.project"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 p_no   | integer               | not null
 p_name | character varying(20) | 
 status | character varying(20) | 
Indexes:
    "project_pkey" PRIMARY KEY, btree (p_no)
Check constraints:
    "p_name" CHECK (p_name::text ~~ 'o%'::text)


4:
testfy34227=> \d hospital;
          Table "public.hospital"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 hno    | integer               | not null
 name   | character varying(30) | 
 city   | character varying(30) | 
Indexes:
    "hospital_pkey" PRIMARY KEY, btree (hno)

testfy34227=> alter table hospital add h_budget int;
ALTER TABLE
testfy34227=> \d hospital;
           Table "public.hospital"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 hno      | integer               | not null
 name     | character varying(30) | 
 city     | character varying(30) | 
 h_budget | integer               | 
Indexes:
    "hospital_pkey" PRIMARY KEY, btree (hno)

testfy34227=> alter table hospital add constraint hbudget_chk check(h_budget>50000);
ALTER TABLE
testfy34227=> \d hospital;
           Table "public.hospital"
  Column  |         Type          | Modifiers 
----------+-----------------------+-----------
 hno      | integer               | not null
 name     | character varying(30) | 
 city     | character varying(30) | 
 h_budget | integer               | 
Indexes:
    "hospital_pkey" PRIMARY KEY, btree (hno)
Check constraints:
    "hbudget_chk" CHECK (h_budget > 50000)

testfy34227=> 


5:
testfy34227=> create table driverre(licensons_no int primary key,name varchar(20),address text);

NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "driverre_pkey" for table "driverre"

CREATE TABLE

testfy34227=> \d driverr;
             Table "public.driverr"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 licence_no | integer               | not null
 name       | character varying(20) | 
 address    | text                  | 
Indexes:
    "driverr_pkey" PRIMARY KEY, btree (licence_no)

testfy34227=> alter table driverr add age text;
ALTER TABLE

testfy34227=> alter table driverr add constraint chk_age check(age>20);
ALTER TABLE

testfy34227=> \d driverr;
             Table "public.driverr"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 licence_no | integer               | not null
 name       | character varying(20) | 
 address    | text                  | 
 age        | text                  | 
Indexes:
    "driverr_pkey" PRIMARY KEY, btree (licence_no)
Check constraints:
    "chk_age" CHECK (age > 20::text)


testfy34227=> alter table driverr alter name type varchar(50);
ALTER TABLE
testfy34227=> \d driverr;

             Table "public.driverr"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 licence_no | integer               | not null
 name       | character varying(50) | 
 address    | text                  | 
 age        | text                  | 
Indexes:
    "driverr_pkey" PRIMARY KEY, btree (licence_no)
Check constraints:
    "chk_age" CHECK (age > 20::text)


testfy34227=> alter table driverr drop column age;
ALTER TABLE
testfy34227=> \d driverr;
             Table "public.driverr"
   Column   |         Type          | Modifiers 
------------+-----------------------+-----------
 licence_no | integer               | not null
 name       | character varying(50) | 
 address    | text                  | 
Indexes:
    "driverr_pkey" PRIMARY KEY, btree (licence_no)


testfy34227=> drop table driverr;
DROP TABLE

6:
testfy34227=> create table game(name varchar(20),no_of_player int,captain_name varchar(20));
CREATE TABLE

testfy34227=> alter table game add game_no int primary key;
NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "game_pkey" for table "game"

ALTER TABLE
testfy34227=> \d game;
               Table "public.game"
    Column    |         Type          | Modifiers 
--------------+-----------------------+-----------
 name         | character varying(20) | 
 no_of_player | integer               | 
 captain_name | character varying(20) | 
 game_no      | integer               | not null
Indexes:
    "game_pkey" PRIMARY KEY, btree (game_no)

testfy34227=> alter table game add constraint captain_name check(captain_name=upper(captain_name));
ALTER TABLE

testfy34227=> \d game;
               Table "public.game"
    Column    |         Type          | Modifiers 
--------------+-----------------------+-----------
 name         | character varying(20) | 
 no_of_player | integer               | 
 captain_name | character varying(20) | 
 game_no      | integer               | not null
Indexes:
    "game_pkey" PRIMARY KEY, btree (game_no)
Check constraints:
    "captain_name" CHECK (captain_name::text = upper(captain_name::text))

testfy34227=> alter table game add game_duration time;
ALTER TABLE

testfy34227=> \d game;
                Table "public.game"
    Column     |          Type          | Modifiers 
---------------+------------------------+-----------
 name          | character varying(20)  | 
 no_of_player  | integer                | 
 captain_name  | character varying(20)  | 
 game_no       | integer                | not null
 game_duration | time without time zone | 
Indexes:
    "game_pkey" PRIMARY KEY, btree (game_no)
Check constraints:
    "captain_name" CHECK (captain_name::text = upper(captain_name::text))

testfy34227=> alter table game add game_type varchar(20);
ALTER TABLE
testfy34227=> \d game;
                Table "public.game"
    Column     |          Type          | Modifiers 
---------------+------------------------+-----------
 name          | character varying(20)  | 
 no_of_player  | integer                | 
 captain_name  | character varying(20)  | 
 game_no       | integer                | not null
 game_duration | time without time zone | 
 game_type     | character varying(20)  | 
Indexes:
    "game_pkey" PRIMARY KEY, btree (game_no)
Check constraints:
    "captain_name" CHECK (captain_name::text = upper(captain_name::text))

testfy34227=> alter table game add constraint game_type check(game_type in('cricket','hockey','tennis'));
ALTER TABLE
testfy34227=> \d game;
                Table "public.game"
    Column     |          Type          | Modifiers 
---------------+------------------------+-----------
 name          | character varying(20)  | 
 no_of_player  | integer                | 
 captain_name  | character varying(20)  | 
 game_no       | integer                | not null
 game_duration | time without time zone | 
 game_type     | character varying(20)  | 
Indexes:
    "game_pkey" PRIMARY KEY, btree (game_no)
Check constraints:
    "captain_name" CHECK (captain_name::text = upper(captain_name::text))
    "game_type" CHECK (game_type::text = 'cricket'::text OR game_type::text = 'hockey'::text OR game_type::text = 'tennis'::text)

testfy34227=> drop table game;
DROP TABLE

