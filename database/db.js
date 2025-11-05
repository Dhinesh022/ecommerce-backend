const mysql = require('mysql2');

const db = mysql.createConnection({
  host: '10.0.15.207',      // ✅ DB private IP
  user: 'ecom_user',        // ✅ MySQL username
  password: 'strongpassword', // ✅ your real MySQL password
  database: 'ecommerce_db'  // ✅ database name
});

module.exports = db;
