--create database LabourForceDB
use LabourForceDB

CREATE TABLE Governorate 
(
Gov_id int PRIMARY KEY,
Governorate_name nvarchar(50)
)
---------------------------------------
CREATE TABLE Section 
(
Survey_Section_ID int PRIMARY KEY,
Section_Name nvarchar(100),
Household_Region_Type nvarchar(50),
Gov_ID int FOREIGN KEY REFERENCES Governorate(gov_id)
)
---------------------------------------
CREATE TABLE Individual 
(
Individual_ID nvarchar(300) primary key,
Gender nvarchar(10),
constraint CHK_Gender
CHECK (Gender IN(N'ذكر',N'أنثى')),
Age int,
Marital_Status nvarchar(50),
Family_ID nvarchar(300),
Family_Relation nvarchar(50),
Section_Id int,
Gov_ID int FOREIGN KEY REFERENCES Governorate(Gov_ID),
FOREIGN KEY (Section_Id) REFERENCES Section(Survey_Section_ID)
)
----------------------------------------
CREATE TABLE Education
(
Individual_ID nvarchar(300) primary key,
Education_Status nvarchar(50),
Education_Level nvarchar(50),
Education_Dropout_Reason nvarchar(100),
Graduation_Year int,
constraint CHK_Graduation_Year 
CHECK (Graduation_Year <= 2024),
Professional_Training_Status nvarchar(100),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
----------------------------------------
CREATE TABLE Employment 
(
Individual_ID nvarchar(300) PRIMARY KEY,
Current_Job nvarchar(100),
Work_Nature nvarchar(50),
Contract_Type nvarchar(50),
Weekly_Hours int,
Career_Start_Year int,
Labor_Force_Status nvarchar(50),
Employment_Status nvarchar(50),
Is_Informal_Worker nvarchar(50),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
---------------------------------------------
CREATE TABLE Income
(
Individual_ID nvarchar(300) PRIMARY KEY,
Basic_Salary decimal(10,2),
Total_Monthly_Salary decimal(10,2),
Overtime_Hours int,
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
--------------------------------------------
CREATE TABLE Social_Benefits 
(
Individual_ID nvarchar(300) PRIMARY KEY,
Social_Security_Status nvarchar(10),
Health_Insurance_Status nvarchar(10),
Paid_Leave_Benefit nvarchar(10),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
---------------------------------------
CREATE TABLE Disability
(
Individual_ID nvarchar(300) PRIMARY KEY,
Sight_Difficulty nvarchar(50),
Hearing_Difficulty nvarchar(50),
Memory_Difficulty nvarchar(50),
Walking_Difficulty nvarchar(50),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
---------------------------------------
CREATE TABLE Secondary_Job
(
Individual_ID nvarchar(300) PRIMARY KEY,
Secondary_Job_Activity nvarchar(100),
Secondary_Weekly_Hours int,
Secondary_Monthly_Income decimal(10,2),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
----------------------------------------------
CREATE TABLE Unemployment 
(
Individual_ID nvarchar(300) PRIMARY KEY,
Primary_Search_Method nvarchar(100),
Secondary_Search_Method nvarchar(100),
Unemployment_Duration_Months int,
Willingness_To_Work nvarchar(10),
Availability_To_Start nvarchar(50),
Reason_For_Not_Searching nvarchar(200),
Non_Participation_Reason nvarchar(200),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
-------------------------------------------------------
CREATE TABLE COVID_IMPACT (
Individual_ID nvarchar(300) primary key,
COVID_Salary_Reduction nvarchar(50),
Income_Reduction_Rate int,
Working_Hours_Change nvarchar(50),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID)
)
--------------------------------------------
CREATE TABLE Survey_Weights (
Individual_ID nvarchar(300) PRIMARY KEY,
Annual_Weight decimal(10,4),
Normalized_Factor decimal(10,4),
Quarterly_Weight decimal(10,4),
FOREIGN KEY (Individual_ID) REFERENCES Individual(Individual_ID),
QUARTER_Id INT,
)
------------------------------------
-- CREATE TABLE Section 
-- (
-- Survey_Section_ID int PRIMARY KEY,
-- Section_Name nvarchar(100),
-- Household_Region_Type nvarchar(50),
-- Gov_ID int FOREIGN KEY REFERENCES Governorate(gov_id)
-- )
-----------------------------------------------------------------------------------------------------
