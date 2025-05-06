USE ecommerce_data;
SELECT * from my_data;


-- Calculating Return_Rate for Products
SELECT 
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN Return_Status = 'Returned' THEN 1 
                ELSE 0 
            END
        ) / COUNT(*), 
        2
    ) AS Return_Percentage
FROM my_data;



-- Extracting High_risk_Products using Return_rate_Percent.

SELECT 
    Product_ID,
    Product_Category,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) AS Returns,
    ROUND(
        100.0 * SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS Return_Rate_Percent
FROM my_data
GROUP BY Product_ID, Product_Category
HAVING  Return_Rate_Percent > 30;




