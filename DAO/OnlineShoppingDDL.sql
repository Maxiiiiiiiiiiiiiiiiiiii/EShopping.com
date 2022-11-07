
DROP PROCEDURE if EXISTS pro1;
delimiter $
create procedure pro1()
begin
#	create DATABASE Customer;
	
	CREATE TABLE personal_details(first_name varchar(10), last_name  varchar(10), email  varchar(30) check(email like "%@%.%"),  phone_number integer not null check (phone_number between 1000000000 and 9999999999), password varchar(10));
#	CREATE TABLE delivery_details(address_line1 varchar(50), address_line2(50), landmark varchar(50), city VARCHAR(10), state varchar(10),country varchar(10),phone_number integer not null check (phone_number between 1000000000 and 9999999999));
	CREATE TABLE payment_details(card_number integer not null check (card_number between 1000000000000000 and 9999999999999999), card_type enum("credit","debit"), expiry_date_MM_YY INTEGER check (expiry_date between 1000 and 9999));
end $
delimiter ;
