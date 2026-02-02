CREATE DATABASE IF NOT EXISTS `pms`;
USE `pms`;

CREATE TABLE IF NOT EXISTS `staff`(
    pfno varchar(30) NOT NULL PRIMARY KEY,
    firstname varchar(100) NOT NULL, 
    lastname varchar(100) NOT NULL, 
    dob DATETIME NOT NULL,
    gender varchar(10) NOT NULL,
    nationalid int(30) NOT NULL UNIQUE,
    phone varchar(30), 
    email varchar(100),
    county varchar(100) NOT NULL, 
    location varchar(150),
    doe DATETIME NOT NULL,
    category varchar(100) NOT NULL,
    password varchar(100) NOT NULL, 
    photo BLOB 
);

CREATE TABLE IF NOT EXISTS `supplier`(
    id int(30) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) NOT NULL,
    phone varchar(30) NOT NULL,
    address varchar(100), 
    location varchar(200) NOT NULL,
    pfno varchar(30) NOT NULL, 
    registered_date DATETIME NOT NULL, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `drug`(
    id int(30) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) NOT NULL,
    form varchar(100) NOT NULL,
    price varchar(30),
    pfno varchar(100) NOT NULL, 
    registered_date DATETIME NOT NULL, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `stock`(
    id int(22) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    supplier_id int(22) NOT NULL,
    quantity varchar(100) NOT NULL,
    buying_price varchar(30) NOT NULL,
    selling_price varchar(30) NOT NULL,
    drug_id int(11) NOT NULL,
    units varchar(100) NOT NULL,
    expiry_date DATETIME NOT NULL,
    batch_no varchar(100) UNIQUE,
    pfno varchar(100) NOT NULL, 
    registered_date DATETIME NOT NULL, 
    FOREIGN KEY(supplier_id) REFERENCES supplier(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY(drug_id) REFERENCES drug(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `debtor`(
    id int(22) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) NOT NULL,
    drug_id int(100) NOT NULL,
    quantity varchar(20) NOT NULL,
    date_borrowed DATETIME NOT NULL,
    phone varchar(30) NOT NULL,
    deposit varchar(11) ,
    date_of_payment DATETIME ,
    pfno varchar(100) NOT NULL, 
    registered_date DATETIME NOT NULL,  
    FOREIGN KEY(drug_id) REFERENCES drug(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `net_stock`(
    id int(22) NOT NULL PRIMARY KEY,
    drug_id int(100) NOT NULL,
    drug_name varchar(150) NOT NULL, 
    quantity varchar(11) ,
    pfno varchar(100) NOT NULL,
    units varchar(20) NOT NULL,
    expiry_date DATETIME NOT NULL,  
    FOREIGN KEY(drug_id) REFERENCES drug(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `sales`(
    sales_id int(22) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cart_id int (33) NOT NULL,
    drug_name varchar(150) NOT NULL, 
    quantity varchar(11) NOT NULL,
    price varchar(20) NOT NULL,
    pfno varchar(100) NOT NULL, 
    sales_date DATETIME NOT NULL, 
    unit varchar(20) NOT NULL, 
    serial varchar(100) NOT NULL, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `cart`(
    cart_id int(22) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    drug_name varchar(150) NOT NULL, 
    quantity varchar(11) NOT NULL,
    price varchar(20) NOT NULL, 
    unit varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `events`(
    event_id int(33) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    pfno varchar(50) NOT NULL, 
    event_time DATETIME NOT NULL, 
    description varchar(200) NOT NULL, 
    FOREIGN KEY(pfno) REFERENCES staff(pfno) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert first user if not exists
INSERT INTO staff (pfno, firstname, lastname, dob, gender, nationalid, phone, email, county, location, doe, category, password, photo)
SELECT '3030', '22', '22', NOW(), '22', '22', '22', '22', '22', '22', NOW(), 'Manager', '3030', NULL
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM staff WHERE pfno = '3030');
