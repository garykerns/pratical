CREATE DATABASE IF NOT EXISTS social_app;
USE social_app;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, -- Ensure emails are unique
    password_hash VARCHAR(255) NOT NULL, -- Store the hashed password
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Track when the user signed up
);

CREATE INDEX idx_email ON users(email);


CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, -- Added UNIQUE constraint to category names
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL -- Or ON DELETE CASCADE, ON DELETE RESTRICT, etc.
);
