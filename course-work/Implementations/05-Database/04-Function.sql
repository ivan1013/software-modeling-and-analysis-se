USE ProjectManagementDB;
GO

CREATE FUNCTION dbo.fn_GetUserPendingWorkload
(
    @UserID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TotalHours INT;

    SELECT @TotalHours = SUM(EstimatedHours)
    FROM Tasks
    WHERE AssignedToUserID = @UserID
      AND Status IN ('To Do', 'In Progress'); -- Само активни задачи

    RETURN ISNULL(@TotalHours, 0);
END;
GO
-- SELECT dbo.fn_GetUserPendingWorkload(2) AS PendingHours;