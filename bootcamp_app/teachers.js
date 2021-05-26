const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);

const queryStr = `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohorts
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name;`;

pool.query(queryStr, [`%${args[0]}%`])
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohorts}: ${row.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));