create database library;
use library;
show databases;
create table LMS_MEMBERS(member_id varchar(10),member_name varchar(30),city varchar(20),date_register date,date_expire date,membership_status varchar(15),primary key(member_id));
desc lms_members;
select * from lms_members;
insert into lms_members values("LM001","Amit","Chennai","2012-02-12","2013-02-11","Temporary");
insert into lms_members values("LM002","Abdhul","Delhi","2012-04-10","2013-04-09","Temporary");
insert into lms_members values("LM003","Gayan","Chennai","2012-05-13","2013-05-12","Permanent");
insert into lms_members values("LM004","Radha","Chennai","2012-04-22","2013-04-21","Temporary");
insert into lms_members values("LM005","Guru","Bangalore","2012-03-30","2013-05-16","Temporary");
insert into lms_members values("LM006","Mohan","Chennai","2012-04-12","2013-05-16","Temporary");

create table LMS_SUPPLIERS_DETAILS(supplier_id varchar(4),supplier_name varchar(30),address varchar(50),contact int,email varchar(16),primary key(supplier_id));
desc lms_suppliers_details;
select * from  lms_suppliers_details;
insert into lms_suppliers_details values("S01","Singapore shoppee","Chennai",98941235,"sing@gmail.com");
insert into lms_suppliers_details values("S02","JK Stores","Mumbai",99401234,"jks@yahoo.com");
insert into lms_suppliers_details values("S03","Rose Book Store","Trivandrum",94444112,"rose@gmail.com");
insert into lms_suppliers_details values("S04","Kavari Store","Delhi",86300014,"kavi@redif.com");
insert into lms_suppliers_details values("S05","Einsten Book Gallary","US",95420000,"eingal@aol.com");
insert into lms_suppliers_details values("S06","Akbar Store","Mumbai",78556231,"akbakst@aol.com");

create table LMS_FINE_DETAILS(fine_range varchar(4),fine_amount int,primary key(fine_range));
desc LMS_FINE_DETAILS;
select * from  LMS_FINE_DETAILS;
insert into lms_fine_details values("R0",0.00);
insert into lms_fine_details values("R1",20.00);
insert into lms_fine_details values("R2",50.00);
insert into lms_fine_details values("R3",75.00);
insert into lms_fine_details values("R4",100.00);
insert into lms_fine_details values("R5",150.00);
insert into lms_fine_details values("R6",200.00);


create table LMS_BOOK_DETAILS(book_code varchar(10),book_title varchar(50),category varchar(15),author varchar(30),publication varchar(30),publish_date date,book_edition int,price int,rack_num varchar(4),date_arrival date,supplier_id varchar(50) references LMS_SUPPLIERS_DETAILS(supplier_id),primary key(book_code));
desc lms_book_details;
select * from lms_book_details;
UPDATE lms_book_details SET book_title = 'Java FORvDummies' WHERE book_code ="BL000010";
insert into lms_book_details values("BL000010","Java FORvDummies","JAVA","Paul J.Deitel","Prentice Hall","1999-12-10",6,575.00,"A1","2011-05-10","S01");
insert into lms_book_details values("BL000002","Java: The Complete","JAVA","Herbert Schildt","Tata Mcgraw Hill","2011-10-10",5,750.00,"A1","2011-05-10","S03");
insert into lms_book_details values("BL000003","Java How To Do Programming","JAVA","Paul J.Deitel","Prentice Hall","1999-05-10",6,600.00,"A1","2011-05-10","S01");
insert into lms_book_details values("BL000004","Java: The Complete","JAVA","Herbert Schildt","Tata Mcgraw Hill","2011-10-10",5,750.00,"A1","2012-05-10","S01");
insert into lms_book_details values("BL000005","Java How To Do Programming","JAVA","Paul J.Deitel","Prentice Hall","1999-12-10",6,600.00,"A1","2012-05-11","S01");
insert into lms_book_details values("BL000006","Java: The Complete","JAVA","Herbert Schildt","Tata Mcgraw Hill","2011-10-10",5,750.00,"A1","2012-05-12","S03");
insert into lms_book_details values("BL000007","Let Us C","C","Yashavant Kanetkar","BPB Publications","2010-12-11",9,500.00,"A3","2010-11-03","S03");
insert into lms_book_details values("BL000008","Let Us C","C","Yashavant Kanetkar","BPB Publications","2010-05-12",9,500.00,"A3","2011-08-09","S04");
insert into lms_book_details values("BL000009","Let Us C#","C","Yashavant Kanetkar","BPB Publications","2010-05-12",9,550.00,"A3","2011-08-09","S04");
insert into lms_book_details values("BL000011","Let Us C++","C","Yashavant Kanetkar","BPB Publications","2010-05-12",9,650.00,"A3","2011-08-09","S04");


create table LMS_BOOK_ISSUE(book_issue_no int,member_id varchar(10) references LMS_MEMBERS(member_id),book_code varchar(10) references LMS_BOOK_DETAILS(book_code),date_issue date,date_return date,date_returned date,fine_range varchar(4) references LMS_FINE_DETAILS(fine_range),primary key(book_issue_no));
desc lms_book_issue;
select * from lms_book_issue;
insert into lms_book_issue values(1,"LM001","BL000010","2012-05-01","2012-05-16","2012-05-16","R0");
insert into lms_book_issue values(2,"LM002","BL000002","2012-05-01","2012-05-06","2012-05-16","R2");
insert into lms_book_issue values(3,"LM003","BL000007","2012-04-01","2012-04-16","2012-04-20","R1");
insert into lms_book_issue values(4,"LM004","BL000005","2012-04-01","2012-04-16","2012-04-20","R1");
insert into lms_book_issue values(5,"LM005","BL000008","2012-03-30","2012-04-15","2012-04-20","R1");
insert into lms_book_issue values(6,"LM005","BL000008","2012-04-20","2012-05-05","2012-05-05","R0");
insert into lms_book_issue values(7,"LM003","BL000007","2012-04-22","2012-05-07","2012-05-25","R4");

desc lms_book_details;
select * from lms_fine_details;
select member_name from lms_members where city="chennai";
select member_id,member_name,city,membership_status from lms_members where membership_status="Permanent";
select member_id,member_name from lms_members where member_id=(select member_id from lms_book_issue where book_code="BL000002");
select book_code,book_title,author from lms_book_details where author like"P%";
select count(*) as "NO_OF_BOOKS" from lms_book_details  where category="Java";
select category, count(category)as NO_OF_BOOKS from lms_book_details group by category;
select count(*) as "NO_OF_BOOKS" from lms_book_details  where publication="Prentice Hall";
select lms_book_details.book_code,lms_book_details.book_title from lms_book_details inner join lms_book_issue on lms_book_details.book_code=lms_book_issue.book_code where lms_book_issue.date_issue="2012-04-01";
select member_id,member_name,date_register,date_expire from lms_members where date_expire<"2013-04-01";
select member_id,member_name,date_register,membership_status from lms_members where date_register<"2012-03-01" and membership_status="Temporary";
select member_id,member_name from lms_members where city="Chennai" or city="Delhi";
select concat(book_title,"is written by",author) from lms_book_details;
select avg(price) as "AVERAGEPRICE" from lms_book_details  where category="Java";
select supplier_id,supplier_name,email from lms_suppliers_details where email like"%@gmail.com";
select supplier_id,supplier_name,Coalesce(contact,email,address) as"CONTACTDETAILS" from lms_suppliers_details;
select member_id,(select member_name from lms_members where member_id=lms_book_issue.member_id),book_code,(select book_title from lms_book_details where book_code=lms_book_issue.book_code) from lms_book_issue;
select member_id,(select member_name from lms_members where member_id=lms_book_issue.member_id),fine_range,(select fine_amount from lms_fine_details where fine_range=lms_book_issue.fine_range and fine_amount<100) as "fine_amount" from lms_book_issue;
select book_code,book_title,rack_num FROM lms_book_details where rack_num='A1' order by book_title asc;
select T1.member_id,member_name,date_register FROM lms_members T1 LEFT JOIN lms_book_issue T2 ON T1.member_id = T2.member_id WHERE T2.member_id IS NULL;
select t1.member_id,t2.member_name from lms_book_issue t1 join lms_members t2 on t1.member_id=t2.member_id where t1.date_return>=t1.date_returned and year(t1.date_returned)=2012;
select rack_num,count(rack_num) as "NO_OF_BOOKS" from lms_book_details group by rack_num;
select book_issue_no,(select member_name from lms_members where member_id=lms_book_issue.member_id) as member_name,(select date_register from lms_members where member_id=lms_book_issue.member_id) as date_register,(select date_expire from lms_members where member_id=lms_book_issue.member_id) as date_expire, (select book_title from lms_book_details where book_code=lms_book_issue.book_code) as book_title,(select category from lms_book_details where book_code=lms_book_issue.book_code) as category,(select author from lms_book_details where book_code=lms_book_issue.book_code) as author, (select price from lms_book_details where book_code=lms_book_issue.book_code) as price,date_issue, date_return,date_returned,(select fine_amount from lms_fine_details where fine_range=lms_book_issue.fine_range) as fine_amount from lms_book_issue;
select m.MEMBER_ID,MEMBER_NAME,T.cb as REMAINING_BOOKS from LMS_MEMBERS m inner join (select a.member_id,COUNT(i.MEMBER_ID) as cb from LMS_MEMBERS a left outer join LMS_BOOK_ISSUE i on a.MEMBER_ID= i.MEMBER_ID group by a.MEMBER_ID)T on T.MEMBER_ID=m.MEMBER_ID;
select * from lms_suppliers_details limit 3;
SELECT * FROM lms_suppliers_details ORDER BY supplier_id limit 5 OFFSET 3;
alter table lms_members  rename to lms_members_details;
truncate table lms_fine_details;
select all book_title from lms_book_details;

#Q15 WITH FUNCTION
Delimiter $
CREATE FUNCTION AVERAGE()
RETURNS int
deterministic
BEGIN
SELECT AVG(PRICE) FROM LMS_BOOK_DETAILS WHERE CATEGORY="JAVA";
END $
call average();