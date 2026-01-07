CREATE OR REPLACE VIEW `compact-market-483515-k2.funnel_analytics.vw_revenue_metrics` AS
SELECT
  COUNT(DISTINCT user_pseudo_id) AS total_purchasers,
  COUNT(*) AS total_purchases,
  ROUND(SUM(ecommerce.purchase_revenue), 2) AS total_revenue,
  ROUND(
    SUM(ecommerce.purchase_revenue) / COUNT(*),
    2
  ) AS avg_order_value
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase';
