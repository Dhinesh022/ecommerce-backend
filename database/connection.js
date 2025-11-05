const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: "10.0.15.207",
    user: "ecom_user",
    password: "strongpassword",
    database: "ecommerce_db"
});

connection.connect((err) => {
    if (err) {
        console.error("❌ Database connection failed:");
        console.error(err);
        return;
    }
    console.log("✅ Connected to MySQL database successfully!");
});

module.exports = connection;
