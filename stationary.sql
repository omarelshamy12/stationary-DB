
CREATE TABLE  customer(
  id INT,
  c_name VARCHAR(50),
  phone VARCHAR(11),
  PRIMARY KEY(id)

);
CREATE TABLE supplier(
  id INT PRIMARY KEY,
  s_name VARCHAR(50),
  location VARCHAR(50)
);
CREATE TABLE  warehouse(
  w_name VARCHAR(50) PRIMARY KEY,
  location VARCHAR(50)
);

CREATE TABLE  department(
  d_number INT PRIMARY KEY,
  name VARCHAR(50)
);

ALTER TABLE department
ADD FOREIGN KEY(m_ssn)
REFERENCES employee(ssn)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE department
ADD m_ssn INT;




DROP TABLE item;
CREATE TABLE item(
  id INT PRIMARY KEY,
  d_no INT,
  i_name VARCHAR(50),
  price DEC(6,2),
  Available VARCHAR(50),
  FOREIGN KEY (d_no) REFERENCES department(d_number) ON DELETE RESTRICT ON UPDATE CASCADE 
);




CREATE TABLE EMPLOYEE(
  ssn INT PRIMARY KEY,
  d_no INT,
  name VARCHAR(50),
  dob DATE,
  salary INT,
  address VARCHAR(200),
  start_date DATE,
  FOREIGN KEY (d_no) REFERENCES department(d_number) ON DELETE CASCADE ON UPDATE CASCADE

);




CREATE TABLE ACCOUNTANT(
  ssn INT PRIMARY KEY,
  office_no INT,
  FOREIGN KEY (ssn) REFERENCES employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE SALES_CLERK(
  ssn INT PRIMARY KEY,
  cashier_no INT,
  FOREIGN KEY (ssn) REFERENCES employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE SALES_ASSINTANT(
  ssn INT PRIMARY KEY,
  shift INT,
  FOREIGN KEY (ssn) REFERENCES employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE BUYS(
  Recite_no INT,
  item_id INT,
  Customerid INT,
  date DATE,
  quantity INT,
  FOREIGN KEY (Customerid) REFERENCES customer(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (Item_id) REFERENCES item(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY(Recite_no,item_id)
);

CREATE TABLE SUPPLIES(
  supplier_id INT,
  item_id INT,
  number_of_items INT,
  FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (Item_id) REFERENCES item(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY(supplier_id,item_id)
);







CREATE TABLE IS_STORED(
  warehouse_name VARCHAR(50),
  item_id INT,
  number_of_items INT,
  FOREIGN KEY (warehouse_name) REFERENCES warehouse(w_name) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(warehouse_name,item_id)
);



ALTER TABLE sales_assisntant
  RENAME TO sales_assistant;




INSERT INTO customer VALUES(1,"omar","0122233457");
INSERT INTO customer VALUES(2,"seif","0122663457");
INSERT INTO customer VALUES(3,"ali","0122993457");
INSERT INTO customer VALUES(4,"shady","0122883457");
INSERT INTO customer VALUES(5,"diana","0122555457");


INSERT INTO employee (ssn,name,dob,salary,address,start_date) VALUES(1,"mahmoud",'1999-06-09',5000,"abdo basha",'2008-11-11');

INSERT INTO department VALUES (1,"electronics",1);

INSERT INTO department VALUES (2,"art craft",6);

INSERT INTO department VALUES (3,"school supplies",7);

UPDATE employee
SET d_no = 1
WHERE ssn = 1;



INSERT INTO item VALUES(1,1,"calculator",100,"true");
INSERT INTO item VALUES(2,2,"drawing sketch",200,"true");
INSERT INTO item VALUES(3,3,"notebook",10,"true");
INSERT INTO item VALUES(4,3,"pen",15,"false");
INSERT INTO item VALUES(5,3,"ruler",12,"false");

INSERT INTO item VALUES(6,3,"eraser",5,"false");
INSERT INTO item VALUES(7,3,"pencil case",16,"false");
INSERT INTO item VALUES(8,3,"stickers",12,"false");

iNSERT INTO item VALUES(9,3,"resistor",7,"false");
iNSERT INTO item VALUES(10,3,"led",8,"false");



INSERT INTO supplier VALUES(1,"mohamed","abdo basha");
INSERT INTO supplier VALUES(2,"samy","abdo basha");
INSERT INTO supplier VALUES(3,"sayed","abdo basha");


INSERT INTO buys VALUES(1,1,1,'2021-12-17',3);
INSERT INTO buys VALUES(1,6,1,'2021-12-17',5);
INSERT INTO buys VALUES(2,2,2,'2021-12-17',10);
INSERT INTO buys VALUES(2,7,2,'2021-12-17',1);
INSERT INTO buys VALUES(3,3,3,'2021-12-17',5);
INSERT INTO buys VALUES(4,2,4,'2021-12-17',6);
INSERT INTO buys VALUES(5,3,5,'2021-12-17',2);
INSERT INTO buys VALUES(5,10,5,'2021-12-17',1);

INSERT INTO buys VALUES(5,10,5,'2021-12-17',1);



INSERT INTO supplies VALUES(1,1,100);
INSERT INTO supplies VALUES(2,2,100);
INSERT INTO supplies VALUES(3,3,100);


INSERT INTO warehouse VALUES("electronics warehouse","abdo basha");
INSERT INTO warehouse VALUES("artcraft warehouse","abdo basha");
INSERT INTO warehouse VALUES("school supllies warehouse","abdo basha");



INSERT INTO is_stored VALUES("electronics warehouse","1",100);
INSERT INTO is_stored VALUES("artcraft warehouse","2",100);
INSERT INTO is_stored VALUES("school supllies warehouse","3",1000);
INSERT INTO is_stored VALUES("school supllies warehouse","4",700);
INSERT INTO is_stored VALUES("school supllies warehouse","5",500);


INSERT INTO is_stored VALUES("school supllies warehouse",6,10);
INSERT INTO is_stored VALUES("school supllies warehouse",7,5);
INSERT INTO is_stored VALUES("school supllies warehouse",8,0);

INSERT INTO is_stored VALUES("electronics warehouse",10,3);
INSERT INTO is_stored VALUES("electronics warehouse",9,3);



INSERT INTO employee VALUES(6,NULL,"yomna",'1999-05-08',20000,"abdo basha",'2005-08-08');

UPDATE employee
SET d_no = 2
WHERE ssn = 6;

INSERT INTO employee VALUES(7,NULL,"mona",'1999-04-04',15000,"abdo basha",'2007-08-08');

UPDATE employee
SET d_no = 3
WHERE ssn = 7;

INSERT INTO employee VALUES(2,1,"ahmed",'1999-08-08',5000,"abdo basha",'2008-08-08');
INSERT INTO employee VALUES(3,1,"salma",'1999-09-09',5000,"abdo basha",'2008-09-09');
INSERT INTO employee VALUES(4,1,"fatma",'1999-10-10',10000,"abdo basha",'2008-06-06');
INSERT INTO employee VALUES(5,1,"enjy",'1999-11-11',10000,"abdo basha",'2009-06-06');

INSERT INTO employee VALUES(8,2,"soha",'1999-03-11',10000,"abdo basha",'2009-06-06');
INSERT INTO employee VALUES(9,2,"noha",'1999-05-11',10000,"abdo basha",'2009-06-06');
INSERT INTO employee VALUES(10,2,"mai",'1999-01-11',10000,"abdo basha",'2009-06-06');

INSERT INTO employee VALUES(11,3,"ola",'1999-11-12',10000,"abdo basha",'2009-06-06');
INSERT INTO employee VALUES(12,3,"ali",'1999-11-15',10000,"abdo basha",'2009-06-06');
INSERT INTO employee VALUES(13,3,"shady",'1999-11-16',10000,"abdo basha",'2009-06-06');


INSERT INTO sales_assistant VALUES(3,1);
INSERT INTO sales_clerk VALUES(2,1);
INSERT INTO sales_clerk VALUES(4,1);
INSERT INTO accountant VALUES(5,1);


INSERT INTO sales_assistant VALUES(8,2);
INSERT INTO sales_clerk VALUES(9,2);
INSERT INTO accountant VALUES(10,2);

INSERT INTO sales_assistant VALUES(11,3);
INSERT INTO sales_clerk VALUES(12,3);
INSERT INTO accountant VALUES(13,3);




SELECT *
FROM employee;

SELECT *
FROM department;

SELECT *
FROM customer;

SELECT *
FROM supplier;

SELECT *
FROM item;

SELECT *
FROM supplies;

SELECT *
FROM buys;

SELECT *
FROM warehouse;


SELECT *
FROM is_stored;


SELECT *
FROM sales_assistant;

SELECT *
FROM sales_clerk;

SELECT *
FROM accountant;








SELECT id , warehouse_name ,i_name
FROM item AS I , is_stored AS S
WHERE I.id = S.item_id AND I.Available = "False";




SELECT customerid , Recite_no , c_name
FROM item AS I, Buys AS B ,customer
WHERE B.item_id=I.id AND B.Quantity * I.price > 1000 AND customer.id=B.customerid;


SELECT salary , employee.name
FROM EMPLOYEE , DEPARTMENT AS D
WHERE employee.d_no = D.D_number AND D.name = "electronics";



SELECT item.i_name ,is_stored.warehouse_name,is_stored.number_of_items
FROM item ,warehouse ,is_stored
where is_stored.number_of_items < 20 AND is_stored.item_id=item.id  AND is_stored.warehouse_name=warehouse.w_name;



SELECT SUM(item.price * buys.quantity),buys.Recite_no,buys.Customerid
from buys
LEFT JOIN item on buys.item_id = item.id
GROUP BY Recite_no;
