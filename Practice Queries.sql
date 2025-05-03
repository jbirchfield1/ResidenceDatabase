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

SELECT
    te.tHistoryId,
    t.tenantId,
    t.tenantName AS tenant_name,
    t.phoneNumber AS tenant_phone,
    t.email as tenant_email,
    te.moveInDate,
    te.moveOutDate,
    te.resNumber AS apartment_number,
    p.address AS property_address
FROM
    TenantHistory te
JOIN
    Tenants t ON te.tenantId = t.tenantId
JOIN
    Properties p ON te.propertyId = p.propertyId
WHERE
    te.resNumber = 11
ORDER BY
    te.moveInDate;
    
/* getting tenant information */
select
	residenceType,
    residences.resId,
    Tenants.tenantName,
    residences.mortgage,
    company.companyName as propertyOwner,
    tenantHistory.moveOutDate as moveOutDate,
    /*
    rentPayment.paymentDate as paymentDate,
    rentPayment.amount as rentAmount,
    rentPayment.paymentId as paymentNumber,
    */
    company.companyId as owningCompany,
    tenants.tenantId as tenantNum
from residences
inner join tenantHistory on tenantHistory.resNumber = residences.resId
inner join tenants on tenants.tenantId = tenantHistory.tenantId
inner join properties on residences.propertyId = properties.propertyId
inner join company on properties.companyId = company.companyId
/*inner join rentPayment on rentPayment.tenantId = tenants.tenantId*/
where  /*tenants.tenantId = 4 */ properties.propertyId = 4
/*order by paymentNumber ASC*/;


    



/*
fixing problems
delete from rentPayment where paymentId = 67,68,71,72,73,76,77,80;
*/
/* getting vacant properties */
SELECT
    p.propertyId,
    p.address,
    r.resId,
    r.numberOfRooms,
    r.numberOfBathrooms,
    r.squareFootage,
    r.residenceType
FROM
    properties p
    JOIN residences r ON p.propertyId = r.propertyId
    LEFT JOIN tenantHistory th ON r.propertyId = th.propertyId
        
WHERE
    p.companyId = 1
    AND th.moveOutDate IS NULL
    AND th.tHistoryId IS NULL;
    
/* selecting a specific company's expenses */
select
	expenseId,
    expenses.propertyId,
    expenseType,
    amount,
    expenseDate,
    companyName,
    company.companyId
from expenses
left join properties on expenses.propertyId = properties.propertyId
left join company on expenses.companyId = company.companyId
where company.companyId = 3;

/* all income and expenses for a property within a time range */
SELECT
    'Income' AS type,
    rp.amount AS amount,
    rp.paymentDate AS date,
    p.propertyId AS propertyId,
    p.address AS propertyAddress
FROM
    rentPayment rp
JOIN
    properties p ON rp.propertyId = p.propertyId
WHERE
    rp.propertyId = 4
    AND rp.paymentDate BETWEEN '2024-01-01' AND '2024-03-28'

UNION ALL

SELECT
    'Expense' AS type,
    e.amount AS amount,
    e.expenseDate AS date,
    p.propertyId AS propertyId,
    p.address AS propertyAddress
FROM
    expenses e
JOIN
    properties p ON e.propertyId = p.propertyId
WHERE
    e.propertyId = 4
    AND e.expenseDate BETWEEN '2024-01-01' AND '2024-03-28';
    
/* get all expenses categorized by type for a property within a date range grouped by month */
select
	expenses.expenseId,
    expenses.expenseType,
    expenses.propertyId,
    expenses.expenseDate
from expenses
where expenses.propertyId = 5 and expenses.expenseDate BETWEEN '2020-03-28' AND '2024-04-28'
order by month(expenses.expenseDate);

select 
	company.companyName as Company_Name,
    properties.address as address,
    residences.resId as resNumber,
    tenants.tenantName as tenantName,
    tenants.phoneNumber as tenantPhoneNumber,
    tenants.email as tenantEmail,
    residences.mortgage as rent_Amount
from tenants
    inner join tenantHistory on tenants.tenantId = tenantHistory.tenantID
	inner join residences on residences.resId = tenantHistory.resNumber
    inner join properties on residences.propertyId = properties.propertyId
    inner join company on properties.companyId = company.companyId
where properties.propertyId = 4 and tenantHistory.moveOutDate is null;


select
	company.companyName as companyName,
    properties.propertyType as propertyType,
    count(propertyType) as UnitCounts
from company
inner join properties on properties.companyId = company.companyId
group by companyName, propertyType
having propertyType = 'House';

insert into properties(companyId, propertyType, address) values 
	(1, 'House', '305 Acacia Street');
insert into residences(propertyId, purchaseDate, purchasePrice,  mortgage, numberOfRooms, numberOfBathrooms, squareFootage, residenceType) values 
	(7, '2020-03-28', 280000, 1750, 5, 3, 2200, 'House')
    