
UPDATE products
SET category = 'Dry Shampoo'
WHERE product_name LIKE '%- dry' AND category = 'Shampoo';
/* Dry shampoos were previously identified with 'dry' at the end of product name, now they are given a 'Dry Shampoo' category */

UPDATE orders
SET payment_type = 'Gpay'
WHERE payment_type = 'mobile';

DELETE FROM orders
WHERE completed = 0;
/* Delete orders that weren't 'completed', ones that failed etc */


/* This SELECT command lets us acquire the full orders table with an ADDITIONAL COLUMN that calculates the value of each order once extracting the product/branch price
This is used in the Power BI visualisation */
SELECT order_id, customer_id, orders.product_id, orders.branch_id, date, quantity, payment_type, (quantity*unit_price) AS order_value
FROM orders
JOIN product_price ON
    (orders.product_id, orders.branch_id) =
    (product_price.product_id, product_price.branch_id)
ORDER BY order_id;