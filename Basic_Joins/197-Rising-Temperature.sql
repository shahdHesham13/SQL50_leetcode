-- Write your PostgreSQL query statement below
SELECT W1.Id
FROM Weather W1, Weather W2
WHERE W1.recordDate = W2.recordDate+1 AND W1.temperature > W2.temperature
