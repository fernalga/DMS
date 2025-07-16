CREATE TABLE IF NOT EXISTS team7_orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES team7_customers(id),
    flower_id INT REFERENCES team7_flowers(id),
    order_date DATE
);

INSERT INTO team7_orders (customer_id, flower_id, order_date) 
VALUES 
