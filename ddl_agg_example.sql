-- Aggregate table agg_sales_year
-- Estimated 3 rows, 12 bytes
CREATE TABLE "agg_sales_year" (
    "DIM_TIME_Years" INTEGER,
    "ORDERFACT_Quantity" DOUBLE,
    "ORDERFACT_Sales" DOUBLE,
    "ORDERFACT_fact_count" INTEGER);
-- Aggregate table agg_sales_customers
-- Estimated 121 rows, 2439 bytes
CREATE TABLE "agg_sales_customers" (
    "CUSTOMER_W_TER_Customer" VARCHAR,
    "ORDERFACT_Quantity" DOUBLE,
    "ORDERFACT_Sales" DOUBLE,
    "ORDERFACT_fact_count" INTEGER);
-- Aggregate table agg_sales_markets_customers
-- Estimated 2996 rows, 299600 bytes
CREATE TABLE "agg_sales_markets_customers" (
    "CUSTOMER_W_TER_Territory" VARCHAR,
    "CUSTOMER_W_TER_Country" VARCHAR,
    "CUSTOMER_W_TER_State_Province" VARCHAR,
    "CUSTOMER_W_TER_City" VARCHAR,
    "CUSTOMER_W_TER_Customer" VARCHAR,
    "ORDERFACT_Quantity" DOUBLE,
    "ORDERFACT_Sales" DOUBLE,
    "ORDERFACT_fact_count" INTEGER);
