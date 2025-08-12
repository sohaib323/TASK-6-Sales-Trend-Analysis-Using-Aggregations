TASK 6: Sales Trend Analysis Using Aggregations

select *from orders

select extract(month from order_date) as month ,sum(total_amount) as total_amount
from orders group by extract(month from order_date;

select sum(total_amount) as total_amount from orders where order_date = '2023-05-26';


1. Write a query to find the total revenue for each month in 2024, ordered from highest to lowest revenue.

select extract(month from order_date) as months ,sum(total_amount) as total_amount from orders
where extract(year from order_date) =2024
group by extract(month from order_date)
order by sum(total_amount) desc;


2. Retrieve the number of distinct orders (order_id) for each month of 2023, ordered chronologically.

select extract(month from order_date) as month_wise,count(distinct order_id) from orders
where extract(year from order_date) = 2023
group by extract(month from order_date);

3. For each year, calculate the total revenue and the total number of unique orders, sorted by year descending.

select extract(year from order_date)each_years,sum(total_amount) as total_revenue,
sum(distinct order_id)  as unique_order from orders
group by extract(year from order_date)
order by extract(year from order_date);

4. Find the top 3 months (across all years) with the highest revenue.

select extract(month from order_date)as month_wise,extract(year from order_date) as across_year,
sum(total_amount) as highest_revenue
from orders
group by extract(month from order_date),
extract(year from order_date)
order by sum(total_amount) desc limit 3;

5. List the months in 2024 where the total revenue exceeded 2000, ordered by month.

select extract(month from order_date) as months ,sum(total_amount) as total_revenue
from orders where extract(year from order_date) = 2024
group by extract(month from order_date)
having sum(total_amount) > 2000
order by months asc;

6. Retrieve the month and year with the highest number of unique orders.

select extract(month from order_date),extract(year from order_date), order_id from orders
order by order_id desc;


7. For 2023 only, display each month along with:
total revenue
number of distinct orders
Sort by revenue descending.

select extract(month from order_date) as month_wise ,
count(distinct order_id) as unique_order ,sum(total_amount)
as total_revenue
from orders
where extract(year from order_date) = 2023
group by extract(month from order_date)
order by sum(total_amount) desc;


8. Calculate revenue for each month of 2024, but only show months where more than 10 orders were placed.

select extract(month from order_date) as month_wise ,count(*) as order,sum(total_amount) as total_revenue
from orders where extract(year from order_date) = 2024
group by extract(month from order_date)
having count(*) > 10;

9. Show the year, month, total revenue, and order volume, but only for January and February across all years.

select extract(year from order_date) as year,extract(month from order_date)as month,
sum(total_amount) as total_revenue, count(order_id)as number_order from orders where extract(month from order_date) in (1,2)
group by extract(year from order_date),
extract(month from order_date)



10. Find the revenue growth from one month to the next in 2024.

SELECT 
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(total_amount) AS total_revenue,
  LAG(SUM(total_amount)) OVER (ORDER BY EXTRACT(MONTH FROM order_date)) AS previous_month_revenue,
  SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY EXTRACT(MONTH FROM order_date)) AS revenue_growth
FROM 
  orders
WHERE 
  EXTRACT(YEAR FROM order_date) = 2024
GROUP BY 
  EXTRACT(MONTH FROM order_date)
ORDER BY 
  month;

