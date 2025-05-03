show databases;

create database final_project;
use final_project;

show tables;
select * from company;
select * from properties;
select * from residences;
select * from tenants;
select * from tenantHistory;
select * from rentPayment;
select * from expenses;
select * from rentChanges;



create table company(
companyId int auto_increment,
companyName varchar(255) not null,
companyAddress varchar(255) not null,
contactInfo varchar(255) not null,
primary key(companyId)
);

create table properties(
propertyId int auto_increment,
companyId int,
propertyType varchar(255) not null,
address varchar(255) not null,
primary key (propertyId),
foreign key (companyId) references company(companyId)
);
alter table properties modify column propertyType ENUM('House', 'Apartment Complex') not null;

create table residences(
resId int auto_increment,
propertyId int,
purchaseDate date,
purchasePrice decimal(10,2),
mortgage decimal(10,2),
primary key (resId),
foreign key (propertyId) references properties(propertyId)
);
alter table residences add column numberOfRooms int;
alter table residences add column numberOfBathrooms int;
alter table residences add column squareFootage int;
alter table residences add column propertyType ENUM('House', 'Apartment') not null;
alter table residences rename column propertyType to residenceType;

create table tenants(
tenantId int auto_increment,
TenantName varchar(255) not null,
contactDetails varchar(255) not null,
leaseStartDate date not null,
leaseEndDate date not null,
primary key(tenantId)
);

alter table tenants rename column contactDetails to phoneNumber;
alter table tenants add column email varchar(255);

create table tenantHistory(
tHistoryId int auto_increment,
tenantID int,
propertyId int,
moveInDate date not null,
moveOutDate date,
primary key(tHistoryId),
foreign key (tenantId) references tenants(tenantId),
foreign key (propertyId) references properties(propertyId)
);
alter table tenantHistory add column resNumber int;
ALTER TABLE TenantHistory
ADD FOREIGN KEY (propertyId, resNumber)
REFERENCES residences(propertyId, resId);
alter table tenantHistory add column numberOfMembers int not null;

create table rentPayment(
paymentId int auto_increment,
tenantId int,
propertyId int, 
amount decimal(10,2) not null,
paymentDate date not null,
primary key(paymentId),
foreign key(tenantId) references tenants(tenantId),
foreign key(propertyId) references properties(propertyId)
);

create table expenses(
expenseId int auto_increment,
propertyId int,
expenseType varchar(255) not null,
amount decimal(10,2) not null,
expenseDate date not null,
companyId int,
resNumber int,
primary key (expenseId),
foreign key (propertyId) references properties(propertyId),
foreign key (companyId) references properties(companyId),
foreign key (resNumber) references residences(resId)
);

/* rent changes table */
CREATE TABLE IF NOT EXISTS rentChanges (
    changeId INT AUTO_INCREMENT PRIMARY KEY,
    residenceId INT NOT NULL,
    oldMortgage DECIMAL(10, 2),
    newMortgage DECIMAL(10, 2),
    changeDate DATE,
    FOREIGN KEY (residenceId) REFERENCES residences(resId)
);


/* trigger for rent changes table */
DELIMITER //
CREATE TRIGGER log_rent_changes
AFTER UPDATE ON residences
FOR EACH ROW
BEGIN
   
    IF NEW.mortgage <> OLD.mortgage THEN
        INSERT INTO rentChanges (residenceId, oldMortgage, newMortgage, changeDate)
        VALUES (NEW.resId, OLD.mortgage, NEW.mortgage, CURDATE());
    END IF;
END;
//
DELIMITER ;