
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


/*--- MOST INTERESTING PART OF THE CODE ---*/
WITH customer_order_summary AS (
    SELECT orders.customer_id, 
        COUNT(orders.order_id) AS orders_made,
        SUM(orders.quantity*product_price.unit_price) AS
        total_spent
    FROM orders
    JOIN product_price ON 
        (orders.product_id, orders.branch_id) =
        (product_price.product_id, product_price.branch_id)
    GROUP BY orders.customer_id
    HAVING COUNT(order_id) > 3
    )

SELECT customers.username,customer_order_summary.orders_made,
    customer_order_summary.total_spent,
    CASE
        WHEN customer_order_summary.total_spent > 136000 THEN 'High value'
        ELSE 'Medium value'
    END AS customer_tier
FROM customer_order_summary
JOIN customers ON customers.customer_id = customer_order_summary.customer_id
ORDER BY customer_order_summary.total_spent DESC;
/* In this SELECT sequence I use a CTE to make a temporary table using SUM and COUNT to get sales information on different customers.
Prices of products vary per branch so our CTE is JOINed to the product_price table which takes a composite key of product_id and branch_id.
Once we have our CTE made we SELECT the information from it and use a CASE WHEN function to label customer loyalty based on spending habits.
WORTH NOTING, that prices/expenses here are shown in pence not pounds. */


/* This SELECT command lets us acquire the full orders table with an ADDITIONAL COLUMN that calculates the value of each order once extracting the product/branch price */
SELECT order_id, customer_id, orders.product_id, orders.branch_id, date, quantity, payment_type, (quantity*unit_price) AS order_value
FROM orders
JOIN product_price ON
    (orders.product_id, orders.branch_id) =
    (product_price.product_id, product_price.branch_id)
ORDER BY order_id;