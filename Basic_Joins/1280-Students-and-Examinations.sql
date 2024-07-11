-- Write your PostgreSQL query statement below
SELECT a.student_id ,a.student_name , a.subject_name
,COUNT(Examinations.subject_name) AS attended_exams
FROM
(SELECT * FROM Students, Subjects
ORDER BY Students.student_id , Subjects.subject_name ) AS a

LEFT JOIN Examinations ON Examinations.student_id = a.student_id AND Examinations.subject_name = a.subject_name

GROUP BY a.student_id ,a.student_name , a.subject_name

ORDER BY a.student_id ,a.subject_name
