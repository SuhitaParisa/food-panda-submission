SELECT 
  `FoodPanda.Vendors`.vendor_name,
  count(customer_id) AS customer_count ,
  sum(gmv_local) AS total_gmv
FROM `FoodPanda.Orders`
INNER JOIN `FoodPanda.Vendors` ON `FoodPanda.Orders`.vendor_id = `FoodPanda.Vendors`.id
WHERE `FoodPanda.Orders`.country_name = 'Taiwan'
GROUP BY vendor_name
ORDER BY count(customer_id) DESC
