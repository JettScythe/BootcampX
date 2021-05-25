SELECT name, count(assistance_requests.*) as total_assistances 
FROM students
JOIN assistance_requests on students.id = assistance_requests.student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;