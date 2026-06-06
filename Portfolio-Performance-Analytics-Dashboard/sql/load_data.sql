-- Insert selected stock metadata
INSERT INTO company_metadata_dim (ticker, company_name, sector, industry)
VALUES
('MSFT', 'Microsoft Corporation', 'Technology', 'Software'),
('ASML', 'ASML Holding N.V.', 'Technology', 'Semiconductor Equipment'),
('NVDA', 'NVIDIA Corporation', 'Technology', 'Semiconductors'),
('AMZN', 'Amazon.com Inc.', 'Consumer Discretionary', 'Internet Retail and Cloud'),
('GOOGL', 'Alphabet Inc.', 'Communication Services', 'Internet Content and Advertising');

-- Check metadata records
SELECT *
FROM company_metadata_dim
ORDER BY ticker;

INSERT INTO portfolio_fact (
    company_id, date, open_price, high_price, low_price, close_price,
    volume, daily_return, cumulative_return, sma_50, sma_200,
    volatility_21d, running_peak, drawdown_pct, avg_volume_50,
    is_breakout_day
)
SELECT
    c.company_id,
    s."Date",
    s."Open",
    s."High",
    s."Low",
    s."Close",
    s."Volume",
    s."Daily_Return",
    s."Cumulative_Return",
    s."SMA_50",
    s."SMA_200",
    s."Volatility_21D",
    s."Running_Peak",
    s."Drawdown_Pct",
    s."Avg_Volume_50",
    s."Is_Breakout_Day"
FROM portfolio_staging s
JOIN company_metadata_dim c
    ON s."Ticker" = c.ticker;


-- Verify Record Counts
SELECT
    c.ticker,
    COUNT(*) AS total_records
FROM portfolio_fact f
JOIN company_metadata_dim c
    ON f.company_id = c.company_id
GROUP BY c.ticker
ORDER BY c.ticker;


-- Verify Date Range
SELECT
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM portfolio_fact;


-- Verify Metrics Loaded
SELECT
    date,
    close_price,
    daily_return,
    cumulative_return,
    volatility_21d,
    drawdown_pct
FROM portfolio_fact
LIMIT 10;
