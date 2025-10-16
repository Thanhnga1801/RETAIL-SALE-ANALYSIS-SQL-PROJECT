# RETAIL-SALE-ANALYSIS-SQL-PROJECT
**Project overview**
Project title: Retail Sales Analysis

**PROJECT STRUCTURE**
**1. Database setup**
- **Database:** The project start by creating a database named `retail_db`
- **Table:** A table named `retailsale_sql` is created data with main columns: transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), total sale amount.

**2. Data exploration & cleaning**
- **Record count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

**3. Data analysis and findings**
**1. _Write a SQL query to retrieve all columns for sales made on '2022-11-05:_**
```
SELECT *
FROM retail_db.retailsale_sql
WHERE sale_date= '11/5/2022'
```
**2. _Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022_**
```
SELECT *
FROM retail_sales
WHERE
  category = 'Clothing' AND
  FORMAT(sale_date, 'YYYY-MM') = '2022-11' AND
  quantity >= 4
```
**3. _Write a SQL query to calculate the total sales (total_sale) for each category_**
  ```
  SELECT category,
          sum(total_sale) as total_sales
  FROM retail_db.retailsale_sql
  GROUP BY category
  ```
**4. _Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category_**
  ```
  SELECT category,
  round(avg(age),2) as average_age_of_customers
  FROM retail_db.retailsale_sql
  WHERE category = 'Beauty'
  ```
**5. _Write a SQL query to find all transactions where the total_sale is greater than 1000_**
  ```
SELECT *
FROM retail_db.retailsale_sql
WHERE total_sale >= 1000
  ```

_**6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category**_
```
SELECT gender,
      category,
      count(transactions_id) as 'no of transactions'
FROM retail_db.retailsale_sql
GROUP BY gender,
        category
```
_**7. Write a SQL query to find the top 5 customers based on the highest total sales**_
```
SELECT customer_id,
sum(total_sale) as 'total_sale'
FROM retail_db.retailsale_sql 
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5
```
_**8. Write a SQL query to find the number of unique customers who purchased items from each category**_
```
SELECT category,
count(distinct customer_id) as 'no_of_unique_customers'
FROM retail_db.retailsale_sql
GROUP BY category
```
_**9. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**_
```
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
```

**FINDINGS**
1. **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
2. **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
3. **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
4. **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

