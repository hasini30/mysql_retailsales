# Retail Sales Analysis — SQL Project
**Project Title:** Retail Sales Analysis  
**Domain:** Retail & Business Analytics  
**Tools Used:** MySQL, Excel  


## 🧾 Overview

This project showcases end-to-end SQL skills for retail sales analytics — including database exploration, cleaning, business queries, and insight generation. It simulates a real retail analytics task commonly seen in data analyst roles.

The focus is on answering business questions such as:

* Who are the best customers?
* Which categories perform well?
* What time shifts drive most orders?
* Which months perform best?

---

## 🎯 Objectives

1. **Database Exploration** — understand the dataset (size, categories, customers)
2. **Data Cleaning** — identify and remove missing values
3. **Exploratory Analysis** — uncover patterns, trends & customer behavior
4. **Business-Driven Queries** — generate insights through SQL

---

## 🗄 Database

Retail sales data stored in the table:

```sql
SELECT * FROM retail_project.retail_sales;
```

Columns include:
`transactions_id`, `sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`.

---

## 🔍 Data Exploration

### Total Sales Records

```sql
select count(*) as total_sales 
from retail_project.retail_sales;
```

### Unique Customers

```sql
select count(distinct customer_id) as total_customers
from retail_project.retail_sales;
```

### Total Product Categories

```sql
select count(distinct category) as total_category
from retail_project.retail_sales;
```

---

## 🧠 Business Analysis & Findings

### **Q1. Retrieve sales made on '2022-11-05'**

```sql
select * from retail_project.retail_sales
where sale_date="2022-11-05";
```

---

### **Q2. Clothing category, quantity > 10, in Nov-2022**

```sql
select * from retail_project.retail_sales
where category="Clothing" 
  and quantity >10 
  and month(sale_date)=11 
  and year(sale_date)=2022;
```

---

### **Q3. Total sales per category**

```sql
select category, sum(total_sale)
from retail_project.retail_sales
group by category;
```

---

### **Q4. Average age of customers buying Beauty products**

```sql
select avg(age)
from retail_project.retail_sales
where category="Beauty";
```

---

### **Q5. Transactions where total_sale > 1000**

```sql
select count(*)
from retail_project.retail_sales
where total_sale >1000;
```

---

### **Q6. Total transactions by category & gender**

```sql
select category, gender, count(transactions_id)
from retail_project.retail_sales
group by category, gender;
```

---

### **Q7. Best selling month (Avg sale per month, ranked by year)**

```sql
select * from (
    select year(sale_date) as year,
           month(sale_date) as month,
           avg(total_sale),
           rank() over(partition by year(sale_date) order by avg(total_sale) desc) as rnk
    from retail_project.retail_sales
    group by year(sale_date), month(sale_date)
    order by year(sale_date), month(sale_date)
) as t
where rnk=1
order by year;
```

---

### **Q8. Top 5 customers by total sale**

```sql
select * 
from retail_project.retail_sales
order by total_sale desc
limit 5;
```

---

### **Q9. Unique customers per category**

```sql
select category, count(distinct customer_id)
from retail_project.retail_sales
group by category;
```

---

### **Q10. Orders by time shift (Morning, Afternoon, Evening)**

```sql
select 
case
    when hour(sale_time)<="12:00:00" then 'Morning'
    when hour(sale_time) between "12:00:00" and "17:00:00" then 'Afternoon'
    else 'Evening'
end as shift,
count(*) 
from retail_project.retail_sales
group by shift
order by shift;
```

---

## 📊 Key Insights

* **Customer Behavior**: Beauty category skews toward a younger demographic.
* **High-Value Purchases**: Several purchases exceeded ₹1000.
* **Seasonality & Peaks**: Best-selling months vary by year.
* **Category Performance**: Clothing & Beauty emerge as strong revenue generators.
* **Shift Analysis**: Different time windows show varying order densities.
* **Customer Value**: Small group of buyers contribute to high sales volume.

---

## 🏁 Conclusion

This project demonstrates SQL capabilities across:

✔ Data exploration
✔ Cleaning & filtering
✔ Grouping & aggregation
✔ Window functions & ranking
✔ Business-focused insights

Such analytical workflows are foundational for data analyst roles in retail, e-commerce, fintech, and customer analytics.

---


## 👤 Author

**Hasini **

Aspiring Data Analyst with interest in SQL, Analytics, and Business Intelligence.
📧 Gmail:nadellahasini@gmail.com
🔗 LinkedIn:www.linkedin.com/in/hasini-nadella30
