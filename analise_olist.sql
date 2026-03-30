-- =========================================
-- 📊 PROJETO: ANÁLISE E-COMMERCE (OLIST)
-- =========================================

-- =========================================
-- 1. Pedidos com atraso
-- =========================================
SELECT *
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
  AND order_delivered_customer_date > order_estimated_delivery_date;


-- =========================================
-- 2. Clientes com mais de 1 pedido
-- =========================================
SELECT 
  c.customer_unique_id,
  COUNT(o.order_id) AS total_pedidos
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
  ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_pedidos DESC;


-- =========================================
-- 3. Faturamento total por estado
-- =========================================
SELECT 
  c.customer_state,
  SUM(p.payment_value) AS total_faturamento
FROM olist_order_payments_dataset p
JOIN olist_orders_dataset o
  ON p.order_id = o.order_id
JOIN olist_customers_dataset c
  ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_faturamento DESC;


-- =========================================
-- 4. Média de avaliação por status do pedido
-- =========================================
SELECT 
  o.order_status,
  ROUND(AVG(r.review_score), 2) AS media_avaliacao
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
  ON o.order_id = r.order_id
GROUP BY o.order_status
ORDER BY media_avaliacao DESC;


-- =========================================
-- 5. Categoria mais vendida (por volume)
-- =========================================
SELECT 
  p.product_category_name,
  COUNT(*) AS total_vendas
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
  ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_vendas DESC
LIMIT 1;


-- =========================================
-- 6. Categoria com maior faturamento
-- =========================================
SELECT 
  p.product_category_name,
  SUM(i.price) AS faturamento
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
  ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY faturamento DESC
LIMIT 1;


-- =========================================
-- 7. Frete médio por categoria
-- =========================================
SELECT 
  p.product_category_name,
  ROUND(AVG(i.freight_value), 2) AS frete_medio
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
  ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY frete_medio DESC;


-- =========================================
-- 8. Base analítica completa
-- =========================================
SELECT 
  o.order_id,
  c.customer_state,
  o.order_purchase_timestamp AS data_compra,
  SUM(i.price) AS valor_total,
  SUM(i.freight_value) AS frete_total,
  COUNT(i.order_item_id) AS quantidade_itens,
  AVG(r.review_score) AS review_score
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
  ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset i
  ON o.order_id = i.order_id
LEFT JOIN olist_order_reviews_dataset r
  ON o.order_id = r.order_id
GROUP BY 
  o.order_id,
  c.customer_state,
  o.order_purchase_timestamp;