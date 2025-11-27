USE ProjectManagementDB;
GO

SET IDENTITY_INSERT Users ON;
INSERT INTO Users (UserID, Username, Email, PasswordHash, FirstName, LastName, Role) VALUES
(1, 'ivan.petrov', 'ivan.p@pm-bg.com', 'hashedpass1', 'Иван', 'Петров', 'Manager'),
(2, 'maria.dimitrova', 'maria.d@pm-bg.com', 'hashedpass2', 'Мария', 'Димитрова', 'Developer'),
(3, 'georgi.georgiev', 'georgi.g@pm-bg.com', 'hashedpass3', 'Георги', 'Георгиев', 'Developer'),
(4, 'elena.stoianova', 'elena.s@pm-bg.com', 'hashedpass4', 'Елена', 'Стоянова', 'Designer'),
(5, 'petar.nikolov', 'petar.n@pm-bg.com', 'hashedpass5', 'Петър', 'Николов', 'QA'),
(6, 'stefan.iliev', 'stefan.i@pm-bg.com', 'hashedpass6', 'Стефан', 'Илиев', 'DevOps'),
(7, 'aleksandra.koleva', 'aleksandra.k@pm-bg.com', 'hashedpass7', 'Александра', 'Колева', 'PO');
SET IDENTITY_INSERT Users OFF;
GO

SET IDENTITY_INSERT Teams ON;
INSERT INTO Teams (TeamID, TeamName, CreatedDate) VALUES
(1, 'Management', '2023-01-01'),
(2, 'Backend', '2023-01-01'),
(3, 'Frontend', '2023-01-01'),
(4, 'Design', '2023-01-01'),
(5, 'QA', '2023-01-01'),
(6, 'Ops', '2023-01-01');
SET IDENTITY_INSERT Teams OFF;
GO

INSERT INTO TeamMembers (UserID, TeamID, JoinedDate) VALUES
(1, 1, '2023-01-01'),
(2, 2, '2023-01-01'),
(3, 3, '2023-01-01'),
(4, 4, '2023-01-01'),
(5, 5, '2023-01-01'),
(6, 6, '2023-01-01'),
(7, 1, '2023-01-01');
GO

SET IDENTITY_INSERT Projects ON;
INSERT INTO Projects (ProjectID, TeamID, Title, Description, StartDate, EndDate, Budget, Status) VALUES
(1, 2, 'Онлайн Магазин "БГ Маркет"', 'Разработка на пълна E-commerce платформа.', '2023-10-01', '2024-06-30', 50000.00, 'Active'),
(2, 1, 'Вътрешна HR Система', 'Разработка на модул за управление на отпуски и заплати.', '2023-11-15', '2024-03-31', 12500.00, 'On Hold'),
(3, 4, 'Ребрандиране 2024', 'Обновяване на лога и визуална идентичност.', '2024-01-05', '2024-04-01', 5000.00, 'Completed'),
(4, 3, 'Мобилна Апликация (iOS/Android)', 'Разработка на нативна мобилна апликация.', '2023-09-01', '2024-12-20', 85000.00, 'Active'),
(5, 6, 'Миграция към Cloud', 'Прехвърляне на инфраструктурата към AWS/Azure.', '2024-05-01', '2024-09-01', 32000.00, 'Planned'),
(6, 1, 'Маркетинг кампания Q4', 'Изпълнение на маркетингови активности за последното тримесечие.', '2023-10-01', '2023-12-31', 15000.00, 'Completed'),
(7, 2, 'AI Чатбот интеграция', 'Интегриране на AI базиран чатбот за поддръжка.', '2024-02-15', '2024-08-15', 22000.00, 'Active');
SET IDENTITY_INSERT Projects OFF;
GO

SET IDENTITY_INSERT Tasks ON;
INSERT INTO Tasks (TaskID, ProjectID, AssignedToUserID, Title, Description, Priority, EstimatedHours, DueDate, Status) VALUES
(1, 1, 2, 'DB Схема дизайн', 'Проектиране на база данни за продукти и поръчки.', 'High', 16, '2023-10-10', 'Done'),
(2, 1, 3, 'API Плащания', 'Интеграция със Stripe и ePay.bg.', 'Critical', 40, '2023-12-01', 'In Progress'),
(3, 1, 4, 'UI Начална страница', 'Изготвяне на Figma макети за десктоп и мобилна версия.', 'Medium', 24, '2023-11-20', 'Done'),
(4, 2, 7, 'Анализ изисквания', 'Среща с HR отдела за уточняване на функционалности.', 'Low', 8, '2023-11-18', 'Done'),
(5, 2, 1, 'Бюджетиране', 'Преглед на финансовите параметри.', 'High', 4, '2023-11-25', 'To Do'),
(6, 4, 3, 'iOS Login Screen', 'Разработка на екрана за вход за iOS.', 'High', 12, '2023-10-15', 'Done'),
(7, 4, 3, 'Android Push Notif', 'Интеграция на Push нотификации за Android.', 'Medium', 18, '2023-11-30', 'In Progress'),
(8, 4, 6, 'API Security Audit', 'Одит на сигурността на API връзките.', 'Critical', 30, '2024-01-01', 'To Do'),
(9, 3, 4, 'Лого векторизация', 'Преобразуване на логото във векторен формат.', 'Medium', 6, '2024-01-15', 'Done'),
(10, 3, 4, 'Brand Book PDF', 'Изготвяне на PDF документ за Brand Book.', 'Low', 16, '2024-02-10', 'Done'),
(11, 5, 6, 'AWS Setup', 'Настройка на основните услуги в AWS.', 'High', 40, '2024-05-30', 'Planned'),
(12, 1, 2, 'Продуктов каталог', 'Разработка на функционалността за продуктов каталог.', 'High', 32, '2024-01-15', 'In Progress'),
(13, 1, 2, 'Кошница функционалност', 'Разработка на функционалността за потребителска кошница.', 'Critical', 20, '2024-02-15', 'To Do'),
(14, 6, 1, 'Facebook Ads Setup', 'Настройка на рекламни кампании във Facebook.', 'Medium', 10, '2023-10-20', 'Done'),
(15, 7, 2, 'Обучение на модела', 'Обучение на AI модела за чатбота.', 'Critical', 80, '2024-04-15', 'In Progress'),
(16, 7, 4, 'Chat Interface UI', 'Дизайн на потребителския интерфейс за чата.', 'Medium', 24, '2024-03-01', 'To Do'),
(17, 1, 5, 'Тестване на поръчки', 'Изпълнение на тестове за функционалността на поръчките.', 'High', 16, '2024-02-28', 'To Do'),
(18, 4, 5, 'Регресионни тестове', 'Изпълнение на регресионни тестове за мобилното приложение.', 'Medium', 20, '2024-01-30', 'In Progress');
SET IDENTITY_INSERT Tasks OFF;
GO

SET IDENTITY_INSERT Tags ON;
INSERT INTO Tags (TagID, TagName, ColorCode) VALUES
(1, 'Bug', '#FF0000'),
(2, 'Feature', '#00FF00'),
(3, 'Hotfix', '#FFA500'),
(4, 'Documentation', '#0000FF');
SET IDENTITY_INSERT Tags OFF;
GO

INSERT INTO TaskTags (TaskID, TagID) VALUES
(2, 2),
(12, 2),
(4, 4),
(8, 3),
(15, 2);
GO

INSERT INTO Comments (TaskID, AuthorUserID, Content, PostedDate) VALUES
(1, 1, 'Мария, схемата изглежда добре, но добави индекси на чуждите ключове.', '2023-10-08 10:30:00'),
(1, 2, 'Разбрано, добавих ги. Качвам новата версия.', '2023-10-08 14:15:00'),
(2, 3, 'Имаме проблем с документацията на ePay, чакам отговор от тях.', '2023-11-28 09:00:00'),
(15, 2, 'Моделът се обучава бавно. Може ли Стефан да провери ресурсите на сървъра?', '2024-03-01 16:00:00'),
(8, 6, 'Започвам одит днес, очаквам резултати до края на седмицата.', '2024-01-02 10:00:00');
GO