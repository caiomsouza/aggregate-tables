
truncate table agg_sales_year;

-- Populate aggregate table agg_sales_year
INSERT INTO "agg_sales_year" (
    "DIM_TIME_Years",
    "ORDERFACT_Quantity",
    "ORDERFACT_Sales",
    "ORDERFACT_fact_count")
select
    "DIM_TIME"."YEAR_ID" as "DIM_TIME_Years",
    sum("ORDERFACT"."QUANTITYORDERED") as "ORDERFACT_Quantity",
    sum("ORDERFACT"."TOTALPRICE") as "ORDERFACT_Sales",
    count(*) as "ORDERFACT_fact_count"
from
    "ORDERFACT" as "ORDERFACT",
    "DIM_TIME" as "DIM_TIME"
where
    "ORDERFACT"."TIME_ID" = "DIM_TIME"."TIME_ID"
group by
    "DIM_TIME"."YEAR_ID";

truncate table agg_sales_customers;
	
-- Populate aggregate table agg_sales_customers
INSERT INTO "agg_sales_customers" (
    "CUSTOMER_W_TER_Customer",
    "ORDERFACT_Quantity",
    "ORDERFACT_Sales",
    "ORDERFACT_fact_count")
select
    "CUSTOMER_W_TER"."CUSTOMERNAME" as "CUSTOMER_W_TER_Customer",
    sum("ORDERFACT"."QUANTITYORDERED") as "ORDERFACT_Quantity",
    sum("ORDERFACT"."TOTALPRICE") as "ORDERFACT_Sales",
    count(*) as "ORDERFACT_fact_count"
from
    "ORDERFACT" as "ORDERFACT",
    "CUSTOMER_W_TER" as "CUSTOMER_W_TER"
where
    "ORDERFACT"."CUSTOMERNUMBER" = "CUSTOMER_W_TER"."CUSTOMERNUMBER"
group by
    "CUSTOMER_W_TER"."CUSTOMERNAME";
	
truncate table agg_sales_markets_customers;
	
-- Populate aggregate table agg_sales_markets_customers
INSERT INTO "agg_sales_markets_customers" (
    "CUSTOMER_W_TER_Territory",
    "CUSTOMER_W_TER_Country",
    "CUSTOMER_W_TER_State_Province",
    "CUSTOMER_W_TER_City",
    "CUSTOMER_W_TER_Customer",
    "ORDERFACT_Quantity",
    "ORDERFACT_Sales",
    "ORDERFACT_fact_count")
select
    "CUSTOMER_W_TER"."TERRITORY" as "CUSTOMER_W_TER_Territory",
    "CUSTOMER_W_TER"."COUNTRY" as "CUSTOMER_W_TER_Country",
    "CUSTOMER_W_TER"."STATE" as "CUSTOMER_W_TER_State_Province",
    "CUSTOMER_W_TER"."CITY" as "CUSTOMER_W_TER_City",
    "CUSTOMER_W_TER"."CUSTOMERNAME" as "CUSTOMER_W_TER_Customer",
    sum("ORDERFACT"."QUANTITYORDERED") as "ORDERFACT_Quantity",
    sum("ORDERFACT"."TOTALPRICE") as "ORDERFACT_Sales",
    count(*) as "ORDERFACT_fact_count"
from
    "ORDERFACT" as "ORDERFACT",
    "CUSTOMER_W_TER" as "CUSTOMER_W_TER"
where
    "ORDERFACT"."CUSTOMERNUMBER" = "CUSTOMER_W_TER"."CUSTOMERNUMBER"
group by
    "CUSTOMER_W_TER"."TERRITORY",
    "CUSTOMER_W_TER"."COUNTRY",
    "CUSTOMER_W_TER"."STATE",
    "CUSTOMER_W_TER"."CITY",
    "CUSTOMER_W_TER"."CUSTOMERNAME";
