use oe;

-- Вывести максимальный и минимальный credit_limit.
select max(credit_limit) as max_credit_limit, min(credit_limit) as min_credit_limit
from customers;

-- Вывести покупателей у которых creditlimit выше среднего creditlimit.
select * 
from customers 
where credit_limit > (select avg(credit_limit) from customers);

-- Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
select count(*)
from customers
where CUST_FIRST_NAME like 'd%' and credit_limit > 500;

-- Найти среднее значение unit_price
select avg(unit_price) as avg_unit_price
from order_items;

-- Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.
select pi.product_name
from order_items oi
join product_information pi on oi.product_id = pi.product_id
where oi.quantity < (select avg(quantity) from order_items);

-- Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
select c.CUST_FIRST_NAME, c.CUST_LAST_NAME
from orders o
join customers c on o.customer_id = c.customer_id
order by o.order_total desc
limit 1;

-- Найти сумму общей суммы покупок(ORDER_TOTAL) всех мужчин покупателей.
select sum(o.order_total) as total_order_sum
from orders o
join customers c on o.customer_id = c.customer_id
where c.gender = 'm';










