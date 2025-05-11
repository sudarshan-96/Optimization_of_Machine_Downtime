SELECT machine_id, COUNT(*) AS downtime_events
FROM machine_data
WHERE status = 'down'
GROUP BY machine_id
ORDER BY downtime_events DESC;