CREATE DATABASE ReportingDB;
USE ReportingDB;

CREATE TABLE Reports (
    report_id INT PRIMARY KEY,
    report_name VARCHAR(100),
    department VARCHAR(50),
    created_by VARCHAR(100),
    created_date DATE,
    status VARCHAR(20),
    execution_time FLOAT,
    priority_level VARCHAR(10),
    billing_amount DECIMAL(10,2),
    hospital VARCHAR(100),
    room_number INT,
    insurance_provider VARCHAR(50)
);

INSERT INTO Reports VALUES
(1, 'Patient Summary', 'Cardiology', 'Dr. Mehta', '2023-01-10', 'Completed', 12.4, 'High', 24800.00, 'Harris and Sons', 292, 'Cigna'),
(2, 'Billing Overview', 'Finance', 'Dr. Rao', '2023-02-15', 'Completed', 10.2, 'Medium', 18900.00, 'Harris and Sons', 101, 'Aetna'),
(3, 'Visit Trends', 'Operations', 'Dr. Kapoor', '2023-03-20', 'Pending', 15.6, 'Low', 27890.00, 'Metro Health', 303, 'Cigna'),
(4, 'Compliance Tracker', 'Quality', 'Dr. Shah', '2023-04-05', 'Completed', 9.8, 'High', 24890.00, 'Harris and Sons', 292, 'United'),
(5, 'Inventory Analysis', 'Pharmacy', 'Dr. Joshi', '2023-05-12', 'Completed', 11.3, 'Medium', 19800.00, 'Metro Health', 404, 'Cigna');

#1. Retrieve the names of all reports
SELECT report_name FROM Reports;

#2. List the unique departments present in the dataset
SELECT department FROM Reports GROUP BY department;

#3. Find the total number of doctors involved
SELECT COUNT(DISTINCT created_by) FROM Reports;

#4. Retrieve the details of all reports marked 'Completed'
SELECT report_name, status FROM Reports WHERE status = 'Completed';

#5. What is the average execution time of reports
SELECT AVG(execution_time) FROM Reports;

#6. Identify doctors who created more than one report
SELECT COUNT(report_id), created_by FROM Reports GROUP BY created_by HAVING COUNT(report_id) > 1;

#7. List the names of all doctors
SELECT DISTINCT created_by FROM Reports;

#8. Identify the most common department among reports
SELECT department, COUNT(*) AS count FROM Reports GROUP BY department ORDER BY count DESC LIMIT 1;

#9. Find reports with execution time above 12 seconds and priority 'High'
SELECT report_name, execution_time FROM Reports WHERE execution_time > 12 AND priority_level = 'High';

#10. Calculate the total billing amount generated
SELECT SUM(billing_amount) FROM Reports;

#11. Find the doctor who created the report with the highest execution time
SELECT created_by, execution_time FROM Reports ORDER BY execution_time DESC LIMIT 1;

#12. Find the most recently created report
SELECT report_name, created_date FROM Reports ORDER BY created_date DESC LIMIT 1;

#13. Give the names of reports starting with 'P'
SELECT report_name FROM Reports WHERE report_name LIKE 'P%';

#14. How many reports are marked 'Completed' vs 'Pending'
SELECT status, COUNT(*) AS count FROM Reports GROUP BY status;

#15. How many reports have billing amount exactly 24890
SELECT COUNT(*) FROM Reports WHERE billing_amount = 24890;

#16. How many reports have billing amount above 24890
SELECT COUNT(*) FROM Reports WHERE billing_amount > 24890;

#17. How many reports are from room number 292
SELECT COUNT(*) FROM Reports WHERE room_number = 292;

#18. What are the names of reports with billing above 24890
SELECT report_name FROM Reports WHERE billing_amount > 24890;

#19. What are the names of reports created by Dr. Mehta
SELECT report_name FROM Reports WHERE created_by = 'Dr. Mehta';

#20. How many reports are from 'Metro Health'
SELECT COUNT(*) FROM Reports WHERE hospital = 'Metro Health';

#21. What are the names and room numbers of reports from 'Harris and Sons'
SELECT report_name, room_number FROM Reports WHERE hospital = 'Harris and Sons';

#22. How many reports have insurance provider 'Cigna'
SELECT COUNT(*) FROM Reports WHERE insurance_provider = 'Cigna';

#23. What are the names of reports with priority 'High'
SELECT report_name FROM Reports WHERE priority_level = 'High';

#24. How many reports have execution time greater than average
SELECT COUNT(*) FROM Reports WHERE execution_time > (SELECT AVG(execution_time) FROM Reports);

#25. List departments with reports above average billing
SELECT department, billing_amount FROM Reports WHERE billing_amount > (SELECT AVG(billing_amount) FROM Reports);