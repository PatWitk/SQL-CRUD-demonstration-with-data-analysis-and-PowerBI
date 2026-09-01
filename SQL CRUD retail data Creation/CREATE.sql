/* 
In this file I create the necessary tables and their foreign key relationsips. 
MANY branches will be able to sell MANY products at different prices so a MANY-TO-MANY relationship is made in the 'product_price' table 
'price' will be shown in pence to avoid the need for decimal points
*/

CREATE TABLE regions (
    region_code TEXT PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    signup_date DATE NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE branches (
    branch_id INTEGER PRIMARY KEY,
    branch_name TEXT NOT NULL,
    region_code TEXT NOT NULL,
    FOREIGN KEY (region_code) REFERENCES regions(region_code)
);

CREATE TABLE product_price(
    product_id INTEGER NOT NULL,
    branch_id INTEGER NOT NULL,
    unit_price INTEGER NOT NULL,
    PRIMARY KEY (product_id, branch_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    branch_id INTEGER NOT NULL,
    date DATE NOT NULL,
    quantity INTEGER NOT NULL,
    payment_type TEXT NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);
