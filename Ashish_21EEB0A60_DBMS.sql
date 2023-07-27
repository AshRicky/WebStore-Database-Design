create database ashish_dbms;
use ashish_dbms;

create table warehouse
(
   w_no int primary key,
   location varchar(20)
);

create table products  (
p_no int primary key,  pname varchar(50),
price float,  mrp float,
category varchar(20)
);

create table stock  (
p_no int,
w_no int,  quantity int,  exp_date date,
primary key(p_no,w_no),
foreign key(p_no) references products(p_no),  foreign key(w_no) references warehouse(w_no)
);

create table supplies
(
p_no int,  w_no int,
supp_date date,  quantity int,
exp_date date,
primary key(p_no,w_no,supp_date),
foreign key(p_no) references products(p_no),  foreign key(w_no) references warehouse(w_no)
);

create table expired  (
p_no int,
w_no int,  ret_date date,  quantity int,
primary key(p_no,w_no,ret_date),
foreign key(p_no) references products(p_no),  foreign key(w_no) references warehouse(w_no)
);

create table customer  (
username varchar(50) primary key,  pass varchar(50),
cname varchar(50),  phno varchar(10),
email varchar(50)
);

create table card  (
cno int,
username varchar(50),  cvv int,
exp_date date,  nameoncard varchar(50),
card_type varchar(20),  primary key(cno,username),
foreign key(username) references customer(username)
);

create table address
(
ad_no int,
username varchar(50),  hno varchar(10),  street varchar(10),  city varchar(50),  pincode int,
primary key(ad_no,username), foreign key (username) references customer(username)
);

create table cart  (
username varchar(50),
p_no int,  quantity int,
primary key(username,p_no),
foreign key (username) references customer(username),  foreign key (p_no) references products(p_no)
);

create table delivery_service  (
ds_id int primary key,
ds_name varchar(50),  contact varchar(50)
);

create table order_  (
order_id int primary key,  order_date date,
order_status varchar(20),  w_no int,
username varchar(50),  tot_price float,
gorss_price float,  discount float,
ad_no int,  ds_id int,
tracking_id int,  dstatus varchar(20),
foreign key (w_no) references warehouse(w_no),  foreign key (username) references customer(username),
foreign key (ad_no) references address(ad_no),  foreign key (ds_id) references delivery_service(ds_id)
);

create table order_item
(
order_id int,  p_no int,  quantity int,
primary key(order_id,p_no),
foreign key(order_id) references order_(order_id),  foreign key(p_no) references products(p_no)
);

create table payment  (
payment_id int primary key,  payment_status varchar(20),
amount float,  cno int,
order_id int,
foreign key (cno) references card(cno),
foreign key (order_id) references order_(order_id)
);

insert into warehouse values(1,'HYDERABAD');  
insert into warehouse values(2,'BENGALURU');  
insert into warehouse values(3,'MUMBAI');

select * from warehouse;

insert into products values(1,'IQOO7',25000,29000,'ELECTRONICS');
insert into products values(2,'IPHONE 14 PRO MAX',130000,139900,'ELECTRONICS');
insert into products values(3,'FERRERO ROCHER',120,150,'FOOD');  
insert into products values(4,'HERSHEY KISSES',90,140,'FOOD');
insert into products values(5,'BOAT AIRDOPES',1299,1700,'ACCESORIES');  
insert into products values(6,'MYSORE SANDAL SOAP',50,60,'COSMETICS');
insert into products values(7,'MAGGI',10,12,'GROCERIES');  
insert into products values(8,'BOOST',100,105,'GROCERIES');

select * from products;

insert into stock values(1,1,4,null);  
insert into stock values(2,1,11,null);
insert into stock values(3,1,7,str_to_date('5-20-2023','%m-%d-%Y'));  
insert into stock values(4,1,11,str_to_date('6-1-2023','%m-%d-%Y'));
insert into stock values(5,1,10,str_to_date('5-21-2023','%m-%d-%Y'));  
insert into stock values(3,2,9,str_to_date('6-01-2023','%m-%d-%Y'));  
insert into stock values(4,2,18,str_to_date('5-30-2023','%m-%d-%Y'));  
insert into stock values(5,2,10,null);
insert into stock values(6,2,19,str_to_date('5-11-2023','%m-%d-%Y'));  
insert into stock values(7,2,11,str_to_date('5-10-2023','%m-%d-%Y'));  
insert into stock values(1,3,1,null);
insert into stock values(2,3,6,null);
insert into stock values(6,3,13,str_to_date('6-09-2023','%m-%d-%Y'));  
insert into stock values(7,3,5,str_to_date('6-05-2023','%m-%d-%Y'));  
insert into stock values(8,3,4,str_to_date('6-04-2023','%m-%d-%Y'));

select * from stock;

insert into supplies values(1,1,str_to_date('6-11-2021','%m-%d-%Y'),5,null);  
insert into supplies values(2,1,str_to_date('6-01-2021','%m-%d-%Y'),11,null);  
insert into supplies values(3,1,str_to_date('6-14-2021','%m-%d-%Y'),9,str_to_date('6-11-2023','%m-%d-%Y'));
insert into supplies values(4,1,str_to_date('6-12-2021','%m-%d-%Y'),11,str_to_date('6-1-2023','%m-%d-%Y'));
insert into supplies values(5,1,str_to_date('6-22-2021','%m-%d-%Y'),13,str_to_date('6-21-2023','%m-%d-%Y'));
insert into supplies values(3,2,str_to_date('6-19-2021','%m-%d-%Y'),10,str_to_date('6-01-2023','%m-%d-%Y'));
insert into supplies values(4,2,str_to_date('6-16-2021','%m-%d-%Y'),22,str_to_date('6-30-2023','%m-%d-%Y'));
insert into supplies values(5,2,str_to_date('6-14-2021','%m-%d-%Y'),10,null);
insert into supplies values(6,2,str_to_date('6-10-2021','%m-%d-%Y'),19,str_to_date('6-11-2023','%m-%d-%Y'));
insert into supplies values(7,2,str_to_date('6-10-2021','%m-%d-%Y'),14,str_to_date('6-10-2023','%m-%d-%Y'));
insert into supplies values(1,3,str_to_date('6-07-2021','%m-%d-%Y'),11,null);  
insert into supplies values(2,3,str_to_date('6-18-2021','%m-%d-%Y'),1,null);  
insert into supplies values(6,3,str_to_date('6-14-2021','%m-%d-%Y'),7,str_to_date('6-09-2023','%m-%d-%Y'));
insert into supplies values(7,3,str_to_date('6-25-2021','%m-%d-%Y'),16,str_to_date('6-05-2023','%m-%d-%Y'));
insert into supplies values(8,3,str_to_date('6-29-2021','%m-%d-%Y'),5,str_to_date('6-04-2023','%m-%d-%Y'));
insert into supplies values(8,3,str_to_date('6-20-2021','%m-%d-%Y'),9,str_to_date('01-01-2022','%m-%d-%Y'));

select * from supplies;

insert into expired values(8,3,str_to_date('01-01-2022','%m-%d-%Y'),5);  
select * from expired;

insert into customer values('ASHISH','ASH','ASHISH BHARADWAJ','1111111111','ashish@xyz.com');
insert into customer values('RICKY','RKY','RICKY SAI','2222222222','ricky@xyz.com');
insert into customer values('BHARADWAJ','BWJ','BHARADWAJ RAO','3333333333','bharadwaj@xyz.com');
insert into customer values('JOHN','JOH','JOHN JOHN','4444444444','johnjohn@xyz.com');

select * from customer;

insert into card values(1000,'ASHISH',123,str_to_date('12-31-2025','%m-%d-%Y'),'A','VISA');
insert into card values(1001,'ASHISH',456,str_to_date('12-31-2025','%m-%d-%Y'),'B','RUPAY');
insert into card values(1002,'RICKY',789,str_to_date('12-31-2025','%m-%d-%Y'),'C','MASTER CARD');
insert into card values(1003,'RICKY',145,str_to_date('12-31-2025','%m-%d-%Y'),'D','AMERICAN EXPRESS');
insert into card values(1004,'JOHN',567,str_to_date('12-31-2025','%m-%d-%Y'),'E','RUPAY');
insert into card values(1005,'BHARADWAJ',123,str_to_date('12-31-2025','%m-%d-%Y'),'F','VISA');

select * from card;

insert into address values(1,'ASHISH','1-1','A','HYDERABAD',500001);  
insert into address values(2,'ASHISH','1-2','B','HYDERABAD',500002);  
insert into address values(1,'RICKY','1-3','C','HYDERABAD',500003);  
insert into address values(2,'RICKY','1-4','D','HYDERABAD',500004);  
insert into address values(1,'BHARADWAJ','1-5','E','HYDERABAD',500005);  
insert into address values(1,'JOHN','1-6','F','HYDERABAD',500006);


select * from address;

insert into cart values('ASHISH',1,1);
insert into cart values('ASHISH',3,2);  
insert into cart values('ASHISH',6,5);  
insert into cart values('ASHISH',8,3);  
insert into cart values('RICKY',2,1);  
insert into cart values('RICKY',4,3);  
insert into cart values('RICKY',5,4);  
insert into cart values('RICKY',6,2);  
insert into cart values('JOHN',2,1);  
insert into cart values('JOHN',7,4);  
insert into cart values('BHARADWAJ',3,3);  
insert into cart values('BHARADWAJ',5,1);

select * from cart;

insert into delivery_service values(1,'INDIA  POST','indiapost@indiapost.gov.in');
insert into delivery_service values(2,'BLUE DART','bluedart@bluedart.com');  
insert into delivery_service values(3,'FEDEX','fedex@fedex.com');
insert into delivery_service values(4,'DHL','dhl@dhl.com');

select * from delivery_service;

insert into order_ values(1,str_to_date('12-31-2022','%m-%d-%Y'),'SUCCESS',1,'ASHISH',22098,25100,3004,1,1,1,'DELIVERED');
insert into order_ values(2,str_to_date('5-02-2023 ','%m-%d-%Y'),'SUCCESS',2,'ASHISH',268,280,12,2,2,2,'DELIVERED');
insert into order_ values(3,str_to_date('5-05-2023','%m-%d-%Y'),'SUCCESS',2,'RICKY',531,554,23,1,3,3,'DELIVERED');
insert into order_ values(4,str_to_date('5-09-2023','%m-%d-%Y'),'SUCCESS',3,'RICKY',500,525,25,2,4,4,'DELIVERED');
insert into order_ values(5,str_to_date('5-11-2023','%m-%d-%Y'),'SUCCESS',3,'JOHN',18000,20000,2000,1,1,5,'DELIVERED');
insert into order_ values(6,str_to_date('5-16-2023','%m-%d-%Y'),'SUCCESS',3,'BHARADWAJ',90,99,9,1,2,6,'DELIVERED');
insert into order_ values(7,str_to_date('5-19-2023','%m-%d-%Y'),'SUCCESS',1,'BHARADWAJ',1500,200,500,1,3,7,'DELIVERED');
insert into order_ values(8,str_to_date('5-22-2023','%m-%d-%Y'),'NO  STOCK',null,'ASHISH',22148,25155,3007,1,null,null,null);
insert into order_ values(9,str_to_date('5-25-2023','%m-%d-%Y'),'NO  STOCK',null,'RICKY',22136,25142,3006,2,null,null,null);
insert into order_ values(10,str_to_date('5-31-2023','%m-%d-%Y'),'PAYMENT FAILED',null,'JOHN',18000,20000,2000,1,null,null,null);


select * from order_;

insert into order_item values(1,1,1);  
insert into order_item values(1,3,2);  
insert into order_item values(2,4,4);  
insert into order_item values(3,3,1);  
insert into order_item values(3,7,3);  
insert into order_item values(4,8,5);  
insert into order_item values(5,2,1);  
insert into order_item values(6,6,3);  
insert into order_item values(7,5,3);
insert into order_item values(8,1,1);  
insert into order_item values(8,3,1);  
insert into order_item values(8,8,1);  
insert into order_item values(9,1,1);  
insert into order_item values(9,4,1);  
insert into order_item values(9,7,1);  
insert into order_item values(10,2,1);

select * from order_item;

insert into payment values(1,'SUCCESS',22098,1000,1);  
insert into payment values(2,'SUCCESS',268,1001,2);  
insert into payment values(3,'SUCCESS',531,1002,3);  
insert into payment values(4,'SUCCESS',500,1003,4);  
insert into payment values(5,'SUCCESS',18000,1004,5);  
insert into payment values(6,'SUCCESS',90,1005,6);  
insert into payment values(7,'SUCCESS',1500,1005,7);
insert into payment values(8,'INSUFFICIENT FUNDS',18000,1004,10);

select * from payment;















