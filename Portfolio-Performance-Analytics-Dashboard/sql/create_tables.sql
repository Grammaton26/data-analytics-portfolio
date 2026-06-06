-- ============================================================
-- PostgreSQL Database Design
-- Portfolio Performance Analytics Dashboard
-- ============================================================

-- Drop table if it already exists
DROP TABLE IF EXISTS company_metadata_dim CASCADE;

-- Create company metadata dimension table
CREATE TABLE company_metadata_dim (
    company_id SERIAL PRIMARY KEY,
    ticker VARCHAR(10) UNIQUE NOT NULL,
    company_name VARCHAR(100),
    sector VARCHAR(50),
    industry VARCHAR(100)
);

-- Drop table if it already exists
DROP TABLE IF EXISTS portfolio_fact CASCADE;

-- Create main portfolio fact table
CREATE TABLE portfolio_fact (
    fact_id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_metadata_dim(company_id),
    date DATE NOT NULL,
    open_price NUMERIC(12, 4),
    high_price NUMERIC(12, 4),
    low_price NUMERIC(12, 4),
    close_price NUMERIC(12, 4),
    volume BIGINT,
    daily_return NUMERIC(12, 8),
    cumulative_return NUMERIC(12, 8),
    sma_50 NUMERIC(12, 4),
    sma_200 NUMERIC(12, 4),
    volatility_21d NUMERIC(12, 8),
    running_peak NUMERIC(12, 4),
    drawdown_pct NUMERIC(12, 6),
    avg_volume_50 NUMERIC(18, 2),
    is_breakout_day BOOLEAN,
    CONSTRAINT unique_company_date UNIQUE (company_id, date)
);

-- Create index for time-series queries
CREATE INDEX idx_portfolio_fact_company_date
ON portfolio_fact (company_id, date);

-- Drop staging table if it already exists
DROP TABLE IF EXISTS portfolio_staging;

-- Create staging table that matches the CSV file
/* the staging table should use the same column names as the 
Python CSV columns to make the import easier.*/

CREATE TABLE portfolio_staging (
    "Date" DATE,
    "Ticker" VARCHAR(10),
    "Open" NUMERIC(12, 4),
    "High" NUMERIC(12, 4),
    "Low" NUMERIC(12, 4),
    "Close" NUMERIC(12, 4),
    "Volume" BIGINT,
    "Daily_Return" NUMERIC(12, 8),
    "Cumulative_Return" NUMERIC(12, 8),
    "SMA_50" NUMERIC(12, 4),
    "SMA_200" NUMERIC(12, 4),
    "Volatility_21D" NUMERIC(12, 8),
    "Running_Peak" NUMERIC(12, 4),
    "Drawdown_Pct" NUMERIC(12, 6),
    "Avg_Volume_50" NUMERIC(18, 2),
    "Is_Breakout_Day" BOOLEAN
);
