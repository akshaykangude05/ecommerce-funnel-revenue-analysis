CREATE OR REPLACE VIEW `compact-market-483515-k2.funnel_analytics.vw_funnel_user_counts` AS
SELECT
  event_name AS funnel_step,
  COUNT(DISTINCT user_id) AS users
FROM `compact-market-483515-k2.funnel_analytics.funnel_base_events`
GROUP BY event_name
ORDER BY users DESC;
