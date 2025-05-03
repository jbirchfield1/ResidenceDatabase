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

/* inserting into company */
insert into company(companyName, companyAddress, contactInfo) values 
('Google', '1600 Ampitheatre Parkway, Mountain View, CA', '(650)253-0000'),
('Intercontinental Hotels Group','Three Ravinia Drive Suite 100 Atlanta, GA','(770)604-2000'),
('Lincoln Property Company','8111 Douglas Avenue, Suite 600 Dallas, TX','(214)740-3300');

/* inserting into properties*/
insert into properties(companyId, propertyType, address) values 
	(1, 'House', '824 Elm Street'),
	(2, 'House', '405 Birch Street'),
	(3, 'House', '159 Cedar Street'),
	(1, 'Apartment Complex', '187 Arkansas Avenue'),
	(2, 'Apartment Complex', '164 O Street'),
	(3, 'Apartment Complex', '382 Joyce Street');

/* inserting into residences */
insert into residences(propertyId, purchaseDate, purchasePrice, mortgage, numberOfRooms, numberOfBathrooms, squareFootage) values 
	(4, '2023-1-15', 30000,1500,2,1,800),
	(4, '2023-02-05', 320000, 1600, 3, 2, 900),
	(4, '2023-03-28', 310000, 1550, 2, 1, 850),

	(5, '2023-01-20', 280000, 1400, 3, 2, 1000),
	(5, '2023-02-05', 285000, 1425, 2, 1, 850),
	(5, '2023-03-25', 290000, 1450, 3, 2, 950),

	(6, '2023-01-25', 310000, 1550, 3, 2, 950),
	(6, '2023-02-10', 320000, 1600, 2, 1, 800),
	(6, '2023-03-30', 315000, 1575, 3, 2, 900);

/* Adding Houses */
insert into residences(propertyId, purchaseDate, purchasePrice,  mortgage, numberOfRooms, numberOfBathrooms, squareFootage, residenceType) values 
	(1, '2017-03-05', 250000, 1013, 3, 2, 1800, 'House'),
	(2, '2018-06-10', 220000, 890, 2, 1, 1600, 'House'),
	(3, '2019-09-15', 275000, 1387, 4, 3, 2100, 'House');


update residences set residenceType = 'Apartment' where propertyId > 3;

/* insert into tenants */

	/* Previous Tenants*/
INSERT INTO tenants (tenantName, contactDetails, leaseStartDate, leaseEndDate, email)
VALUES 
    ('Josh Birchfield', '(479) 123-4567', '2023-01-01', '2023-12-31', 'jbirchfield@gmail.com'),
    ('Alan Young', '(479) 325-5678', '2023-02-15', '2024-02-14', 'ayoung@gmail.com'),
    ('Ben Edens', '(808) 314-1934', '2023-03-01', '2024-03-01', 'bedens@gmail.com'),
    ('Oswald Fiddledink', '(193) 164-0834', '2023-04-01', '2024-04-01', 'ofiddledink@gmail.com'),
    ('David Swasnik', '(739) 468-1638', '2023-05-15', '2024-05-15', 'dswasnik@gmail.com'),
    ('Suzie Greenick', '(167) 803-0846', '2023-06-01', '2024-06-01', 'sgreenick@gmail.com'),
    ('Luke Greyrat', '(186) 694-2069', '2023-07-15', '2024-07-15', 'lgreyrat@gmail.com'),
    ('Zackary White', '(381) 465-4381', '2023-08-01', '2024-08-01', 'zwhite@gmail.com'),
    ('Nathaniel Brown', '(012) 010-0102', '2023-02-01', '2024-09-01', 'nbrown@gmail.com'),
    ('Olivia Voldaren', '(164) 068-0420', '2023-10-01', '2024-10-01', 'ovoldaren@gmail.com');
insert into tenants (tenantName, contactDetails, leaseStartDate, leaseEndDate, email) VALUES
 ('Jace Beleren', '(672)198-0186', '2020-11-29', '2024-06-29', 'jbeleren@gmail.com');

    
/* insert into tenant history */
INSERT INTO TenantHistory (tenantID, propertyId, moveInDate, moveOutDate, resNumber)
VALUES
    (1, 4, '2023-01-15', '2024-01-15', 1),
    (2, 4, '2023-02-01', '2024-02-01', 2),
    (3, 4, '2023-03-20', '2024-03-20', 3),
    (4, 5, '2023-01-20', '2024-01-20', 4),
    (5, 5, '2023-02-05', '2024-02-05', 5),
    (6, 5, '2023-03-25', '2024-03-25', 6),
    (7, 6, '2023-01-25', '2024-01-25', 7),
    (8, 6, '2023-02-10', '2024-02-10', 8),
    (9, 6, '2023-03-30', '2024-03-30', 9);
    
INSERT INTO TenantHistory (tenantID, propertyId, moveInDate, moveOutDate, resNumber) VALUES (10, 2,'2020-12-10','2024-02-22',11);
INSERT INTO TenantHistory (tenantID, propertyId, moveInDate, moveOutDate, resNumber) VALUES (11, 3,'2021-01-13','2024-04-22',12);


update tenantHistory set numberOfMembers = 1 where tHistoryId = 1;
update tenantHistory set numberOfMembers = 2 where tHistoryId = 2;
update tenantHistory set numberOfMembers = 2 where tHistoryId = 3;
update tenantHistory set numberOfMembers = 3 where tHistoryId = 4;
update tenantHistory set numberOfMembers = 1 where tHistoryId = 5;
update tenantHistory set numberOfMembers = 2 where tHistoryId = 6;
update tenantHistory set numberOfMembers = 3 where tHistoryId = 7;
update tenantHistory set numberOfMembers = 3 where tHistoryId = 8;
update tenantHistory set numberOfMembers = 2 where tHistoryId = 9;
update tenantHistory set numberOfMembers = 3 where tHistoryId = 10;
update tenantHistory set numberOfMembers = 5 where tHistoryId = 11;
    
/* insert into rentPayment */
INSERT INTO RentPayment (tenantId, propertyId, amount, paymentDate)
VALUES
    (1, 4, 1500.00, '2023-01-01'),
    (1, 4, 1500.00, '2023-02-01'),
    (2, 4, 1600.00, '2023-02-15'),
    (2, 4, 1600.00, '2023-03-15'),
    (3, 4, 1550.00, '2023-03-20'),
    (3, 4, 1550.00, '2023-04-20'),

    (4, 5, 1400.00, '2023-01-20'),
    (4, 5, 1400.00, '2023-02-20'),
    (5, 5, 1425.00, '2023-02-05'),
    (5, 5, 1425.00, '2023-03-05'),
    (6, 5, 1450.00, '2023-03-25'),
    (6, 5, 1450.00, '2023-04-25'),

    (7, 6, 1550.00, '2023-01-25'),
    (7, 6, 1550.00, '2023-02-25'),
    (8, 6, 1600.00, '2023-02-10'),
    (8, 6, 1600.00, '2023-03-10'),
    (9, 6, 1575.00, '2023-03-30'),
    (9, 6, 1575.00, '2023-04-30');
    
    INSERT INTO RentPayment (tenantId, propertyId, amount, paymentDate)
VALUES
	(10,2,890,'2024-03-15'),
    (11,3,1387,'2024-03-19'),
    (10,2,890,'2024-04-15'),
    (11,3,1387,'2024-04-20');
    
    INSERT INTO RentPayment (tenantId, propertyId, amount, paymentDate)
VALUES
    (1, 4, 1500.00, '2024-01-01'),
    (1, 4, 1500.00, '2024-02-01'),
    (1, 4, 1500.00, '2024-03-01'),
    
    (2, 4, 1600.00, '2024-01-15'),
    (2, 4, 1600.00, '2024-02-15'),
    (2, 4, 1600.00, '2024-03-15'),
    
    (3, 4, 1550.00, '2024-01-20'),
    (3, 4, 1550.00, '2024-02-20'),
	(3, 4, 1550.00, '2024-03-20'),

    (4, 5, 1400.00, '2024-01-20'),
    (4, 5, 1400.00, '2024-02-20'),
    (4, 5, 1400.00, '2024-03-20'),
    
	(5, 5, 1425.00, '2024-01-05'),
    (5, 5, 1425.00, '2024-02-05'),
    (5, 5, 1425.00, '2024-03-05'),
    
    (6, 5, 1450.00, '2024-01-25'),
    (6, 5, 1450.00, '2024-02-25'),
    (6, 5, 1450.00, '2024-03-25'),

    (7, 6, 1550.00, '2024-01-25'),
    (7, 6, 1550.00, '2024-02-25'),
    (7, 6, 1550.00, '2024-03-25'),
    
    (8, 6, 1600.00, '2024-01-10'),
    (8, 6, 1600.00, '2024-02-10'),
    (8, 6, 1600.00, '2024-03-10'),
    
    (9, 6, 1575.00, '2024-01-30'),
    (9, 6, 1575.00, '2024-02-28'),
    (9, 6, 1575.00, '2024-03-30'),
    
    (10,2,890,'2024-01-15'),
    (10,2,890,'2024-02-15'),
    
    (11,3,1387,'2024-01-20'),
    (11,3,1387,'2024-02-20');
    
    /* insert into expenses */
    INSERT INTO Expenses (propertyId, expenseType, amount, expenseDate, companyId)
VALUES
    (4, 'Utility', 500.00, '2023-01-10', 1),
    (4, 'Labor', 800.00, '2023-01-20', 1),
    (4, 'Insurance', 1200.00, '2023-02-01', 1),
    (4, 'Parts', 600.00, '2023-02-15', 1),
    (4, 'Mortgage', 2500.00, '2023-03-01', 1),

    (5, 'Utility', 450.00, '2023-01-15', 2),
    (5, 'Labor', 900.00, '2023-02-01', 2),
    (5, 'Insurance', 1100.00, '2023-02-10', 2),
    (5, 'Parts', 700.00, '2023-02-25', 2),
    (5, 'Mortgage', 2400.00, '2023-03-05', 2),

    (6, 'Utility', 480.00, '2023-01-20', 3),
    (6, 'Labor', 850.00, '2023-02-05', 3),
    (6, 'Insurance', 1150.00, '2023-02-15', 3),
    (6, 'Parts', 650.00, '2023-03-01', 3),
    (6, 'Mortgage', 2300.00, '2023-03-10', 3);
    
INSERT INTO expenses (propertyId, expenseType, amount, expenseDate, companyId, resNumber) VALUES
    (1, 'Utility', 375.00, '2024-01-23', 1, 10),
    (1, 'Labor', 825.00, '2024-02-25', 1, 10),
    (1, 'Insurance', 1175.00, '2024-02-17', 1, 10),
    (1, 'Parts', 700.00, '2024-03-11', 1, 10),
    (1, 'Mortgage', 2425.00, '2024-04-10', 1, 10),
    
    (2, 'Utility', 475.00, '2024-01-15', 2, 11),
    (2, 'Labor', 900.00, '2024-01-25', 2, 11),
    (2, 'Insurance', 1200.00, '2024-03-17', 2, 11),
    (2, 'Parts', 715.00, '2024-03-07', 2, 11),
    (2, 'Mortgage', 2330.00, '2024-02-22', 2, 11),
    
	(3, 'Utility', 400.00, '2024-03-15', '3', '12'),
    (3, 'Labor', 850.00, '2024-02-18', '3', '12'),
    (3, 'Insurance', 1125.00, '2024-03-23', '3', '12'),
    (3, 'Parts', 650.00, '2024-04-15', '3', '12'),
    (3, 'Mortgage', 2500.00, '2024-01-14', '3', '12');

insert into expenses (expenseType, amount, expenseDate, companyId) 
values ('Office Supplies', 500, '2024-03-20', 2);

/* filling out expenses more */
INSERT INTO expenses (propertyId, expenseType, amount, expenseDate, companyId, resNumber) VALUES
	/* January 2024 Property 1 */
    (1, 'Utility', 1175.00, '2024-02-23', 1, 10),
    (1, 'Labor', 825.00, '2024-02-25', 1, 10),
    (1, 'Mortgage', 1853.00, '2024-02-10', 1, 10),
    /* February 2024 Property 1 */
    (1, 'Labor', 1250.00, '2024-01-12', 1, 10),
    (1, 'Insurance', 1444.00, '2024-01-14', 1, 10),
    (1, 'Parts', 2145.00, '2024-01-26', 1, 10),
    (1, 'Mortgage', 2629.00, '2024-01-07', 1, 10),
    /* March 2024 Property 1 */
    (1, 'Utility', 2027.00, '2024-03-08', 1, 10),
    (1, 'Labor', 1091.00, '2024-03-11', 1, 10),
    (1, 'Insurance', 2688.00, '2024-03-10', 1, 10),
    (1, 'Mortgage', 2520.00, '2024-03-08', 1, 10),
    /* January 2024 Property 2 */
    (2, 'Insurance', 2827.00, '2024-01-13', 2, 11),
    (2, 'Parts', 2369.00, '2024-01-26', 2, 11),
    (2, 'Mortgage', 2551.00, '2024-01-10', 2, 11),
    /* February 2024 Property 2 */
	(2, 'Utility', 615.00, '2024-03-12', 2, 11),
    (2, 'Labor', 1175.00, '2024-03-08', 2, 11),
    (2, 'Mortgage', 1706.00, '2024-03-16', 2, 11),
    /* March 2024 Property 2 */
	(2, 'Utility', 434.00, '2024-02-26', 2, 11),
    (2, 'Labor', 919.00, '2024-02-10', 2, 11),
    (2, 'Insurance', 2228.00, '2024-02-16', 2, 11),
    (2, 'Parts', 1419.00, '2024-02-05', 2, 11),
    /* January 2024 Property 3 */
	(3, 'Utility', 640.00, '2024-01-02', '3', '12'),
    (3, 'Labor', 1443.00, '2024-01-28', '3', '12'),
    (3, 'Insurance', 1207.00, '2024-01-22', '3', '12'),
    (3, 'Parts', 733.00, '2024-01-21', '3', '12'),
    /* February 2024 Property 3 */
    (3, 'Utility', 950.00, '2024-02-11', '3', '12'),
    (3, 'Insurance', 1012.00, '2024-02-20', '3', '12'),
    (3, 'Parts', 743.00, '2024-02-09', '3', '12'),
    (3, 'Mortgage', 1041.00, '2024-02-07', '3', '12'),
    /* March 2024 Property 3 */
    (3, 'Labor', 2140.00, '2024-03-21', '3', '12'),
    (3, 'Parts', 1191.00, '2024-03-24', '3', '12'),
    (3, 'Mortgage', 1649.00, '2024-03-31', '3', '12')
    ;
    
        INSERT INTO Expenses (propertyId, expenseType, amount, expenseDate, companyId)
VALUES
	/* January 2024 Property 4 */
    (4, 'Utility', 818.00, '2024-01-11', 1),
    (4, 'Labor', 2096.00, '2024-01-25', 1),
    (4, 'Insurance', 1759.00, '2024-01-27', 1),
    (4, 'Parts', 2477.00, '2024-01-15', 1),
    (4, 'Mortgage', 1940.00, '2024-01-20', 1),
    /* February 2024 Property 4 */
    (4, 'Utility', 342.00, '2024-02-18', 1),
    (4, 'Labor', 1862.00, '2024-02-16', 1),
    (4, 'Insurance', 503.00, '2024-02-27', 1),
    (4, 'Parts', 1114.00, '2024-02-11', 1),
    (4, 'Mortgage', 1105.00, '2024-02-13', 1),
	/* March 2024 Property 4 */
    (4, 'Utility', 2116.00, '2024-03-01', 1),
    (4, 'Labor', 1928.00, '2024-03-17', 1),
    (4, 'Insurance', 1396.00, '2024-03-12', 1),
    (4, 'Parts', 1771.00, '2024-03-07', 1),
    (4, 'Mortgage', 777.00, '2024-03-30', 1),

	/* January 2024 Property 5 */
    (5, 'Utility', 375.00, '2024-01-18', 2),
    (5, 'Labor', 2244.00, '2024-01-11', 2),
    (5, 'Insurance', 1486.00, '2024-01-16', 2),
    (5, 'Parts', 400.00, '2024-01-20', 2),
    (5, 'Mortgage', 1094.00, '2024-01-26', 2),
	/* February 2024 Property 5 */
    (5, 'Utility', 1002.00, '2024-02-03', 2),
    (5, 'Labor', 988.00, '2024-02-15', 2),
    (5, 'Insurance', 2446.00, '2024-02-14', 2),
    (5, 'Parts', 1048.00, '2024-02-24', 2),
    (5, 'Mortgage', 744.00, '2024-02-28', 2),
	/* March 2024 Property 5 */
    (5, 'Utility', 1210.00, '2024-03-26', 2),
    (5, 'Labor', 2272.00, '2024-03-01', 2),
    (5, 'Insurance', 346.00, '2024-03-12', 2),
    (5, 'Parts', 422.00, '2024-03-14', 2),
    (5, 'Mortgage', 473.00, '2024-03-31', 2),

	/* January 2024 Property 6 */
    (6, 'Utility', 1842.00, '2024-01-27', 3),
    (6, 'Labor', 1731.00, '2024-01-12', 3),
    (6, 'Insurance', 2270.00, '2024-01-28', 3),
    (6, 'Parts', 2184.00, '2024-01-01', 3),
    (6, 'Mortgage', 1569.00, '2024-01-15', 3),
	/* February 2024 Property 6 */
    (6, 'Utility', 444.00, '2024-02-22', 3),
    (6, 'Labor', 1335.00, '2024-02-12', 3),
    (6, 'Insurance', 837.00, '2024-02-07', 3),
    (6, 'Parts', 1150.00, '2024-02-24', 3),
    (6, 'Mortgage', 1764.00, '2024-02-21', 3),
    /* March 2024 Property 6 */
    (6, 'Utility', 1095.00, '2024-03-26', 3),
    (6, 'Labor', 332.00, '2024-03-09', 3),
    (6, 'Insurance', 779.00, '2024-03-05', 3),
    (6, 'Parts', 1380.00, '2024-03-25', 3),
    (6, 'Mortgage', 1827.00, '2024-03-05', 3);