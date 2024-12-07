CREATE DATABASE pz18;
GO

Use pz18

CREATE TABLE Users(
userID INT PRIMARY KEY IDENTITY(1,1),
FIO nvarchar(MAX) not null,
Phone nvarchar(11) not null,
[Login] nvarchar(50) not null,
[Password] nvarchar(50) not null,
[Type] nvarchar(15) not null
)

INSERT INTO Users (fio, phone, login, password, type) VALUES
( 'Трубин Никита Юрьевич', '89210563128', 'kasoo', 'root', 'Менеджер'),
( 'Мурашов Андрей Юрьевич', '89535078985', 'murashov123', 'qwerty', 'Мастер'),
( 'Степанов Андрей Викторович', '89210673849', 'test1', 'test1', 'Мастер'),
( 'Перина Анастасия Денисовна', '89990563748', 'perinaAD', '250519', 'Оператор'),
( 'Мажитова Ксения Сергеевна', '89994563847', 'krutiha1234567', '1234567890', 'Оператор'),
( 'Семенова Ясмина Марковна', '89994563847', 'login1', 'pass1', 'Мастер'),
( 'Баранова Эмилия Марковна', '89994563841', 'login2', 'pass2', 'Заказчик'),
( 'Егорова Алиса Платоновна', '89994563842', 'login3', 'pass3', 'Заказчик'),
( 'Титов Максим Иванович', '89994563843', 'login4', 'pass4', 'Заказчик'),
( 'Иванов Марк Максимович', '89994563844', 'login5', 'pass5', 'Мастер');


CREATE TABLE Comments (
    commentID INT PRIMARY KEY,
    message TEXT NOT NULL,
    masterID INT,
    requestID INT,
    FOREIGN KEY (masterID) REFERENCES Users(userID),
    FOREIGN KEY (requestID) REFERENCES Requests(requestID)
);

INSERT INTO Comments (commentID, message, masterID, requestID) VALUES
(1, 'Интересная поломка', 2, 1),
(2, 'Очень странно, будем разбираться!', 3, 2),
(3, 'Скорее всего потребуется мотор обдува!', 2, 7),
(4, 'Интересная поломка', 2, 1),
(5, 'Очень странно, будем разбираться!', 3, 6);


CREATE TABLE Requests (
    requestID INT PRIMARY KEY IDENTITY(1,1),
    startDate DATE not null,
    homeTechType NVARCHAR(50) not null,
    homeTechModel NVARCHAR(100) not null,
    problemDescryption NVARCHAR(MAX) not null,
    requestStatus NVARCHAR(50) not null,
    completionDate DATE NULL,
    repairParts NVARCHAR(MAX) NULL,
    masterID INT,
    clientID INT,
  FOREIGN KEY (masterID) REFERENCES Users(userID),
  FOREIGN KEY (clientID) REFERENCES Users(userID),
);


INSERT INTO Requests (startDate, homeTechType, homeTechModel, problemDescryption, requestStatus, completionDate, repairParts, masterID, clientID)
VALUES 
('2023-06-06', 'Фен', 'Ладомир ТА112 белый', 'Перестал работать', 'В процессе ремонта', NULL, NULL, 2, 7),
('2023-05-05', 'Тостер', 'Redmond RT-437 черный', 'Перестал работать', 'В процессе ремонта', NULL, NULL, 3, 7),
('2022-07-07', 'Холодильник', 'Indesit DS 316 W белый', 'Не морозит одна из камер холодильника', 'Готова к выдаче', '2023-01-01', NULL, 2, 8),
('2023-08-02', 'Стиральная машина', 'DEXP WM-F610NTMA/WW белый', 'Перестали работать многие режимы стирки', 'Новая заявка', NULL, NULL, NULL, 8),
('2023-08-02', 'Мультиварка', 'Redmond RMC-M95 черный', 'Перестала включаться', 'Новая заявка', NULL, NULL, NULL, 9),
('2023-08-02', 'Фен', 'Ладомир ТА113 чёрный', 'Перестал работать', 'Готова к выдаче', '2023-08-03', NULL, 2, 7),
('2023-07-09', 'Холодильник', 'Indesit DS 314 W серый', 'Гудит, но не замораживает', 'Готова к выдаче', '2023-08-03', 'Мотор обдува морозильной камеры холодильника', 2, 8);