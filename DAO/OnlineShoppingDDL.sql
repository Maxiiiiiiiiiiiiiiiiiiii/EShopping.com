
DROP PROCEDURE if EXISTS creatingTables;
delimiter $
create procedure creatingTables()
begin
	create DATABASE Customer;
	CREATE TABLE Customer.personal_details(
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
end $
delimiter ;
