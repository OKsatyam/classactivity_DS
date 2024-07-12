create database classActivity;
use classActivity;
create table productlines (
productLine varchar(50) primary key,
textDescription varchar(4000),
htmlDescription mediumtext,
image mediumblob	
);

insert into productlines (productLine,textDescription)
values 
("Truck","range of trucks"),
("Bikes","Bikes from 2000s"),
("Cycles"," cycles ranging from 10000rs to 35000rs" );

select*from productlines;

create table products(
productCode varchar(15) primary key,
productName varchar(70) not null ,
productLine varchar(50) ,
productScale varchar(10) not null ,
productVendor varchar(50) not null ,
productDescription  text not null ,
quantityInStock smallint not null ,
buyPrice decimal(10,2) not null ,
MSRP decimal(10,2) not null ,
constraint fk_productline foreign key(productLine )
						references productlines(productLine)
);
select*from products;




create table employees (
employeeNumber int primary key,
lastName varchar(50) not null ,
firstName varchar(50) not null ,
extension varchar(10) not null ,
email varchar(100) not null,
officeCode varchar(10) ,
reportsTo int ,
jobTitle varchar(50) not null,
constraint fk_emplyoees foreign key(officeCode)
				references offices(officeCode)
);






create table offices(
officeCode varchar(10) primary key,
city varchar(50) not null ,
phone varchar(50) not null ,
addressLine1 varchar(50) not null ,
addressLine2 varchar(50),
state varchar(50),
country varchar(50) not null ,
postalCode varchar(15) not null ,
territory varchar(10) not null 
 );


create table customers (
customerNumber int primary key ,
customerName varchar(50) not null,
contactLastName varchar(50) not null ,
contactFirstName  varchar(50) not null ,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
state varchar(50),
postalCode varchar(15),
country varchar(50) not null ,
salesRepEmployeeNumber int ,
constraint fk_customers foreign key(salesRepEmployeeNumber)
				references employees(employeeNumber)
);

create table orders(
orderNumber int primary key,
orderDate date not null ,
requiredDate date not null ,
shippedDate date ,
status varchar(15) not null ,
comments text ,
customerNumber int ,
constraint fk_orders foreign key(customerNumber)
					references customers(customerNumber)
);


create table orderdetails(
orderNumber int ,
productCode varchar(15),
quantityOrdered int not null,
priceEach decimal(10,2) not null ,
orderLineNumber smallint not null,
constraint fk_orderdetails foreign key(orderNumber)
							references orders(orderNumber),
constraint fk_orderdetail foreign key(productCode)
							references products(productCode)
                            

);

create table payments(
customerNumber int ,
checkNumber varchar(50) primary key ,
paymentDate date not null ,
amount decimal(10,2) not null ,
constraint fk_payments foreign key(customerNumber)
						references customers(customerNumber)
);
