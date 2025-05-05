create database walmart;
use walmart;

select * from sales;
-- --------------------------------------------------------------------
-- ---------------------------- Generic ------------------------------
-- --------------------------------------------------------------------
-- How many unique cities does the data have?
select distinct city from sales;

-- In which city is each branch?
select city,branch from sales;
-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------
-- How many unique product lines does the data have?
select payment,count(payment) as p from sales group by payment order by p desc ;
-- What is the most selling product line
select  product_line,sum(unit_price*quantity) as sale from sales group by product_line order by sale desc;
-- What is the total revenue by month
select month_name,sum(total) as total_revenue from sales group by month_name;
-- What month had the largest COGS?
select month_name,sum(cogs) as sum_cog from sales group by month_name order by sum_cog desc limit 1;
-- What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
-- What is the average rating of each product line?
select product_line,avg(rating) as avg_rate from sales group by product_line;

-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- What is the city with the largest revenue?
select city,sum(total) as total_revenue from sales group by city order by total_revenue desc;


-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales
select product_line,case when  sum(product_line)>avg(total) then 'good' else 'bad' end as remark from sales  group by product_line


-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


-- What is the most common product line by gender
select product_line,gender,count(gender) as gen from sales group by gender,product_line order by gen desc;


-- Which of the customer types brings the most revenue?
select customer_type,sum(total) as revenue from sales group by customer_type;


-- What is the average rating of each product line
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;
select customer_type,avg(tax_pct) from sales group by customer_type;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;

-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
select customer_type,count(quantity) from sales group by customer_type;

-- What is the gender of most of the customers?
select gender,count(gender) from sales group by gender;

-- What is the gender distribution per branch?
select branch,count(gender) as gender from sales group by branch;

-- Which day fo the week has the best avg ratings?
select day_name,avg(rating) as rating from sales group by day_name order by rating desc;

-- Which day of the week has the best average ratings per branch?
select branch,avg(rating) as rating from sales group by branch order by rating desc;

