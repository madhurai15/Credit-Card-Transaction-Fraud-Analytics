SELECT VERSION();
CREATE DATABASE FinanceDB;
USE FinanceDB;
SHOW VARIABLES LIKE 'secure_file_priv';
CREATE TABLE transactions (
    trans_date_trans_time DATETIME,
    cc_num BIGINT,
    merchant VARCHAR(100),
    category VARCHAR(50),
    amt DECIMAL(10,2),
    first VARCHAR(50),
    last VARCHAR(50),
    gender CHAR(1),
    street VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    zip INT,
    lat DECIMAL(10,6),
    `long` DECIMAL(10,6),
    city_pop INT,
    job VARCHAR(255),
    dob DATE,
    trans_num VARCHAR(50),
    unix_time BIGINT,
    merch_lat DECIMAL(10,6),
    merch_long DECIMAL(10,6),
    is_fraud TINYINT,
    merch_zipcode INT,
    Month VARCHAR(20),
    Day_of_Week VARCHAR(20),
    Weekend VARCHAR(5),
    Age INT,
    Age_Group VARCHAR(20)
);
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_credit_card_transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS Total_Rows
FROM transactions;
DESCRIBE transactions;
SELECT * FROM transactions
LIMIT 10;
SELECT COUNT(*) 
FROM transactions
WHERE amt IS NULL;
SELECT SUM(amt) AS Total_Revenue
FROM transactions;
SELECT MAX(amt) AS Maximum_Transaction
FROM transactions;
SELECT is_fraud,COUNT(*) AS Total
FROM transactions
GROUP BY is_fraud;
SELECT category,SUM(amt) AS Total_Spending
FROM transactions
GROUP BY category
ORDER BY Total_Spending DESC
LIMIT 10;
SELECT Age_Group,
SUM(amt) AS Total_Spending
FROM transactions
GROUP BY Age_Group
ORDER BY Total_Spending DESC;
SELECT Month,
SUM(amt) AS Total_Spending
FROM transactions
GROUP BY Month;
