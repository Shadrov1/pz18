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
( '������ ������ �������', '89210563128', 'kasoo', 'root', '��������'),
( '������� ������ �������', '89535078985', 'murashov123', 'qwerty', '������'),
( '�������� ������ ����������', '89210673849', 'test1', 'test1', '������'),
( '������ ��������� ���������', '89990563748', 'perinaAD', '250519', '��������'),
( '�������� ������ ���������', '89994563847', 'krutiha1234567', '1234567890', '��������'),
( '�������� ������ ��������', '89994563847', 'login1', 'pass1', '������'),
( '�������� ������ ��������', '89994563841', 'login2', 'pass2', '��������'),
( '������� ����� ����������', '89994563842', 'login3', 'pass3', '��������'),
( '����� ������ ��������', '89994563843', 'login4', 'pass4', '��������'),
( '������ ���� ����������', '89994563844', 'login5', 'pass5', '������');


CREATE TABLE Comments (
    commentID INT PRIMARY KEY,
    message TEXT NOT NULL,
    masterID INT,
    requestID INT,
    FOREIGN KEY (masterID) REFERENCES Users(userID),
    FOREIGN KEY (requestID) REFERENCES Requests(requestID)
);

INSERT INTO Comments (commentID, message, masterID, requestID) VALUES
(1, '���������� �������', 2, 1),
(2, '����� �������, ����� �����������!', 3, 2),
(3, '������ ����� ����������� ����� ������!', 2, 7),
(4, '���������� �������', 2, 1),
(5, '����� �������, ����� �����������!', 3, 6);


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
('2023-06-06', '���', '������� ��112 �����', '�������� ��������', '� �������� �������', NULL, NULL, 2, 7),
('2023-05-05', '������', 'Redmond RT-437 ������', '�������� ��������', '� �������� �������', NULL, NULL, 3, 7),
('2022-07-07', '�����������', 'Indesit DS 316 W �����', '�� ������� ���� �� ����� ������������', '������ � ������', '2023-01-01', NULL, 2, 8),
('2023-08-02', '���������� ������', 'DEXP WM-F610NTMA/WW �����', '��������� �������� ������ ������ ������', '����� ������', NULL, NULL, NULL, 8),
('2023-08-02', '�����������', 'Redmond RMC-M95 ������', '��������� ����������', '����� ������', NULL, NULL, NULL, 9),
('2023-08-02', '���', '������� ��113 ������', '�������� ��������', '������ � ������', '2023-08-03', NULL, 2, 7),
('2023-07-09', '�����������', 'Indesit DS 314 W �����', '�����, �� �� ������������', '������ � ������', '2023-08-03', '����� ������ ����������� ������ ������������', 2, 8);