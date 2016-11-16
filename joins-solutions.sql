-- 0. Get all the users
SELECT * FROM customers;

--Get all customers and their addresses.
SELECT *
FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

--Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items ON orders.id = line_items.order_id;

--Which warehouses have cheetos?
SELECT warehouse
FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos'
;

--Which warehouses have diet pepsi?
SELECT warehouse
FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi'
;

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT (customers.first_name, customers.last_name, COUNT(orders.id))
FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON orders.address_id = addresses.id
GROUP BY customers.id;

--How many customers do we have?
SELECT COUNT(DISTINCT id)
FROM customers;

SELECT COUNT(*)
FROM customers;

--How many products do we carry?
SELECT COUNT(*)
FROM products;


--What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand)
FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
;
