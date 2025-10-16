SELECT *
FROM retail_db.retailsale_sql

SELECT count(*) 
from retail_db.retailsale_sql --- 1987
SELECT count(distinct customer_id)
From retail_db.retailsale_sql --- 155
SELECT distinct category
From retail_db.retailsale_sql
SELECT *
FROM retail_db.retailsale_sql
WHERE
	sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL
DELETE FROM retail_db.retailsale_sql
WHERE
	sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL

SELECT *
FROM retail_db.retailsale_sql
WHERE sale_date= '11/5/2022'

/*Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022*/

SELECT *
FROM retail_db.retailsale_sql
WHERE category = 'Clothing' AND
	year (sale_date) = 2022 AND
    month (sale_date) = 11 AND
    quantiy >= 4 
    
/* Write a SQL query to calculate the total sales (total_sale) for each category */
SELECT category,
sum(total_sale) as total_sales
FROM retail_db.retailsale_sql
GROUP BY category


/*Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category */
SELECT
category,
round(avg(age),2) as average_age_of_customers
FROM retail_db.retailsale_sql
WHERE category = 'Beauty'


/*Write a SQL query to find all transactions where the total_sale is greater than 1000*/
SELECT *
FROM retail_db.retailsale_sql
WHERE total_sale >= 1000

/*Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category*/
SELECT gender, 
		category,
        count(transactions_id) as 'no of transactions'
FROM retail_db.retailsale_sql
GROUP BY gender,
		category
        

/*8. Write a SQL query to find the top 5 customers based on the highest total sales*/
SELECT customer_id,
sum(total_sale) as 'total_sale'
FROM retail_db.retailsale_sql 
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5

/*9. Write a SQL query to find the number of unique customers who purchased items from each category*/
SELECT category,
count(distinct customer_id) as 'no_of_unique_customers'
FROM retail_db.retailsale_sql
GROUP BY categoryretailsale_sql

/*10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)*/
With shift_table as (
SELECT *,
	CASE WHEN hour(sale_time) < 12 THEN 'Morning'
    WHEN hour(sale_time) < 17 then 'Afternoon'
    ELSE 'Evening'
    END as 'Shift'
FROM retail_db.retailsale_sql
) 
SELECT shift, 
count(transactions_id) as 'numbers_of_orders'
FROM shift_table
GROUP By shift





