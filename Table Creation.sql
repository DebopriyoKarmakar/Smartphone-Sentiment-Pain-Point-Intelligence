CREATE DATABASE smartphone_sentiment;
USE smartphone_sentiment;
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(100),
    price_usd DECIMAL(10,2),
    rating INT,
    review_text TEXT,
    sentiment VARCHAR(20),
    vader_compound DECIMAL(5,4),
    vader_sentiment VARCHAR(20),
    country VARCHAR(50),
    review_date DATE,
    source VARCHAR(50),
    battery_life_rating INT,
    camera_rating INT,
    performance_rating INT,
    design_rating INT,
    display_rating INT
);
CREATE TABLE pain_points (
    review_id INT,
    category VARCHAR(50),
    FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);