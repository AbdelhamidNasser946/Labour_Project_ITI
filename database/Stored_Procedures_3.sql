--Stored_Procedures_3
--1
CREATE PROC Delete_Unemployment
    @ind_id VARCHAR(300)
AS
BEGIN
    DELETE FROM Unemployment
    WHERE Unemployment.Individual_ID = @ind_id
END

GO

---------
--2
CREATE PROC Select_Income
    @ind_id VARCHAR(300) = NULL
AS
BEGIN
    IF @ind_id IS NULL
        SELECT Basic_Salary, Total_Monthly_Salary, Overtime_Hours FROM Income
    ELSE
        SELECT Basic_Salary, Total_Monthly_Salary, Overtime_Hours FROM Income
        WHERE Income.Individual_ID = @ind_id
END;

GO
--------
--3

CREATE PROC Insert_Income
    @ind_id VARCHAR(300),
    @basic_salary DECIMAL(18, 2),
    @total_monthly_salary DECIMAL(18, 2),
    @overtime_hours INT
AS
BEGIN
    INSERT INTO Income (Individual_ID, Basic_Salary, Total_Monthly_Salary, Overtime_Hours)
    VALUES (@ind_id, @basic_salary, @total_monthly_salary, @overtime_hours)
END;


GO
--------------------
--4
CREATE PROC Update_Income
    @ind_id VARCHAR(300),
    @basic_salary DECIMAL(18, 2),
    @total_monthly_salary DECIMAL(18, 2),
    @overtime_hours INT
AS
BEGIN
    UPDATE Income
    SET Basic_Salary = @basic_salary,
        Total_Monthly_Salary = @total_monthly_salary,
        Overtime_Hours = @overtime_hours
    WHERE Income.Individual_ID = @ind_id
END;

-----
--5
GO

CREATE PROC Delete_Income
    @ind_id VARCHAR(300)
AS
BEGIN
    DELETE FROM Income
    WHERE Income.Individual_ID = @ind_id
END


------------- 

GO
---6
CREATE PROC Select_Covid_Impact
    @ind_id VARCHAR(300) = NULL
AS
BEGIN
    IF @ind_id IS NULL
        SELECT COVID_Salary_Reduction, Income_Reduction_Rate, Working_Hours_Change FROM Covid_Impact
    ELSE
        SELECT COVID_Salary_Reduction, Income_Reduction_Rate, Working_Hours_Change FROM Covid_Impact
        WHERE Covid_Impact.Individual_ID = @ind_id
END;


GO

----------
---7

CREATE PROC Insert_into_Covid_Impact
    @ind_id VARCHAR(300),
    @covid_salary_reduction DECIMAL(18, 2),
    @income_reduction_rate DECIMAL(5, 2),
    @working_hours_change VARCHAR(100)
AS
BEGIN
    INSERT INTO Covid_Impact (Individual_ID, COVID_Salary_Reduction, Income_Reduction_Rate, Working_Hours_Change)
    VALUES (@ind_id, @covid_salary_reduction, @income_reduction_rate, @working_hours_change)
END;

GO


-------------

--8
CREATE PROCEDURE Update_Covid_Impact
    @ind_id VARCHAR(300),
    @covid_salary_reduction DECIMAL(18, 2),
    @income_reduction_rate DECIMAL(5, 2),
    @working_hours_change VARCHAR(100)
AS
BEGIN
    UPDATE Covid_Impact
    SET COVID_Salary_Reduction = @covid_salary_reduction,
        Income_Reduction_Rate = @income_reduction_rate,
        Working_Hours_Change = @working_hours_change
    WHERE Covid_Impact.Individual_ID = @ind_id
END;


------------
GO
--9


CREATE PROC Delete_Covid_Impact
    @ind_id VARCHAR(300)
AS
BEGIN
    DELETE FROM Covid_Impact
    WHERE Covid_Impact.Individual_ID = @ind_id
END;



-------------
GO

--10
CREATE PROC Select_Weightes
    @ind_id VARCHAR(300) = NULL
AS
BEGIN
    IF @ind_id IS NULL
        SELECT Annual_Weight, Normalized_Factor,Quarterly_Weight FROM Survey_Weights
    ELSE
        SELECT Annual_Weight, Normalized_Factor,Quarterly_Weight FROM Survey_Weights
        WHERE Survey_Weights.Individual_ID = @ind_id
END;
























