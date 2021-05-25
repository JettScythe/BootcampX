SELECT name, count(assistance_requests.*) as total_assistances 
FROM teachers 
JOIN assistance_requests on teachers.id = assistance_requests.teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;