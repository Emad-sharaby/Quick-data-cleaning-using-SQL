create database cleaning_data_1;
use cleaning_data_1;

CREATE TABLE Customers (
    ID INT IDENTITY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    City NVARCHAR(100)
);

INSERT INTO Customers (FullName, Email, City) VALUES
(' emad   sharaby ', 'Emad.Sharaby@GMAIL.com', ' Cairo '),
('EMAD SHARABY', NULL, 'cairo'),
('ahmed ali', 'ahmed@YAHOO.com', '  ALEXANDRIA '),
('Ahmed Ali', '', 'Alexandria'),
('sara mohamed', 'SARA@Hotmail.Com', 'GIZA'),
('sara mohamed', '  SARA@Hotmail.Com  ', ' giza ');
----------------------------------------
update customers 
set FullName=LTRIM(rtrim(fullname)),
Email=LTRIM(rtrim(Email)),
City=LTRIM(rtrim(city));

----------------------------------------
update customers 
set FullName=upper(fullname),
Email=upper(Email),
City=upper(city);

-----------------------------------------
update customers 
set Email='unknown'
where Email is null or Email='';

-----------------------------------------

WHILE EXISTS (SELECT 1 FROM Customers WHERE FullName LIKE '%  %')
BEGIN
    UPDATE Customers
    SET FullName = REPLACE(FullName, '  ', ' ')
END;

-----------------------------------------
with ctename as (select * ,ROW_NUMBER()over(partition by fullname,city order by id) as rowrank from Customers)
delete from ctename where rowrank>1;

-----------------------------------------



alter table customers add domain varchar(100);
update customers set domain = substring(email,CHARINDEX('@',email)+1,len(email))
from Customers;

-----------------------------------------
select * from Customers;


USE master;
GO
SELECT name, suser_sname(owner_sid) AS Owner FROM sys.databases;



