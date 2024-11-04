CREATE TABLE Movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR NOT NULL,
    director VARCHAR NOT NULL
);

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    phone TEXT NOT NULL
);

CREATE TABLE Rentals (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(id) ON DELETE CASCADE,
    movie_id INT REFERENCES Movies(id) ON DELETE CASCADE,
    rental_date DATE NOT NULL,
    return_date DATE
);
