-- Make sure you're in the right database
USE smartphone_sentiment;

-- Query 1: Sentiment distribution by brand
SELECT brand, sentiment, COUNT(*) as cnt,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY brand), 1) as pct
FROM reviews 
GROUP BY brand, sentiment 
ORDER BY brand;

-- Query 2: Top pain points overall
SELECT category, COUNT(*) as mentions
FROM pain_points 
GROUP BY category 
ORDER BY mentions DESC;

-- Query 3: Pain points broken down by brand
SELECT r.brand, p.category, COUNT(*) as mentions
FROM pain_points p 
JOIN reviews r ON p.review_id = r.review_id
GROUP BY r.brand, p.category 
ORDER BY r.brand, mentions DESC;

-- Query 4: Sub-rating comparison across brands
SELECT brand, 
       ROUND(AVG(battery_life_rating),2) as battery,
       ROUND(AVG(camera_rating),2) as camera,
       ROUND(AVG(performance_rating),2) as performance,
       ROUND(AVG(design_rating),2) as design,
       ROUND(AVG(display_rating),2) as display
FROM reviews 
GROUP BY brand;

-- Query 5: India-specific sentiment
SELECT brand, sentiment, COUNT(*) as cnt
FROM reviews 
WHERE country = 'India'
GROUP BY brand, sentiment 
ORDER BY brand;