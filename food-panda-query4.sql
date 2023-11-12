
SELECT
`FoodPanda.Orders`.date_local,
`FoodPanda.Orders`.country_name,
vendorAgg.vendor_name,
SUM(`FoodPanda.Orders`.gmv_local),

FROM

(
SELECT
`FoodPanda.Vendors`.id, 
`FoodPanda.Vendors`.vendor_name,
row_number() over (order by `FoodPanda.Vendors`.vendor_name desc) as country_rank
FROM `FoodPanda.Vendors`
) vendorAgg
INNER JOIN `FoodPanda.Orders` ON vendorAgg.id = `FoodPanda.Orders`.vendor_id
GROUP BY `FoodPanda.Orders`.date_local,`FoodPanda.Orders`.country_name,vendorAgg.vendor_name