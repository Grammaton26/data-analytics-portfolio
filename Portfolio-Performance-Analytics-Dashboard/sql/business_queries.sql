/* Business Question 1
Which stock generated the highest total return?*/

SELECT
    c.ticker,
    ROUND(
        MAX(f.cumulative_return) * 100,
        2
    ) AS total_return_pct
FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id
GROUP BY c.ticker
ORDER BY total_return_pct DESC;

--=========================================================--

-- Business Question 2
-- Which stock was most volatile?

SELECT
    c.ticker,
    ROUND(
        AVG(f.volatility_21d) * 100,
        2
    ) AS avg_volatility_pct
FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id
GROUP BY c.ticker
ORDER BY avg_volatility_pct DESC;

--=========================================================--

-- Business Question 3
-- Which stock experienced the worst drawdown?

SELECT
    c.ticker,
    ROUND(
        MIN(f.drawdown_pct),
        2
    ) AS worst_drawdown_pct
FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id
GROUP BY c.ticker
ORDER BY worst_drawdown_pct ASC;

--=========================================================--

-- Business Question 4
-- Which stocks had the most breakout-volume days?

SELECT
    c.ticker,
    COUNT(*) AS breakout_days
FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id
WHERE f.is_breakout_day = TRUE
GROUP BY c.ticker
ORDER BY breakout_days DESC;

--=========================================================--

-- Business Question 5
-- Risk vs Return Summary
-- To be used for Tableau charts.

SELECT
    c.ticker,

    ROUND(
        MAX(f.cumulative_return) * 100,
        2
    ) AS total_return_pct,

    ROUND(
        AVG(f.volatility_21d) * 100,
        2
    ) AS avg_volatility_pct,

    ROUND(
        MIN(f.drawdown_pct),
        2
    ) AS worst_drawdown_pct

FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id

GROUP BY c.ticker
ORDER BY total_return_pct DESC;
