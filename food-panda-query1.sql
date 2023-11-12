SELECT country_name,SUM(gmv_local)
FROM Foodpanda.Orders
Group BY country_name;