
                                  -- count(assignment_submissions.*) shows > 1000000? ASK ABOUT ME
SELECT cohorts.name as cohort_name, count(students.name) as total_submissions
FROM cohorts 
JOIN students 
ON cohorts.id = students.cohort_id
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
GROUP BY cohort_name
ORDER BY total_submissions DESC;

-- SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;