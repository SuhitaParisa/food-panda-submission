SELECT
  MAX(AggregTable.country_name),
  AggregTable.vendor_name,
  AggregTable.total_gmv
FROM
  (SELECT
    `FoodPanda.Vendors`.country_name,
    `FoodPanda.Vendors`.vendor_name,
    sum(`FoodPanda.Orders`.gmv_local) AS total_gmv
  FROM `FoodPanda.Vendors`
  INNER JOIN `FoodPanda.Orders` ON `FoodPanda.Vendors`.id = `FoodPanda.Orders`.vendor_id
  WHERE `FoodPanda.Vendors`.is_active = true
  GROUP BY `FoodPanda.Vendors`.vendor_name,`FoodPanda.Vendors`.country_name) AggregTable
GROUP BY AggregTable.vendor_name,AggregTable.total_gmv