# Write your MySQL query statement below
WITH cte AS
(SELECT p.product_id, p.new_price AS price, RANK() OVER (PARTITION BY p.product_id ORDER BY p.change_date DESC) as rk
FROM Products p
WHERE change_date <= '2019-08-16')

SELECT product_id, price FROM cte WHERE rk = 1

UNION
SELECT p.product_id, 10 AS price
FROM Products p
WHERE p.product_id NOT IN
(SELECT product_id FROM Products WHERE change_date <= '2019-08-16')