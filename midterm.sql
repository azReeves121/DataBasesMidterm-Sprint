CREATE TABLE Movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    director VARCHAR(255) NOT NULL
);

CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone TEXT NOT NULL
);

CREATE TABLE Rentals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    rental_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
);



-- Inserting Movies
INSERT INTO Movies (title, release_year, genre, director) VALUES
('Interstellar', 2014, 'Science Fiction', 'Christopher Nolan'),
('The Matrix', 1999, 'Action', 'Lana Wachowski, Lilly Wachowski'),
('Forrest Gump', 1994, 'Drama', 'Robert Zemeckis'),
('The Silence of the Lambs', 1991, 'Thriller', 'Jonathan Demme'),
('Gladiator', 2000, 'Action', 'Ridley Scott');

-- Inserting Customers
INSERT INTO Customers (first_name, last_name, email, phone) VALUES
('Emily', 'Davis', 'emily.davis@example.com', '321-654-0987'),
('Michael', 'Brown', 'michael.brown@example.com', '654-321-7890'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '789-123-4560'),
('David', 'Martinez', 'david.martinez@example.com', '456-789-1230'),
('Laura', 'Taylor', 'laura.taylor@example.com', '890-123-4567');

-- Inserting Rentals
INSERT INTO Rentals (customer_id, movie_id, rental_date, return_date) VALUES
(1, 1, '2024-10-15', '2024-10-22'),
(2, 2, '2024-10-16', NULL),
(3, 3, '2024-10-17', '2024-10-24'),
(4, 4, '2024-10-18', '2024-10-25'),
(5, 5, '2024-10-19', '2024-10-26'),
(1, 2, '2024-10-20', NULL),
(2, 3, '2024-10-21', NULL),
(3, 4, '2024-10-22', '2024-10-29'),
(4, 5, '2024-10-23', NULL),
(5, 1, '2024-10-24', '2024-10-31');

--  Queries 
SELECT M.title, R.rental_date, R.return_date
FROM Rentals R
JOIN Customers C ON R.customer_id = C.id
JOIN Movies M ON R.movie_id = M.id
WHERE C.email = 'emily.davis@example.com';

SELECT C.first_name, C.last_name, R.rental_date
FROM Rentals R
JOIN Movies M ON R.movie_id = M.id
JOIN Customers C ON R.customer_id = C.id
WHERE M.title = 'Interstellar';

SELECT C.first_name, C.last_name, R.rental_date, R.return_date
FROM Rentals R
JOIN Movies M ON R.movie_id = M.id
JOIN Customers C ON R.customer_id = C.id
WHERE M.title = 'The Matrix';

SELECT C.first_name, C.last_name, R.rental_date, M.title
FROM Rentals R
JOIN Movies M ON R.movie_id = M.id
JOIN Customers C ON R.customer_id = C.id
WHERE M.director = 'Christopher Nolan';


SELECT M.title, C.first_name, C.last_name, R.rental_date
FROM Rentals R
JOIN Movies M ON R.movie_id = M.id
JOIN Customers C ON R.customer_id = C.id
WHERE R.return_date IS NULL;
