CREATE DATABASE healthcare_db;
USE healthcare_db;

CREATE TABLE hospital_data (
    patient_id INT,
    age INT,
    gender VARCHAR(20),
    chronic_condition VARCHAR(50),
    admission_type VARCHAR(50),
    department VARCHAR(50),
    wait_time_min INT,
    length_of_stay_days INT,
    procedures_count INT,
    medication_count INT,
    complications VARCHAR(50),
    discharge_status VARCHAR(50),
    readmitted_30d INT,
    total_cost DECIMAL(10,2),
    satisfaction_score INT
);

DROP TABLE hospital_data;

SELECT COUNT(*) FROM healthcare_db.healthcare_patient_journey;


# 1. Readmission Rate

    SELECT 
    COUNT(*) AS total_patients,
    SUM(CAST(readmitted_30d AS UNSIGNED)) AS readmitted_cases,
    ROUND(SUM(CAST(readmitted_30d AS UNSIGNED))/COUNT(*)*100,2) AS readmission_rate
FROM  healthcare_db.healthcare_patient_journey;


#2. Department with Highest Readmission

SELECT department, 
       COUNT(*) AS total_patients,
       SUM(readmitted_30d) AS readmissions
FROM  healthcare_db.healthcare_patient_journey
GROUP BY department
ORDER BY readmissions DESC;


#3. 

SELECT AVG(total_cost) 
FROM  healthcare_db.healthcare_patient_journey
WHERE readmitted_30d = 1;


ALTER TABLE healthcare_db.healthcare_patient_journey
CHANGE `total_cost_â‚¬` total_cost DECIMAL(10,2);




