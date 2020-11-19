#1
select
* from tr_orderdetails;

#2

select distinct
ProductID, Quantity
from tr_orderdetails
where Quantity = 3
order by ProductID asc, Quantity desc;

#3
select 
ProductCategory, count(*) as COUNT 
FROM tr_products
group by ProductCategory
order by 2 desc;

#4
select 
PropertyState, count(*) as count
from tr_propertyinfo
group by PropertyState
order by 2 desc;


#5
select 
ProductID, sum(Quantity) as Total
from tr_orderdetails
group by ProductID
order by 2 desc
limit 5;


#6
select
p.ProductName, 
sum(o.Quantity*p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p
on o.ProductID = p.ProductID 
group by p.ProductName
order by 2 desc
limit 5;

#7
select
pi.PropertyCity , sum(o.Quantity * p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
group by pi.PropertyCity
order by  Sales desc
limit 5;	

#8
select
pi.PropertyCity, p.ProductName , sum(o.Quantity * p.Price) as Sales
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
where pi.PropertyCity = 'Portland'
group by pi.PropertyCity, p.ProductName
order by  Sales desc
limit 5;	
