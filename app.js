const mysql = require("mysql2");
const { program } = require("commander");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Reeves1212@",
  database: "midtermdb",
});

connection.connect((err) => {
  if (err) {
    console.error("Error connecting to the database:", err.stack);
    return;
  }
  console.log("Connected to the database.");
});

function createTables() {
  const createMoviesTable = `CREATE TABLE IF NOT EXISTS Movies (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        release_year INT NOT NULL,
        genre VARCHAR(100) NOT NULL,
        director VARCHAR(255) NOT NULL
    );`;

  const createCustomersTable = `CREATE TABLE IF NOT EXISTS Customers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        phone TEXT NOT NULL
    );`;

  const createRentalsTable = `CREATE TABLE IF NOT EXISTS Rentals (
        id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT,
        movie_id INT,
        rental_date DATE NOT NULL,
        return_date DATE,
        FOREIGN KEY (customer_id) REFERENCES Customers(id),
        FOREIGN KEY (movie_id) REFERENCES Movies(id)
    );`;

  connection.query(createMoviesTable, (err, results) => {
    if (err) throw err;
    console.log("Movies table created or already exists.");
  });
  connection.query(createCustomersTable, (err, results) => {
    if (err) throw err;
    console.log("Customers table created or already exists.");
  });
  connection.query(createRentalsTable, (err, results) => {
    if (err) throw err;
    console.log("Rentals table created or already exists.");
  });
}
