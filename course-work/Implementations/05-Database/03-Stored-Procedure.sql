USE ProjectManagementDB;
GO

CREATE PROCEDURE usp_GetProjectProgress
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.Title AS ProjectTitle,
        p.Status AS ProjectStatus,
        COUNT(t.TaskID) AS TotalTasks,
        SUM(CASE WHEN t.Status = 'Done' THEN 1 ELSE 0 END) AS CompletedTasks,
        SUM(ISNULL(t.EstimatedHours, 0)) AS TotalEstimatedHours,
        CASE 
            WHEN COUNT(t.TaskID) = 0 THEN 0
            ELSE (CAST(SUM(CASE WHEN t.Status = 'Done' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(t.TaskID)) * 100 
        END AS CompletionPercentage
    FROM 
        Projects p
    LEFT JOIN 
        Tasks t ON p.ProjectID = t.ProjectID
    WHERE 
        p.ProjectID = @ProjectID
    GROUP BY 
        p.Title, p.Status;
END;
GO
-- EXEC usp_GetProjectProgress @ProjectID = 1;