SELECT * FROM retail_project.retail_sales;
-- how many sales we have?
select count(*) as total_sales from retail_project.retail_sales;
-- how many customers we have?
select count(distinct customer_id ) as total_customers from retail_project.retail_sales;
-- total no of categories 
select count(distinct category) as total_category from retail_project.retail_sales;
-- My Analysis & Findings

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'.
select * from retail_project.retail_sales
where sale_date="2022-11-05";

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing'
--     and the quantity sold is more than 10 in the month of Nov-2022.
select * from retail_project.retail_sales
where category="Clothing" and quantity >10 and month(sale_date)= 11 and year(sale_date)=2022;

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category.
select category,sum(total_sale) from retail_project.retail_sales
group by category;
-- Q4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) from retail_project.retail_sales
where category="Beauty";
-- Q5. Write a SQL query to find all transactions where the total_sale is greater than 1000.
select count(*) from retail_project.retail_sales
where total_sale >1000;
-- Q6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category,gender,count(transactions_id) from retail_project.retail_sales
group by category,gender;
-- Q7. Write a SQL query to calculate the average sale for each month. Find out the best selling month in each year.
select * from (
select year(sale_date) as year,month(sale_date) as month,avg(total_sale),
rank() over(partition by year(sale_date) order  by avg(total_sale) desc) as rnk
from retail_project.retail_sales
group by year(sale_date) ,month(sale_date)
order by year(sale_date),month(sale_date)
) as t
where rnk=1
order by year;

-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales.
select * from retail_project.retail_sales
order by total_sale desc
limit 5;
-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(distinct customer_id) from retail_project.retail_sales
group by category;
-- Q10. Write a SQL query to create each shift and number of orders (Example: Morning <= 12, Afternoon Between 12 & 17, Evening > 17).
select 
case
when hour(sale_time)<="12:00:00" then 'Morning'
when hour(sale_time) between "12:00:00" and "17:00:00" then 'Afternoon'
else 'Evening'
end as shift,count(*) from retail_project.retail_sales
group by shift
order by shift;

