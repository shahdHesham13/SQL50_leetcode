-- Write your PostgreSQL query statement below
SELECT user_id, ROUND( CAST(confirmed AS Decimal) / CAST(total AS Decimal) ,2) AS confirmation_rate
FROM (
    SELECT Signups.user_id, COUNT(*) AS total, SUM(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed
    FROM Signups
    LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
    GROUP BY Signups.user_id  ) AS T1 ;
