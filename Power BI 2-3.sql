

#1
SELECT DISTINCT o.user_id
FROM orders o
JOIN order_lines ol ON o.order_id = ol.order_id
JOIN products p ON ol.product_id = p.product_id
WHERE o.order_date BETWEEN '2023-08-01' AND '2023-08-15'
  AND p.product != 'Корм Kitekat для кошек, с кроликом в соусе, 85 г'
GROUP BY o.user_id
HAVING COUNT(DISTINCT p.product_id) >= 2;

#2
SELECT p.product, COUNT(*) AS total_orders
FROM orders o
JOIN order_lines ol ON o.order_id = ol.order_id
JOIN products p ON ol.product_id = p.product_id
JOIN users u ON o.user_id = u.user_id
WHERE u.city = 'Санкт-Петербург'
  AND o.order_date BETWEEN '2023-08-15' AND '2023-08-30'
GROUP BY p.product
ORDER BY total_orders DESC
LIMIT 5;



