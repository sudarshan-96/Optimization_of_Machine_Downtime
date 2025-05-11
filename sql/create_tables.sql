CREATE TABLE machine_data (
    machine_id INT PRIMARY KEY,
    timestamp DATETIME,
    temperature FLOAT,
    pressure FLOAT,
    status VARCHAR(50)
);