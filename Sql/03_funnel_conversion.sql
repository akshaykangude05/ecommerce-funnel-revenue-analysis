CREATE OR REPLACE VIEW `compact-market-483515-k2.funnel_analytics.vw_funnel_conversion` AS
WITH ordered_funnel AS (
  SELECT
    funnel_step,
    users,
    CASE funnel_step
      WHEN 'view_item' THEN 1
      WHEN 'add_to_cart' THEN 2
      WHEN 'begin_checkout' THEN 3
      WHEN 'purchase' THEN 4
    END AS step_order
  FROM `compact-market-483515-k2.funnel_analytics.vw_funnel_user_counts`
)
SELECT
  funnel_step,
  users,
  ROUND(
    users / LAG(users) OVER (ORDER BY step_order) * 100,
    2
  ) AS conversion_from_previous_step_pct
FROM ordered_funnel
ORDER BY step_order;
