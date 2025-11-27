# Project Management Platform
## Курсова работа по софтуерно моделиране и анализ

## Студент: Иван Сиянов 
## Факултетен номер: 2301321013 
## Специалност: СИ 
### Репозитори: https://github.com/ivan1013/software-modeling-and-analysis-se

## 📌 Описание на проекта

Проектът представлява платформа за управление на проекти (Project Management Platform), която поддържа:

    управление на потребители и роли,
    създаване и управление на екипи,
    създаване на проекти и задачи,
    тагове за класификация,
    коментари към задачи,
    анализ на данните чрез Data Warehouse и Looker Studio.

Целта е чрез трите модела (концептуален, логически и дата-уерхаус модел) да се демонстрира цялостен процес на проектиране, изграждане и анализ на релационни бази данни.

🗂️ 1. Концептуален модел (Chen’s notation)

Концептуалният модел описва основните обекти в системата и техните връзки. Реализирани ентитети:

    USER
    TEAM
    PROJECT
    TASK
    COMMENT
    TAG

Добавена е връзка много към много между TASK и TAG чрез асоциативна таблица TaskTag.

🗄️ 2. Логически модел (Crow’s Foot notation)

В логическия модел са изградени таблиците, атрибутите и връзките между тях. Базира се на изискването:

    Минимум 6 обекта – изпълнено (има 6 основни + 1 асоциативна таблица)
    Над 30 атрибута общо – изпълнено
    Поне една M:N връзка – изпълнено (Task–Tag)

Използвани таблици:

USER

    UserID (PK)
    Username
    Email
    PasswordHash
    FirstName
    LastName
    Role

TEAM

    TeamID (PK)
    TeamName
    CreatedDate

PROJECT

    ProjectID (PK)
    Title
    Description
    StartDate
    EndDate
    Budget
    Status

TASK

    TaskID (PK)
    Title
    Description
    Priority
    EstimatedHours
    DueDate
    Status

COMMENT

    CommentID (PK)
    Content
    PostedDate

TAG

    TagID (PK)
    TagName
    ColorCode

TaskTag (асоциативна таблица)

    TaskID (FK)
    TagID (FK)

🏗️ 3. Физически модел и база данни (MS SQL Server)
Създадена е база данни в MS SQL Server въз основа на логическия модел. Добавени са:

✔ Съхранена процедура
Пример: sp_AddTask – създава нова задача.

✔ Функция
Пример: fn_GetTaskCountByUser(UserID) – връща броя задачи на потребител.

✔ Тригер
Пример: tr_AutoSetStartDateOnProjectInsert – автоматично задава StartDate ако не е подадена.

✔ Данни
Базата е попълнена с примерни записи:

    тестови потребители, екипи, проекти, задачи, тагове и коментари.

🏢 4. Data Warehouse модел (UML)
Създаден е отделен модел за аналитично отчитане.

Факт таблици:

    Fact_Task_Execution
    Fact_Comment_Activity
    Fact_Project_Financials

Дименсии:

    Dim_User
    Dim_Project
    Dim_Task
    Dim_Team
    Dim_Tag
    Dim_Date

Моделът следва стандартна звездна схема (Star Schema).

📊 5. Looker Studio доклад

Изграден е Looker Studio доклад, който използва данните от оперативната база.

Минимум три визуализации:

    📈 Графика на завършените задачи по потребители
    📊 Бюджет и реална продължителност на проектите
    🕒 Разпределение на EstimatedHours и статуси на задачите

Докладът дава възможност за филтриране по екип, потребител, проект и тегове.

🚀 Инструкции за инсталация и стартиране

    Клонирайте репозиторието:
    Bash

    git clone https://github.com/ivan1013/software-modeling-and-analysis-se
