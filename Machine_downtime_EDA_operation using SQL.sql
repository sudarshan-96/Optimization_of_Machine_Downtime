-- Create database
create database machine_data;

-- SELECT DATASET FOR USE
use machine_data;

-- NUMBERS OF ROWS IN OUR DATASET
SELECT COUNT(*) AS NUM_ROW
FROM machine_downtime;

-- NUMBEER OF COLUMNS IN OUR DATASET
SELECT COUNT(*) AS NUM_COL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'machine_downtime';

-- Count the number of machine
select Machine_ID ,count(Machine_ID) as No_of_Machine
from machine_downtime
group by Machine_ID;

-- Count the number of Assembly line number
select Assembly_Line_No ,count(Assembly_Line_No) as No_of_Assembly_Line
from machine_downtime
group by Assembly_Line_No;

-- Count of number of Machine downtime
select Downtime , count(Downtime) as Number_of_Downtime
from machine_downtime
group by Downtime;

-- Cheaking for Null values
SELECT * FROM machine_downtime
WHERE Date IS NULL;

/* EDA OPERATION */

/* 1st Business Moment: Measure Of Central Tendency  */

/* Mean */
SELECT AVG(Hydraulic_Pressure) AS mean_Hydraaulic_pressure
FROM machine_downtime;

SELECT AVG(Coolant_Pressure) AS mean_Coolant_Pressure
FROM machine_downtime;

SELECT AVG(Air_System_Pressure) AS mean_Air_System_Pressure
FROM machine_downtime;

SELECT AVG(Coolant_Temperature) AS mean_Coolant_Temperature
FROM machine_downtime;

SELECT AVG(Hydraulic_Oil_Temperature) AS mean_Hydraulic_Oil_Temperature
FROM machine_downtime;

SELECT AVG(Spindle_Bearing_Temperature) AS mean_Spindle_Bearing_Temperature
FROM machine_downtime;

SELECT AVG(Spindle_Vibration) AS mean_Spindle_Vibration
FROM machine_downtime;

SELECT AVG(Tool_Vibration) AS mean_Tool_Vibration
FROM machine_downtime;

SELECT AVG(Spindle_Speed) AS mean_Spindle_Speed
FROM machine_downtime;

SELECT AVG(Voltage) AS mean_Voltage
FROM machine_downtime;

SELECT AVG(Torque) AS mean_Torque
FROM machine_downtime;

SELECT AVG(Cutting) AS mean_Cutting
FROM machine_downtime;

/* Median */

SELECT Hydraulic_pressure AS median_Hydraulic_pressure
FROM (
    SELECT Hydraulic_pressure, ROW_NUMBER() OVER (ORDER BY Hydraulic_pressure) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT Coolant_Pressure AS median_Coolant_Pressure
FROM (
    SELECT Coolant_Pressure, ROW_NUMBER() OVER (ORDER BY Coolant_Pressure) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Air_System_Pressure AS median_Air_System_Pressure
FROM (
    SELECT Air_System_Pressure, ROW_NUMBER() OVER (ORDER BY Air_System_Pressure) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Coolant_Temperature AS median_Coolant_Temperature
FROM (
    SELECT Coolant_Temperature, ROW_NUMBER() OVER (ORDER BY Coolant_Temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Hydraulic_Oil_Temperature AS median_Hydraulic_Oil_Temperature
FROM (
    SELECT Hydraulic_Oil_Temperature, ROW_NUMBER() OVER (ORDER BY Hydraulic_Oil_Temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Spindle_Bearing_Temperature AS median_Spindle_Bearing_Temperature
FROM (
    SELECT Spindle_Bearing_Temperature, ROW_NUMBER() OVER (ORDER BY Spindle_Bearing_Temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Spindle_Vibration AS median_Spindle_Vibration
FROM (
    SELECT Spindle_Vibration, ROW_NUMBER() OVER (ORDER BY Spindle_Vibration) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Tool_Vibration AS median_Tool_Vibration
FROM (
    SELECT Tool_Vibration, ROW_NUMBER() OVER (ORDER BY Tool_Vibration) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Spindle_Speed AS median_Spindle_Speed
FROM (
    SELECT Spindle_Speed, ROW_NUMBER() OVER (ORDER BY Spindle_Speed) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Voltage AS median_Voltage
FROM (
    SELECT Voltage, ROW_NUMBER() OVER (ORDER BY Voltage) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Torque AS median_Torque
FROM (
    SELECT Torque, ROW_NUMBER() OVER (ORDER BY Torque) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Cutting AS median_Cutting
FROM (
    SELECT Cutting, ROW_NUMBER() OVER (ORDER BY Cutting) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

/* Mode */
 SELECT Hydraulic_Pressure AS mode_Hydraulic_Pressure
FROM (
    SELECT Hydraulic_Pressure, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Hydraulic_Pressure
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Coolant_Pressure AS mode_Coolant_Pressure
FROM (
    SELECT Coolant_Pressure, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Coolant_Pressure
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Air_System_Pressure AS mode_Air_System_Pressure
FROM (
    SELECT Air_System_Pressure, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Air_System_Pressure
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Coolant_Temperature AS mode_Coolant_Temperature
FROM (
    SELECT Coolant_Temperature, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Coolant_Temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Hydraulic_Oil_Temperature AS mode_Hydraulic_Oil_Temperature
FROM (
    SELECT Hydraulic_Oil_Temperature, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Hydraulic_Oil_Temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Bearing_Temperature AS mode_Spindle_Bearing_Temperature
FROM (
    SELECT Spindle_Bearing_Temperature, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Bearing_Temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Vibration AS mode_Spindle_Vibration
FROM (
    SELECT Spindle_Vibration, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Vibration
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Tool_Vibration AS mode_Tool_Vibration
FROM (
    SELECT Tool_Vibration, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Tool_Vibration
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Speed AS mode_Spindle_Speed
FROM (
    SELECT Spindle_Speed, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Speed
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Voltage AS mode_Voltage
FROM (
    SELECT Voltage, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Voltage
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Torque AS mode_Torque
FROM (
    SELECT Torque, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Torque
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Cutting AS mode_Cutting
FROM (
    SELECT Cutting, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Cutting
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

/* 2nd Business Moment: Measure Of Dispersion */

 ---  Variance
 
 SELECT VARIANCE(Hydraulic_Pressure) AS Hydraulic_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Coolant_Pressure) AS Coolant_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Air_System_Pressure) AS Air_System_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Coolant_Temperature) AS Coolant_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Hydraulic_Oil_Temperature) AS Hydraulic_Oil_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Bearing_Temperature) AS Spindle_Bearing_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Vibration) AS Spindle_Vibration_variance
FROM machine_downtime;

SELECT VARIANCE(Tool_Vibration) AS Tool_Vibration_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Speed) AS Spindle_Speed_variance
FROM machine_downtime;

SELECT VARIANCE(Voltage) AS Voltagevariance
FROM machine_downtime;

SELECT VARIANCE(Torque) AS Torque_variance
FROM machine_downtime;

SELECT VARIANCE(Cutting) AS Cutting_variance
FROM machine_downtime;

-- Standard Deviation

 SELECT STDDEV(Hydraulic_Pressure) AS Hydraulic_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Coolant_Pressure) AS Coolant_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Air_System_Pressure) AS Air_System_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Coolant_Temperature) AS Coolant_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Hydraulic_Oil_Temperature) AS Hydraulic_Oil_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Bearing_Temperature) AS Spindle_Bearing_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Vibration) AS Spindle_Vibration_stddev
FROM machine_downtime;

SELECT STDDEV(Tool_Vibration) AS Tool_Vibration_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Speed) AS Spindle_Speed_stddev
FROM machine_downtime;

SELECT STDDEV(Voltage) AS Voltage_stddev
FROM machine_downtime;

SELECT STDDEV(Torque) AS Torque_stddev
FROM machine_downtime;

SELECT STDDEV(Cutting) AS Cutting_stddev
FROM machine_downtime;

--- RANGE

SELECT MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) AS experience_range
FROM machine_downtime;

SELECT MAX(Coolant_Pressure) - MIN(Coolant_Pressure) AS experience_range
FROM machine_downtime;

SELECT MAX(Air_System_Pressure) - MIN(Air_System_Pressure) AS experience_range
FROM machine_downtime;

SELECT MAX(Coolant_Temperature) - MIN(Coolant_Temperature) AS experience_range
FROM machine_downtime;

SELECT MAX(Hydraulic_Oil_Temperature) - MIN(Hydraulic_Oil_Temperature) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Vibration) - MIN(Spindle_Vibration) AS experience_range
FROM machine_downtime;

SELECT MAX(Tool_Vibration) - MIN(Tool_Vibration) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Speed) - MIN(Spindle_Speed) AS experience_range
FROM machine_downtime;

SELECT MAX(Voltage) - MIN(Voltage) AS experience_range
FROM machine_downtime;

SELECT MAX(Torque) - MIN(Torque) AS experience_range
FROM machine_downtime;

SELECT MAX(Cutting) - MIN(Cutting) AS experience_range
FROM machine_downtime;

/* Third and Fourth Moment Business Decision */
--- skewness and kurkosis 

SELECT
    (
        SUM(POWER(Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Spindle_Vibration - (SELECT AVG(Spindle_Vibration) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Vibration- (SELECT AVG(Spindle_Vibration) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Voltage- (SELECT AVG(Voltage) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Voltage - (SELECT AVG(Voltage) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Torque - (SELECT AVG(Torque) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Torque) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Torque - (SELECT AVG(Torque) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Torque) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Cutting - (SELECT AVG(Cutting) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Cutting - (SELECT AVG(Cutting) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;