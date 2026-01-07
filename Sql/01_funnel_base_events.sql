CREATE OR REPLACE VIEW `compact-market-483515-k2.funnel_analytics.funnel_base_events` AS
SELECT
  user_pseudo_id AS user_id,
  event_name,
  DATE(TIMESTAMP_MICROS(event_timestamp)) AS event_date,
  device.category AS device_category,
  traffic_source.source AS traffic_source,
  (
    SELECT value.double_value
    FROM UNNEST(event_params)
    WHERE key = 'value'
  ) AS revenue
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_`
WHERE event_name IN (
  'view_item',
  'add_to_cart',
  'begin_checkout',
  'purchase'
);
