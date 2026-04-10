drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC(5,2),
availableQuantityPrice NUMERIC (8,2),
discountedSellingPrice Numeric(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- DATA EXPLORATION
--Count of Rows
select count(*) from zepto;

--Data
select * FROM zepto
LIMIT 10;

--Null Values
select * from zepto
where name is NULL
or 
category is NULL
or  
mrp is NULL
or
discountPercent is NULL
or
availableQuantityPrice is NULL
or
discountedSellingPrice is NULL
or
weightInGms is NULL
or
outOfStock is NULL
or 
quantity is NULL;

-- Explorind different products categories
select distinct category
from zepto
order by category;

-- How many products are INSTOCK and OUTOFSTOCK
select outOfStock, count(sku_id)
from zepto
group by outOfStock;

--Products name that is present multiple times
select name, count(sku_id) as "Number of SKS"
FROM zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;


--DATA CLEANING
-- Products that have price = 0
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0;

--Coverting PAISE to RUPEES
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto;

--Q1 Find the top 10 best value products based on the discount percentage
select distinct name, mrp, discountPercent
from zepto order by discountPercent desc
limit 10;

--Q2 What are the products with high MRP but OUTOFSTOCK
select distinct name, mrp
from zepto where outOfStock = True and mrp > 300
order by mrp desc;

--Q3 Calculate estimated revenue for each category
select category,
sum(discountedSellingPrice * availableQuantityPrice) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4 Find all products where MRP is greater than 500 and discount is less than 10%
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

--Q5 Identify the top 5 categories offering the highest average discount percentage
select category,
ROUND (avg(discountPercent),2) as avg_discount
FROM zepto
group by category
order by avg_discount desc
LIMIT 5;

--Q6 Find the price per gram for products above 100g and sort by best value
select distinct name, weightInGms, discountedSellingPrice,
ROUND (discountedSellingPrice/weightInGms,2) as price_per_gram 
from zepto
where weightInGms = 100
order by price_per_gram;

--Q7 Group the products into category like low, medium, bulk
select distinct name, weightInGms, 
case when weightInGms < 1000 then 'Low'
     when weightInGms < 5000 then 'Medium'
	 else 'Bluk'
	 end as weight_category
from zepto;

--Q8 What is the total inventory weight per category
select category,
sum(weightInGms * availableQuantityPrice) as total_weight
from zepto
group by category
order by total_weight;

