USE ProjectManagementDB;
GO

CREATE TRIGGER trg_ValidateTaskDueDate
ON Tasks
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Projects p ON i.ProjectID = p.ProjectID
        WHERE i.DueDate > p.EndDate AND p.EndDate IS NOT NULL
    )
    BEGIN
        RAISERROR ('Грешка: Крайният срок на задачата не може да бъде след крайния срок на проекта.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO