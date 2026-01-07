CREATE OR REPLACE VIEW `compact-market-483515-k2.funnel_analytics.vw_funnel_revenue_opportunity` AS
SELECT
  f.funnel_step,
  f.users AS user_count,
  r.avg_order_value,
  ROUND(f.users * r.avg_order_value, 2) AS potential_revenue
FROM `compact-market-483515-k2.funnel_analytics.vw_funnel_user_counts` f
CROSS JOIN `compact-market-483515-k2.funnel_analytics.vw_revenue_metrics` r
WHERE f.funnel_step IN ('add_to_cart', 'begin_checkout');
