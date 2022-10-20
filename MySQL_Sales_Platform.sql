
/**
 * Sales platform.
 * MySQL language. 
 * 
 */


DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS product_groups;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_products;
SHOW tables;

SET FOREIGN_KEY_CHECKS = 0;
truncate customers;
truncate suppliers;
truncate shippers;
truncate employees;
truncate product_groups;
truncate products;
truncate orders;
truncate order_products;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS customers(
	customer_id integer AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL CHECK(name != ''),
	phone varchar(255) UNIQUE NOT NULL CHECK(phone != ''),
	email varchar(255) UNIQUE NOT NULL CHECK(email LIKE '%@%.%'),
	address varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS suppliers(
	supplier_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	phone varchar(50) NOT NULL UNIQUE CHECK(phone LIKE '+%'),
	email varchar(50) NOT NULL UNIQUE CHECK(email LIKE '%@%.%'),
	address varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS shippers(
	shipper_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	phone varchar(50) NOT NULL UNIQUE CHECK(phone LIKE '+%' AND phone !=''),
	email varchar(50) NOT NULL UNIQUE CHECK(email LIKE '%@%.%'),
	address varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees(
	employee_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	birth_day date NOT NULL,
	salary decimal NOT NULL DEFAULT 350,
	phone varchar(50) NOT NULL UNIQUE CHECK(phone LIKE '+%' AND phone !=''),
	email varchar(50) NOT NULL UNIQUE CHECK(email LIKE '%@%.%'),
	address varchar(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS product_groups(
	product_group_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(255) NOT NULL 
);

CREATE TABLE IF NOT EXISTS products (
	product_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	price decimal NOT NULL,	
	product_group int NOT NULL,
	supplier_id int NOT NULL,
	FOREIGN KEY (product_group) REFERENCES product_groups(product_group_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
	order_id integer AUTO_INCREMENT,
	customer_id integer NOT NULL,
	shipper_id integer NOT NULL,
	employee_id integer NOT NULL,
	create_date timestamp NOT NULL,
	CONSTRAINT oredr_id_pk PRIMARY KEY (order_id),
	CONSTRAINT employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT shippers_id_fk FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS order_products (
	order_product_id integer AUTO_INCREMENT,
	order_id integer NOT NULL,
	product_id integer NOT NULL,
	product_count integer NOT NULL,
	PRIMARY KEY (order_product_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO customers (name,phone,email,address)
VALUES 	('Leonid','+74952356575','leonid@mail.ru','Belorussia, Minsk'),
		('Avgust','+74961278999','avg@gmail.com','Russia, Petropavlovsk');
	
INSERT INTO suppliers(name,phone,email,address)
VALUES 	('Belzibuba','+985-251-863','belz@gmail.com','Tanzania, city'),
		('Li Huan U','+521-654-2214','li_huan@china.ch','Taivan, city'),
		('Ortbojard','+789-15-541-5','otbojard@mail.kz','Kazahstan, Almati'),
		('Pan Ljah','+521-59-1254','pan_pol@mail.pol','Polsha, city');
	
INSERT INTO employees (name, birth_day, salary, phone, email, address)
VALUES 	('Rublev', '1992-01-11', 300, '+7985316546','rub@mail.com','Moscow'),
		('Kopeev', '1985-10-16', 320,'+985465545','kop@gmail.com','St.Pitersburg'),
		('Dollarov', '1978-07-30', 360,'+7556465411','dol@mail.su','Frankfurt');
	
INSERT INTO shippers(name,phone,email,address)
VALUES 	('Logistik_Group','+323423411','log@gmail.com','Russia, city'),
		('RZD_group','+12352541','RZD_G@mail.ru','Russia, city');
	
INSERT INTO product_groups(name, description) 	
VALUES 	('Vegetables','Vegetables, Salats, Roots'),
		('Fruits','Tree fruits & Grass fruits');

INSERT INTO products (name, price, product_group, supplier_id)
VALUES 	('Banana',25900,2,1),
		('Orange',46800,2,2),
		('Apple',19900,2,4),
		('Tomato',16990,1,2),
		('Potato',15990,1,3);

INSERT INTO orders (order_id, customer_id, create_date, shipper_id, employee_id)
VALUES 	(1,1,now(),1,1),
		(2,1,now(),1,2),
		(3,2,now(),2,3);
	
INSERT INTO order_products(order_id, product_id, product_count) 	
VALUES 	(1,1,2),(1,2,1),(1,3,1),(1,4,1),
		(2,5,4),(2,4,1),(2,3,1),
		(3,5,2),(3,1,1);
		
SELECT * FROM customers;
SELECT * FROM suppliers;
SELECT * FROM shippers;
SELECT * FROM employees;
SELECT * FROM product_groups;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_products;
	
SHOW COLUMNS FROM products;
SHOW COLUMNS FROM orders;

	
	
	
	
	
	
	

