use SDAPROJECT;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY auto_increment,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    cnic CHAR(13),
    password VARCHAR(255)
);
drop table Customer;
select* from Customer;

CREATE TABLE Manager (
    manager_id INT PRIMARY KEY auto_increment,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    cnic CHAR(13), 
    password VARCHAR(255),
    store_location VARCHAR(255)
);
drop table Manager;
select* from Manager;

CREATE TABLE Admin (
    Admin_id INT PRIMARY KEY auto_increment,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    cnic CHAR(13),
    password VARCHAR(255)
);
select * from Admin;
drop table Admin;
INSERT INTO admin (name, email, address, cnic, password)
VALUES ('Alian', 'alyan727@gmail.com', 'Rawalpindi', '1234567890123', 'Alyan@072');

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    feedback_text TEXT,
    feedback_reply TEXT DEFAULT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
drop table feedback;
select* from feedback;

CREATE TABLE Store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(255),
    store_location VARCHAR(255),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Manager(manager_id)
);
drop table Store;
select * from Store;

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    product_description TEXT,
    price DECIMAL(10, 2) 
);
drop table Product;
INSERT INTO Product (product_name, product_description, price)
VALUES
    ('Sugar', 'Description for Product', 19.99),
    ('Milk', 'Description for Product', 29.99),
    ('Yogurt', 'Description for Product', 9.99),
    ('Soda', 'Description for Product', 39.99);
    
select* from Product;

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Cart (customer_id) VALUES (1);
drop table Cart;
select* from Cart;

CREATE TABLE CartProduct (
    cart_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
drop table CartProduct;
select* from CartProduct;

CREATE TABLE ProductCatalog (
    catalog_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT UNIQUE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    category VARCHAR(50),
    manufacturer VARCHAR(100)
);
drop table ProductCatalog;
select* from ProductCatalog;

INSERT INTO ProductCatalog (product_id, category, manufacturer)
VALUES (1, 'Dairy', 'Olpers');

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);
drop table Inventory;
select* from Inventory;

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    Amount INT,
    TotalBill INT,
    CustomerID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(customer_id)
);

drop table Payments;
select* from Payments;

CREATE TABLE BankAccount (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Balance INT,
    CardNumber VARCHAR(16), 
    AccountType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(customer_id)
);
drop table BankAccount;
INSERT INTO BankAccount (CustomerID, Balance, CardNumber, AccountType) VALUES (1, 100000, '1234567890123456', 'Savings');

select* from BankAccount; 





