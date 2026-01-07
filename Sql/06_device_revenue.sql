SELECT
  device_category,
  SUM(purchase_revenue) AS device_revenue
FROM `compact-market-483515-k2.funnel_analytics.funnel_base_events`
WHERE event_name = 'purchase'
GROUP BY device_category;
