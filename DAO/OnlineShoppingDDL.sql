
DROP PROCEDURE if EXISTS creatingTables;
DROP database IF EXISTS Customer;
DROP database IF EXISTS Sellers;
DROP database IF EXISTS Products;

delimiter $
create procedure creatingTables()
begin
	create DATABASE Customer;
	CREATE TABLE Customer.personal_details(
		customer_id int primary key, 
		first_name varchar(10), 
		last_name  varchar(10), 
		email  varchar(30) check(email like "%@%.%"),
		phone_number integer not null check (phone_number between 1000000000 and 9999999999), 
		pwd varchar(10)
		);	
	CREATE TABLE Customer.delivery_details(
		address_line1 varchar(50),
		address_line2 varchar(50), 
		landmark varchar(50), 
		city VARCHAR(10), 
		state varchar(10),
		country varchar(10),
		phone_number integer not null check (phone_number between 1000000000 and 9999999999)
		);
	CREATE TABLE Customer.payment_details(
		card_number int,
		card_type enum('credit','debit'), 
		expiry_date_MM_YY INTEGER
		);
	
	create database Sellers;
	create table Sellers.registration(
		first_name varchar(10),
		last_name varchar(10),
		email varchar(30),
		check(email like "%@%.%"), 
		phone integer not null check (phone between 1000000000 and 9999999999),
		business_identification_number int, 
		addres varchar(30), 
		type_of_contract enum('14','30')
	);
	create database Products;
	create table Products.prdt_details(
		prdt_id int AUTO_INCREMENT primary key, 
		prdt_name varchar(15),
		descriptions varchar(50),
		price float,
		merchant_id int
	);
	create table Products.inventory_details(
		prdt_id int,
		foreign key (prdt_id) REFERENCES  Products.prdt_details(prdt_id), 
		quantity int
	);
	create table Products.customer_reviews(
		prdt_id int,
		c_id int,
		foreign key (prdt_id) REFERENCES Products.prdt_details(prdt_id),
		foreign key (c_id) REFERENCES  Customer.personal_details(customer_id) ,
		review varchar(30),
		rating enum('1','2','3','4','5') 
	);

end $
delimiter ;
