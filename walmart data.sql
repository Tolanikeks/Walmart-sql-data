use walmart;

-- How many unique cities does the data have?
select count(distinct city) as unique_city from `walmartsalesdata.csv (2)`;

-- In which city is each branch?
select distinct branch,city from`walmartsalesdata.csv (2)`;

-- What is the most common payment method? 
select payment,count(*) as no_payment from `walmartsalesdata.csv (2)` group by payment limit 1;

--  What is the total revenue by month? 
select sum(Total) as Total from `walmartsalesdata.csv (2)`;

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM `walmartsalesdata.csv (2)`
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What month had the largest COGS? 
SELECT
     monthname(Date)  AS month,
    SUM(cogs) AS total_cogs
FROM
    `walmartsalesdata.csv (2)`
GROUP BY
    month
ORDER BY
    total_cogs DESC
LIMIT 1
;

-- Classify each transaction’s total sales as ‘High’, ‘Medium’, or ‘Low’ based on the amount spent

SELECT
    `Invoice ID`,
    `Customer type`,
    `Total`,
    CASE
        WHEN `Total` < 100 THEN 'Low'
        WHEN `Total` BETWEEN 100 AND 300 THEN 'Medium'
        ELSE 'High'
    END AS spending_category
FROM
    `walmartsalesdata.csv (2)`
ORDER BY
    `Total` DESC;

-- Which customer type pays the most in VAT?
SELECT
	`customer type`,
	sum(`Tax 5%`) AS total_tax
FROM `walmartsalesdata.csv (2)`
GROUP BY `customer type`
ORDER BY total_tax desc;

-- Which customer type buys the most?
SELECT `customer type`, count(*) as number_of_buyer FROM `walmartsalesdata.csv (2)`
GROUP BY `customer type`;

-- 
-- Which customer type pays the most in VAT?
SELECT
	`customer type`,
	AVG(`Tax 5%`) AS total_tax
FROM  `walmartsalesdata.csv (2)`
GROUP BY `customer type`
ORDER BY total_tax;