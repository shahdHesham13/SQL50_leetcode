SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y' or employee_id IN 
(SELECT employee_id FROM employee GROUP BY employee_id
HAVING COUNT(*) = 1)