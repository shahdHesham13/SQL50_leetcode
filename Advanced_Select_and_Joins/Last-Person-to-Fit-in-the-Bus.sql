-- Write your PostgreSQL query statement below
SELECT person_name FROM
(SELECT person_id, person_name, weight, turn, SUM(weight) OVER(ORDER BY turn) AS totalWeight
FROM Queue) tw
WHERE totalWeight <= 1000
ORDER BY totalWeight desc
LIMIT 1