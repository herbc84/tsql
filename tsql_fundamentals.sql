-- WHERE CLAUSE pag 32
select orderid, empid, orderdate , freight
from sales.Orders
where custid = 71;

-- GROUP BY 
--pag 33
select empid, YEAR(orderdate) as orderYear
from sales.Orders
where custid = 71
group by empid, year(orderdate);

--pag 34
select empid, YEAR(orderdate) as orderYear, SUM(freight) as totalFreight, count(*) as numberOrders
from sales.Orders
where custid = 71
group by empid, year(orderdate);

--pag 35
select empid, YEAR(orderdate) as orderYear, COUNT(distinct custid) as custNums
from sales.Orders
group by empid, year(orderdate);

--pag 36 
select empid, year(orderdate)
from sales.Orders
where custid = 71
group by empid, year(orderdate)
having count(*) > 1;

--pag 38
select empid, year(orderdate) as orderYear, count(*) as orderNum
from sales.Orders
where custid = 71
group by empid, year(orderdate)
having count(*) > 1;
--order by empid, year(orderdate)

--pag 39
select empid, year(orderdate) as orderYear
from sales.Orders
where custid = 71
group by empid, year(orderdate);

--pag 40
select distinct empid, year(orderdate) as orderYear
from sales.Orders
where custid = 71
group by empid, year(orderdate);

--pag 41
select	orderid,
		year(orderdate) as orderYear,
		year(orderdate) + 1 nextYear
from Sales.Orders;

--pag 43 (invalid)
select distinct country 
from HR.Employees
order by empid;

--pag 44
select top (5) orderid, orderdate, custid, empid
from sales.Orders
order by orderdate desc;

--pag 45
select top (1) percent orderid, orderdate, custid, empid
from sales.Orders
order by orderdate desc;

--pag 47
select orderid, orderdate, custid, empid
from sales.orders
order by orderdate, orderid
offset 50 rows fetch next 25 rows only;

-- pag 50
select empid, firstname, lastname
from hr.Employees
where lastname like N'D%';

select orderid, empid, orderdate
from sales.Orders
where orderdate >= '20160101' and empid in (1, 3, 5);

select	orderid, 
		productid, 
		unitprice, 
		qty, 
		discount, 
		qty*unitprice*(1 - discount) as netValue
from sales.OrderDetails

-- pag 61
select name, description
from sys.fn_helpcollations()

-- pag 63
select empid, firstname + N' ' + lastname as fullName
from hr.Employees

--pag 64
select	custid, 
		country, 
		region, 
		city, 
		country + N', ' + region + N', ' + city as location
from sales.Customers

select	custid, 
		country, 
		region, 
		city, 
		country + COALESCE(N', ' + region, N'') + N', ' + city as location
from sales.Customers

/* concat supports NULL strings*/

select	custid, 
		country, 
		region, 
		city, 
		CONCAT(country, N', ' + region, N', ', city) as location
from sales.Customers

--pag 65 
select SUBSTRING('abcde', 1, 3);

select right('abcde', 3);

select LEN('abcde');

--pag 66
select len(N'abcde');

select datalength(N'abcde');

select datalength('abcde');

--pag 66
select CHARINDEX(' ', 'Itzik Ben-Gan');

select CHARINDEX(' ', 'Hernan Bustos');

select PATINDEX('%[0-9]%', 'abcdx567efg');

--pag 67
select REPLACE('1-a 2-a', '-',':')

select len('el chavo del ocho vale verga') - len(REPLACE('el chavo del ocho vale verga', 'a','')) 
as numeroTotaldeA

select	empid, lastname, 
		len(lastname) - len(REPLACE(lastname, 'e', ''))	as numOccurrences
from hr.Employees

select REPLICATE('abc', 3);

-- pag 68
select	supplierid, 
		right(REPLICATE('0', 9) + cast(supplierid as varchar(10)), 10) as strsupplierid
from Production.Suppliers;

select STUFF('xyz', 2, 1, 'abc');

-- pag 69
select UPPER('hernan bustos');
select LOWER('HERNAN BUSTOS');

select RTRIM(LTRIM('    abc    ')) as noTrims;

select FORMAT(supplierid, 'd10')
from Production.Suppliers;

--pag 70
select cast(DECOMPRESS(COMPRESS(N'my long cv')) as nvarchar(max)) as cv;

-- pag 71
select CAST(value as int) as myvalue
from string_split('1234,2345,3456', ',') as S;

select empid, firstname, lastname
from hr.Employees
where lastname like N'D%';

-- pag 72
select empid, lastname
from hr.Employees
where lastname like N'_e%';

select empid, lastname
from hr.Employees
where lastname like N'[ABC]%';

select empid, lastname
from hr.Employees
where lastname like N'[A-E]%';

-- pag 73
use Northwind;
select [CategoryID],[CategoryName],[Description],[Picture]
from dbo.Categories
where CategoryName like '%!/%' escape '!';

use TSQLV4;
-- pag 74
select orderid, custid, empid, orderdate
from Sales.Orders
where orderdate = '20160212';


--pag 75
select orderid, custid, empid, orderdate
from Sales.Orders
where orderdate = cast('20160212' as date);

set language british
select cast('2016-02-12' as datetime) as britishFormat;

select convert(date, '20160212', 103) as britishConvert;

select convert(date, '02/12/2016', 103) as britishConvert;

select parse('02/12/2016' as date using 'en-GB');
--
set language us_english
select cast('2016-02-12' as datetime) as usFormat;

select convert(datetimeoffset, '20160212', 101) as usConvert;

select convert(date, '02/12/2016', 101) as usConvert;

select parse('02/12/2016' as date using 'en-US');

-- pag 78
drop table if exists Sales.Orders2;

select orderid, custid, empid, cast(orderdate as datetime) as orderdate
into Sales.Orders2
from Sales.Orders;

select orderid, custid, empid, orderdate
from Sales.Orders2
where orderdate = '20160212';

--pag 79

alter table Sales.Orders2
add constraint CHK_Orders2_orderdate
check(convert(char(12), orderdate, 114) = '00:00:00:000');

select orderid, custid, empid, orderdate
from sales.Orders2
where	orderdate >= '20160212'
		and orderdate < '20160213';


select cast('12:30:15.123' as datetime);

drop table if exists Sales.Orders2;

select orderid, custid, empid, orderdate
from Sales.Orders
where year(orderdate) = 2015


-- pag 80
select orderid, custid, empid, orderdate
from Sales.Orders
where orderdate >= '20150101' and orderdate < '20160101';

select orderid, custid, empid, orderdate
from Sales.Orders
where year(orderdate) = 2016 and MONTH(orderdate) = 2;

select orderid, custid, empid, orderdate
from Sales.Orders
where orderdate >= '20160201' and orderdate < '20160301';

select
	GETDATE()				AS [GETDATE],
	CURRENT_TIMESTAMP		AS [CURRENT_TIMESTAMP],
	GETUTCDATE()			AS [GETUTCDATE],
	SYSDATETIME()			AS [SYSDATETIME],
	SYSUTCDATETIME()		AS [SYSUTCDATETIME],
	SYSDATETIMEOFFSET()		AS [SYSDATETIMEOFFSET];

select cast(SYSDATETIME() as date) as [Current_date];
select cast(SYSDATETIME() as time) as [Current_time];

-- pag 82
select cast('20160212' as date);

select cast(SYSDATETIME() as date);

select convert(char(8), CURRENT_TIMESTAMP, 112);

select convert(datetime, (convert(char(8), CURRENT_TIMESTAMP, 112)), 112);
select convert(datetime, convert(char(8), current_timestamp, 112), 112);

select convert(char(12), current_timestamp, 114);

select convert(datetime, convert(char(12), current_timestamp, 114), 114);

select SYSDATETIMEOFFSET();

select SWITCHOFFSET(SYSDATETIMEOFFSET(), '+01:00');

select TODATETIMEOFFSET('2020-10-01 07:15:30.123', '+05:00');

--yyyy-mm-dd hh:mi:ss.mmm

-- pag 84
select name, current_utc_offset, is_currently_dst
from sys.time_zone_info;

select cast('20160201 10:10:10.1234567' as datetime2) at time zone 'Pacific Standard Time' as val1;

select cast('20160801 10:10:10.1234567' as datetime2) at time zone 'Pacific Standard Time' as val1;

-- pag 86

select cast('19840713 00:00:00.000' as datetime)

select datediff(DAY, '19840713', CURRENT_TIMESTAMP) as diasDeVida; 

select DATEDIFF_BIG(millisecond, '00010101', current_timestamp);

select DATEADD(day, datediff(DAY, '19000101', SYSDATETIME()), '19000101');

select DATEADD(month, datediff(month, '19000101', SYSDATETIME()), '19000101');

select DATEADD(year, datediff(year, '19000101', SYSDATETIME()), '19000101');

select DATEADD(year, datediff(year, '19001231', SYSDATETIME()), '19001231');

select DATEADD(month, datediff(month, '19001231', SYSDATETIME()), '19001231');

select DATEADD(day, datediff(DAY, '19000101', '19840713'), '19000101');

select dateadd(month, datediff(MONTH, '19000501', '19840501'), '19000501');

-- pag 87

select DATEPART(year, CURRENT_TIMESTAMP);
select DATEPART(MONTH, CURRENT_TIMESTAMP);
select DATEPART(DAYOFYEAR, CURRENT_TIMESTAMP);

select DATEPART(DAYOFYEAR, '19790913');
select DATEPART(DAYOFYEAR, '19840713') as yoNaci;

select DATEPART(WEEKDAY, '19840713'); --5 viernes

select DATEPART(WEEKDAY, '20221002'); --7 domingo

select DATEPART(NANOSECOND, CURRENT_TIMESTAMP);

-- pag 88
select	day(CURRENT_TIMESTAMP) as theDay, 
		MONTH(CURRENT_TIMESTAMP) as theMonth,
		YEAR(CURRENT_TIMESTAMP) as theYear;

select DATENAME(MONTH, CURRENT_TIMESTAMP);

select DATENAME(year, CURRENT_TIMESTAMP);

select ISDATE('20160201');

select ISDATE('20160230');

-- pag 89
select EOMONTH(CURRENT_TIMESTAMP);

select orderid, orderdate, custid, empid
from sales.Orders
where orderdate = EOMONTH(orderdate);

select eomonth(current_timestamp, -15);

--pag 90
use AdventureWorks2014
select SCHEMA_NAME(schema_id) schemasNames, name as tablesNames
from sys.tables
order by schemasNames, tablesNames;


select	
		name, 
		type_name(system_type_id) as type,
		max_length, 
		collation_name, 
		is_nullable		
from sys.columns 
where object_id = OBJECT_ID(N'Sales.Orders');

-- pag 92

use tsqlv4;
exec sys.sp_tables;

exec sys.sp_help;

exec sys.sp_helpconstraint @objname = N'Sales.Customers';

exec sys.sp_columns @table_name = N'Customers', @table_owner = 'Sales';

select SERVERPROPERTY('ProductLevel');

select databasepropertyex(N'TSQLV4','collation');

select OBJECTPROPERTY(OBJECT_ID(N'Sales.Orders'), 'TableHasPrimaryKey');

select COLUMNPROPERTY(OBJECT_ID(N'Sales.Orders'), N'shippeddate', 'AllowsNull');

-- pag 93 
-- ************EXERCISES CHAPTER 2************

-- EXERCISE 1
-- write a query against the Sales.Orders table that returns the orders placed in June 2015:
select orderid, orderdate, custid, empid
from Sales.Orders
where orderdate >= '20150601' and orderdate < '20150701';

-- EXERCISE 2
-- write a query against the Sales.Orders table that returns orders placed on the last day of the month:
select orderid, orderdate, custid, empid
from Sales.Orders
where orderdate = eomonth(orderdate);

select dateadd(MONTH, datediff(MONTH, '18991031', '20221031'), '18991031')

select orderid, orderdate, custid, empid
from Sales.Orders
where orderdate = dateadd(MONTH, datediff(MONTH, '18991031', orderdate), '18991031');


-- EXERCISE 3
-- write a query against HR.Employees table that returns employees with last name containing the 
-- letter e twice or more:
select empid, firstname, lastname
from HR.Employees
where len(lastname) - len(replace(lastname, N'e', '')) >= 2;

select empid, firstname, lastname
from HR.Employees
where lastname like N'%e%e%';


-- EXERCISE 4
-- write a query against the Sales.OrderDetails table that returns orders with a total value 
-- (quantity*unitprice) greater than 10,000 sorted by total value:

select orderid, sum(qty*unitprice) as totalValue
from Sales.OrderDetails
--where qty*unitprice > 10000
group by orderid
having sum(qty*unitprice) > 10000
order by totalValue desc;


-- EXERCISE 5
-- to check the validity of the data, write a query against the HR.Employees table that returns employees
-- with the last name that starts with a lowercase English letter in the range a through z. Remember that the
-- collation of the sample database is case insensitive(Latin1_General_CI_AS):

select empid, lastname
from HR.Employees
where lastname collate Latin1_General_CS_AS like N'[abcdefghijklmnopqrstuvwxyz]%';

-- EXERCISE 6
-- Explain the differences between the following two queries:

-- Query 1
SELECT empid, COUNT(*) as numorders
FROM Sales.Orders
WHERE orderdate < '20160501'
GROUP BY empid;

-- Query 2
SELECT empid, COUNT(*) as numorders
FROM Sales.Orders
GROUP BY empid--, orderdate
HAVING MAX(orderdate) < '20160501';

select empid, count(*)
FROM Sales.Orders
GROUP BY empid--, orderdate

-- EXERCISE 7
-- write a query against the Sales.Orders table that returns the three shipped-to-countries with 
-- the highest average freight in 2015:

select top(3) shipcountry, avg(freight) as avgfreight 
from sales.Orders
where shippeddate >= '20150101' and shippeddate < '20160101'  --year(shippeddate) = 2015
group by shipcountry
order by avgfreight desc;

select shipcountry, avg(freight) as avgfreight 
from sales.Orders
where shippeddate >= '20150101' and shippeddate < '20160101'  --year(shippeddate) = 2015
group by shipcountry
order by avgfreight desc
offset 0 rows fetch next 3 rows only;


-- EXERCISE 8
-- write a query against the Sales.Orders table that calculates row numbers for orders
-- based on order date ordering (using the order ID as the tiebreaker (desempate)) for each customer separately:

select	custid, 
		orderdate, 
		orderid,  
		row_number() over(partition by custid order by orderdate, orderid) as rownum
from Sales.Orders
order by custid, rownum

-- EXERCISE 9
-- Using the HR.Employees table, write a SELECT statement that returns for each eployee the gender 
-- based on the title of courtesy. For 'Ms.' and 'Mrs.' return 'Female'; for 'Mr.' return 'Male';
-- and in all other cases (for example, 'Dr.') return 'Unknown':

select	empid, 
		firstname, 
		lastname, 
		titleofcourtesy,
		case titleofcourtesy
			when 'Ms.' then 'Female'
			when 'Mrs.' then 'Female'
			when 'Mr.' then 'Male'
			else 'Unknown'
		end
		as gender
from HR.Employees

select	empid, 
		firstname, 
		lastname, 
		titleofcourtesy,
		case 
			when titleofcourtesy in('Ms.', 'Mrs.') then 'Female'			
			when titleofcourtesy = 'Mr.' then 'Male'
			else 'Unknown'
		end
		as gender
from HR.Employees

-- EXERCISE 10
-- Write a query against the Sales.Customers table that returns for each customer the customer ID and
-- region. Sort rows in the output by region having NULLs sort last (after non-NULL values). Note that
-- the default sort behavior for NULLs in T-SQL is to sort first (before non-NULL values):

select custid, region
from Sales.Customers
order by 
		case
			when region is not null then 0
			else 1
		end,

		region

-- pag 104
use TSQLV4;
select C.custid, E.empid
from Sales.Customers as C
cross join HR.Employees as E;

-- pag 105

select C.custid, E.empid
from Sales.Customers as C, HR.Employees as E;

select	E1.empid, E1.firstname, E1.lastname,
		E2.empid, E2.firstname, E2.lastname
from HR.Employees as E1 
cross join HR.Employees as E2;

-- pag 106
use TSQLV4;

drop table dbo.Digits if exists;

create table dbo.Digits (
	digit int primary key
);

insert into dbo.Digits (digit) values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

select D1.digit + D2.digit*10 + D3.digit*100 + 1 as n
from dbo.Digits as D1
cross join dbo.Digits as D2
cross join dbo.Digits as D3
order by n;


select D1.digit as D1, D2.digit as D2, D3.digit as D3, (D1.digit + 1) + D2.digit*10 + D3.digit*100
from dbo.Digits as D1
cross join dbo.Digits as D2
cross join dbo.Digits as D3;

select D1.digit + D2.digit*10 + D3.digit*100 + D4.digit*1000 + D5.digit*10000 + D6.digit*100000  + 1 as n
from dbo.Digits as D1
cross join dbo.Digits as D2
cross join dbo.Digits as D3
cross join dbo.Digits as D4
cross join dbo.Digits as D5
cross join dbo.Digits as D6
order by n;

-- pag 107
select E.empid, E.firstname, E.lastname, O.orderid
from	Sales.Orders AS O inner join
		HR.Employees AS E 
		ON E.empid = O.empid;

-- pag 110
use TSQLV4;

drop table if exists Sales.OrderDetailsAudit;

create table OrderDetailsAudit(
	lsn			int not null identity,
	orderid		int not null,
	productid	int not null,
	dt			datetime not null,
	loginname	sysname not null, 
	columnname	sysname not null,	-- equivalent to nvarchar(128), not nullable, used for store object names.
	oldval		sql_variant,		-- support values of other data types
	newval		sql_variant,
	constraint	PK_OrderDetailsAudit PRIMARY KEY(lsn),
	constraint	FK_OrderDetailsAudit_OrderDetails
	foreign key	(orderid, productid)
	references	Sales.OrderDetails(orderid, productid)
);

select	OD.orderid, OD.productid, OD.qty,
		ODA.dt, ODA.logginname, ODA.oldval, ODA.newval
from	Sales.OrderDetailsAudit as ODA 
		inner join Sales.OrderDetails as OD
		on	ODA.orderid = OD.orderid
		and	ODA.productid = OD.productid
		where ODA.columnname = N'qty';

-- pag 111
select		E1.empid, E1.lastname, E1.firstname,
			E2.empid, E2.lastname, E2.firstname
from		HR.Employees as E1
inner join	HR.Employees as E2
on			E1.empid < E2.empid;

-- pag 113
select		C.custid, C.companyName, O.orderid, OD.productid, OD.qty
from 		Sales.Customers 	as C
inner join 	Sales.Orders 		AS O
on 			C.custid = o.custid
inner join	Sales.OrderDetails 	as OD
on 			O.orderid = OD.orderid;

-- pag 114
select C.custid, C.companyname, O.orderid
from Sales.Customers as C
left outer join Sales.Orders as O
on C.custid = O.custid;

-- pag 116

select C.custid, C.companyname
from Sales.Customers as C
left outer join Sales.Orders as O
on C.custid = O.custid
where O.orderid is null;


-- pag 117
select *
from [dbo].[Nums]


select DATEDIFF(day, '20140101', '20161231');

SELECT	DATEADD(day, Nums.n - 1, cast('20140101' AS DATE )) AS orderdate,
		O.orderid, O.custid, O.empid

FROM dbo.Nums left outer join Sales.Orders AS O
ON DATEADD(day, Nums.n - 1, cast('20140101' AS DATE )) = O.orderdate
WHERE Nums.n <= DATEDIFF(day, '20140101', '20161231') + 1
ORDER BY orderdate;

-- pag 120
-- Problem
select C.custid, O.orderid, OD.productid, OD.qty
from Sales.Customers as C 
left outer join Sales.Orders as O
on C.custid = O.custid
inner join Sales.OrderDetails as OD
on O.orderid = OD.orderid;

-- Solution 1:
select C.custid, O.orderid, OD.productid, OD.qty
from Sales.Customers as C 
left outer join Sales.Orders as O
on C.custid = O.custid
left outer join Sales.OrderDetails as OD
on O.orderid = OD.orderid;

-- Solution 2:
select C.custid, O.orderid, OD.productid, OD.qty
from Sales.Orders as O
inner join Sales.OrderDetails as OD
on O.orderid = OD.orderid
right outer join Sales.Customers as C 
on O.custid = C.custid;

-- Solution 3:
select C.custid, O.orderid, OD.productid, OD.qty
from Sales.Customers as C 
left outer join (
	Sales.Orders as O
	inner join Sales.OrderDetails as OD
	on O.orderid = OD.orderid
)
on C.custid = O.custid;

-- pag 122
select C.custid, count(O.orderid) ordernumbers
from Sales.Customers as C
left outer join Sales.Orders as O
on C.custid = O.custid
group by C.custid;

-- ************EXERCISES************** CHAPTER 2
-- Exercise 1 - 1
-- Write a query that generates five copies of each employee row:
-- Tables involved: HR.Employees and dbo.Nums

select E.empid, E.firstname, E.lastname, N.n
from HR.Employees as E 
cross join dbo.Nums as N
where n <= 5;

--order by n, E.empid


-- Exercise 1 - 2
-- Write a query that returs a row for each employee and day in the range June 12, 2016 through June 16, 2016:
-- Tables involved: HR.Employees and dbo.Nums
select E.empid, DATEADD(day, N.n - 1, cast('20160612' as date)) as dt
from dbo.Nums as N
cross join HR.Employees as E
where n <= DATEDIFF(day, '20160612', '20160616') + 1
order by E.empid;

-- Exercise 2
-- Explain what's wrong in the following query, and provide a correct alternative:
select Customers.custid, Customers.companyname, Orders.orderid, Orders.orderdate
from Sales.Customers as C
inner join sales.Orders as o 
on Customers.custid = Orders.custid;

-- my alternative
select C.custid, C.companyname, O.orderid, O.orderdate
from Sales.Customers as C
inner join sales.Orders as o 
on C.custid = O.custid;

-- Exercise 3
-- Return US customers, and for each customer return the total number of orders and total quantities:
-- tables involved: Sales.Customers, Sales.Orders, and Sales.OrdersDetails

select C.custid, count (distinct O.orderid) as numorders, SUM(OD.qty) as totalqty
from Sales.Customers as C
inner join Sales.Orders as O
on C.custid = O.custid
inner join Sales.OrderDetails as OD
on O.orderid = OD.orderid
where C.country like N'USA' 
group by C.custid
order by C.custid;

-- Exercise 4
-- Return customers and their orders, including customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders

select C.custid, C.companyname, O.orderid, O.orderdate
from Sales.Customers as C
left outer join Sales.Orders as O
on C.custid = O.custid;

-- Exercise 5
-- Return customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders
select C.custid, C.companyname
from Sales.Customers as C
left outer join Sales.Orders as O
on C.custid = O.custid
where O.orderid is null;

-- Execise 6
-- Return customers with orders placed on February 12, 2016, along with their orders:
-- Tables involved: Sales.Customers and Sales.Orders

select C.custid, C.companyname, O.orderid, O.orderdate
from Sales.Customers as C
inner join Sales.Orders as O
on C.custid = O.custid
where O.orderdate = '20160212';

-- Exercise 7
-- Write a query that returns all customers in the output, but matches them with their respective orders
-- only if they were placed on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders
select C.custid, C.companyname, O.orderid, O.orderdate
from Sales.Customers as C
left outer join Sales.Orders as O
on cast('20160212' as date) = O.orderdate
and C.custid = O.custid
order by C.companyname;

-- Exercise 8
-- Explain why the following query isn't a correct solution query for Exercise 7:

select C.custid, C.companyname, O.orderid, O.orderdate
from Sales.Customers as C
left outer join Sales.Orders as O
on O.custid = C.custid
where O.orderdate = '20160212'
or O.orderid is null;

/*left outer join non preserved side table Orders has outer and inner rows.
outer rows have NULL value in where clause so comparing with the structure
NULL operator value returns UNKNOWN values filtered by where*/

-- Exercise 9
-- Return all customers, and for each return a Yes/No value depending on whether the customer placed 
-- orders on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders
select distinct C.custid, C.companyname, 
		case
			when O.orderdate is null then 'No'
			else 'Yes'
		end
		as HasOrderOn20160212
from Sales.Customers as C
left outer join Sales.Orders as O
on cast('20160212' as date) = O.orderdate
and C.custid = O.custid
order by C.custid;

-- pag 134
use tsqlv4;

declare @maxid as int = (select MAX(O.orderid)
						from Sales.Orders as O);
--print @maxid

select orderid, orderdate, custid, empid
from Sales.Orders
where orderid = @maxid;

select orderid, orderdate, custid, empid
from Sales.Orders
where orderid = (select MAX(O.orderid)
				from Sales.Orders as O);

-- pag 135
select O.orderid
from Sales.Orders as O
where O.empid = (
					select E.empid
					from HR.Employees as E
					where E.lastname like N'C%'
				);


select O.orderid
from Sales.Orders as O
where O.empid = (
					select E.empid
					from HR.Employees as E
					where E.lastname like N'D%'
				);


select O.orderid
from Sales.Orders as O
where O.empid = (
					select E.empid
					from HR.Employees as E
					where E.lastname like N'A%'
				);

-- pag 136
select O.orderid
from Sales.Orders as O
inner join HR.Employees as E
on O.empid = E.empid
where lastname like N'D%';

-- pag 137

select orderid
from Sales.Orders
where custid in (
					select C.custid
					from Sales.Customers as C
					where C.country like N'USA'
				);

select custid, companyname
from Sales.Customers
where custid not in (
						select O.custid
						from Sales.Orders as O
					);

use TSQLV4;

drop table if exists dbo.Orders;

create table dbo.Orders
(
	orderid int not null CONSTRAINT PK_ORDERS PRIMARY KEY
);

insert into dbo.Orders (orderid)
select O.orderid
from Sales.Orders as O
where O.orderid % 2 = 0;

select *
from dbo.Orders

select min(orderid)
from dbo.Orders

select max(orderid)
from dbo.Orders


select n 
from dbo.Nums
where		n between 
			(
				select min(orderid)
				from dbo.Orders
			)
			and 			
			(
				select max(orderid)
				from dbo.Orders
			)
			and n not in
			(
				select orderid
				from dbo.Orders
			);

-- pag 139
select custid, orderid, orderdate, empid
from Sales.Orders as O1
where O1.orderid =	(
						select max(O2.orderid)
						from Sales.Orders as O2
						where O2.custid = O1.custid
					);

select max(O2.orderid)
from Sales.Orders as O2
where O2.custid = 85;

-- pag 141

select	orderid, 
		custid, 
		val,
		cast(
			100 * val / 
			(select sum(O2.val)
			from Sales.OrderValues as O2
			where O2.custid = O1.custid)
		as numeric(5,2)) as pct
from Sales.OrderValues as O1
order by custid, orderid;

-- pag 141, 142
select custid, companyname
from Sales.Customers as C
where C.country like N'Spain'
and exists(
	select *
	from Sales.Orders as O
	where O.custid = C.custid
);

select custid, companyname
from Sales.Customers as C
where C.country like N'Spain'
and not exists(
	select *
	from Sales.Orders as O
	where O.custid = C.custid
);

-- pag 143
select orderid, orderdate, empid, custid,
		(
			select max(orderid)
			from Sales.Orders as O2
			where O2.orderid < O1.orderid
		) as prevorderid
from Sales.Orders as O1;

-- pag 144
select orderid, orderdate, empid, custid,
		(
			select max(orderid)
			from Sales.Orders as O2
			where O2.orderid > O1.orderid
		) as nextorderid
from Sales.Orders as O1;

-- pag 145
select	orderyear, qty,
		(
			select sum(O2.qty)
			from Sales.OrderTotalsByYear as O2
			where O2.orderyear <= O1.orderyear
		) as runqty
	
from Sales.OrderTotalsByYear as O1
order by orderyear;


select custid, companyname
from Sales.Customers 
where custid not in 
					(
						select O.custid
						from Sales.Orders O
					);

-- pag 146
insert into Sales.Orders(custid, empid, orderdate, requireddate, shippeddate, shipperid, 
			freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)

values(null, 1, '20160212', '20160212', '20160212', 1, 123.00, N'abc', N'abc', N'abc', N'abc', N'abc', N'abc');

select custid, companyname
from Sales.Customers 
where custid not in 
					(
						select O.custid
						from Sales.Orders O
						where O.custid is not null
					);

select custid, companyname
from Sales.Customers as C
where not exists 
					(
						select *
						from Sales.Orders O
						where O.custid = C.custid
					);

delete from Sales.Orders where custid is null;
select * from Sales.Orders;

-- pag 147
drop table if exists Sales.MyShippers;

create table Sales.MyShippers(
	shipper_id int not null,
	companyname nvarchar(40) not null,
	phone nvarchar(24) not null
	constraint PK_MyShippers PRIMARY KEY(shipper_id)
);

insert into Sales.MyShippers(shipper_id, companyname, phone)
values	(1, N'Shipper GVSUA', N'(503) 555-0137'),
		(2, N'Shipper ETYNR', N'(425) 555-0136'),
		(3, N'Shipper ZHISN', N'(415) 555-0138');

select shipper_id, companyname
from Sales.MyShippers
where shipper_id in
	(
		select O.shipperid
		from Sales.Orders as O
		where custid = 43
	);
		
-- pag 150 **************CHAPTER 4 EXERCISES***************

-- EXERCISE 1
-- Write a query that returns all orders placed on the last day of activity that can be found 
-- in the Orders table:
-- Table involved: Sales.Orders

select orderid, orderdate, custid, empid
from Sales.Orders
where orderdate in	(
						select max(O.orderdate)
						from Sales.Orders as O
					);

-- EXERCISE 2
-- Write a query that returns all orders placed by the customer(s) who placed the highest number
-- of orders. Note that more than one customer might have the same number of orders:
-- Table involved: Sales.Orders

select custid, orderid, orderdate, empid
from Sales.Orders
where custid = 
	(
		select custid
		from (
				select top(1) with ties custid, count(*) as ordnums
				from Sales.Orders as O
				group by custid
				order by ordnums desc
			 ) as custidmaxorders
	);

	-- alternativa
select custid, orderid, orderdate, empid
from Sales.Orders
where custid = 
				(	
					select top(1) with ties O.custid
					from Sales.Orders as O
					group by custid
					order by count(*) desc
				);


-- EXERCISE 3
-- Write a query that returns employees who did not place orders on or after May 1, 2016:
-- Tables involved: HR.Employees and Sales.Orders

select empid, firstname, lastname
from HR.Employees 
where empid not in	(
						select O.empid
						from Sales.Orders O
						where O.orderdate >= '20160501'
					);

-- EXERCISE 4
-- Write a query that returns countries where there are customers but not employees:
-- Tables involved: Sales.Customers and HR.Employees

select distinct country
from Sales.Customers 
where country not in(
						select E.country
						from HR.Employees as E
					);

-- EXERCISE 5
-- Write a query that returns for each customer all orders placed on the customer's las day of activity:
-- Table involved: Sales.Orders

select custid, orderid, orderdate, empid
from Sales.Orders as O1
where orderdate in	(
						select max(O2.orderdate) 
						from Sales.Orders as O2
						where O2.custid = O1.custid
					)
order by custid;


-- EXERCISE 6
-- Write a query that returns customers who placed orders in 2015 but not in 2016:
-- Tables involved: Sales.Customers and Sales.Orders

select custid, companyname
from Sales.Customers
where custid in	(
					select O.custid
					from Sales.Orders as O
					where O.orderdate >= '20150101' and O.orderdate < '20160101'
				)
				and
				custid not in
				(
					select O.custid
					from Sales.Orders as O
					where O.orderdate >= '20160101' and O.orderdate < '20170101'
				);

-- alternativa
select custid, companyname
from Sales.Customers as C
where		exists(
				select *
				from Sales.Orders as O
				where O.custid = C.custid  and (O.orderdate >= '20150101' and O.orderdate < '20160101')
			)
			and
			not exists
			(
				select *
				from Sales.Orders as O
				where O.custid = C.custid  and (O.orderdate >= '20160101' and O.orderdate < '20170101')
			);

-- EXERCISE 7
-- Write a query that returns customers who ordered product 12:
-- Tables involved: Sales.Customers, Sales.Orders, and Sales.OrderDetails

select custid, companyname
from Sales.Customers
where custid in (
					select O.custid
					from Sales.Orders as O
					where O.orderid in	(
											select OD.orderid
											from Sales.OrderDetails as OD
											where OD.productid = 12
										)
				);

-- alternativa
select custid, companyname
from Sales.Customers as C
where exists (
					select *
					from Sales.Orders as O
					where O.custid = C.custid and exists	(
											select *
											from Sales.OrderDetails as OD
											where od.orderid = O.orderid and OD.productid = 12
										)
				);


-- EXERCISE 8
-- Write a query that calculates a running-total quantity for each customer and month:
-- View involved: Sales.CustOrders

-- custid, ordermonth, qty, runqty
select custid, ordermonth, qty,
		(
			select sum(O2.qty)
			from Sales.CustOrders as O2
			where (O2.ordermonth <= O1.ordermonth) and (O2.custid = O1.custid)
		) as runqty
from Sales.CustOrders as O1
order by custid, ordermonth;

-- EXERCISE 9
-- Explain the difference between IN and EXISTS
-- IN uses three-valued logic: true, false, unknown
-- EXISTS uses two-valued logic: true, false
-- NOT EXISTS delete NULL implicity

-- EXERCISE 10
-- Write a query that returns for each order the number of days that passed since the same customer's 
-- previous order. To determine recency among orders, use orderdate as the primary sort element and
-- orderid as the tiebreaker:
-- Table involved: Sales.Orders

-- custid, orderdate, orderid, diff

select custid, orderdate, orderid,	
		(
			select top(1) O2.orderdate
			from Sales.Orders as O2
			where O2.custid = O1.custid and 
			(O2.orderdate = O1.orderdate and O2.orderdate < O1.orderdate or O2.orderid < O1.orderid )
			order by O2.orderdate desc, O2.orderid desc
		) as prevdate
from Sales.Orders as O1
order by custid, orderdate, orderid;

-- complete
select custid, orderdate, orderid,
	
	DATEDIFF(day,
		(
			select top(1) O2.orderdate
			from Sales.Orders as O2
			where O2.custid = O1.custid and 
			(O2.orderdate = O1.orderdate and O2.orderdate < O1.orderdate or O2.orderid < O1.orderid )			
			order by O2.orderid desc, O2.orderid desc
		)			
		,orderdate) as diff
from Sales.Orders as O1
order by custid, orderdate, orderid;

--pag 161
use TSQLV4;

select *
from 
	(
		select custid, companyname
		from Sales.Customers as C
		where c.country like N'USA'

	) as usacustomers;

-- pag 163
select orderyear, count(distinct custid) as numcusts
from
	(select year(orderdate) as orderyear, custid 
	from sales.Orders) as D
group by orderyear;


-- pag 164
select year(orderdate) as orderyear, count(distinct custid) as custnums
from sales.orders
group by year(orderdate);


select orderyear, count(distinct custid) as custnums
from
	(select year(orderdate), custid
	from Sales.Orders) as D(orderyear, custid)
group by orderyear;

--
declare @empid as int = 3;

select orderyear, count(distinct custid) as numcusts
from
	(select year(orderdate) as orderyear, custid
	from sales.Orders
	where empid = @empid) as D
group by orderyear;

-- pag 165
select orderyear, numcusts
from(
		select orderyear, count(distinct custid) as numcusts
		from
			(
				select year(orderdate) as orderyear, custid 
				from sales.Orders
			) as D1
		group by orderyear
	) as D2
where numcusts > 70;

-- pag 166
select year(orderdate) as orderyear, count(distinct custid) as numcusts
from sales.Orders
group by year(orderdate) 
having count(distinct custid) > 70;

-- 
select year(orderdate) as orderyear, count(distinct custid) as custnums
from sales.Orders
group by year(orderdate)


select	cur.orderyear,
		cur.custnums, prv.custnums, cur.custnums - prv.custnums as growth
from 
	(
		select year(orderdate) as orderyear, count(distinct custid) as custnums
		from sales.Orders
		group by year(orderdate)
	) as cur
	left outer join
	(
		select year(orderdate) as orderyear, count(distinct custid) as custnums
		from sales.Orders
		group by year(orderdate)
	) as prv
	on cur.orderyear = prv.orderyear + 1;


-- pag 167
with usacusts as 
(
	select custid, companyname
	from sales.Customers
	where country = N'USA'
)
select * from usacusts;

-- pag 168
with C as 
(
	select year(orderdate) as orderyear, custid
	from Sales.Orders
)
select orderyear, count(distinct custid) as numcusts
from C
group by orderyear;

--

with C(orderyear, custid) as 
(
	select year(orderdate) as orderyear, custid
	from Sales.Orders
)
select orderyear, count(distinct custid) as numcusts
from C
group by orderyear;

--
declare @empid2 as int = 3;

with C(orderyear, custid) as 
(
	select year(orderdate) as orderyear, custid
	from Sales.Orders
	where empid = @empid2
)
select orderyear, count(distinct custid) as numcusts
from C
group by orderyear;

-- pag 169
with C1 as
(
	select year(orderdate) as orderyear, custid
	from Sales.Orders
),
C2 as
(
	select orderyear, count(distinct custid) as numcusts
	from C1
	group by orderyear
)
select orderyear, numcusts
from C2
where numcusts > 70;

-- 
with yearlycount as 
(
	select year(orderdate) as orderyear, count(distinct custid) as numcusts
	from Sales.Orders
	group by year(orderdate)
)

select	cur.orderyear,
		cur.numcusts as curnumcusts,
		prv.numcusts as prvnumcusts,
		cur.numcusts - prv.numcusts as growt
from yearlycount as cur left join yearlycount as prv
on cur.orderyear = prv.orderyear + 1;


--pag 170

with CTEemp as
(
	select empid, mgrid, firstname, lastname
	from HR.Employees
	where empid = 2

	union all

	select E.empid, E.mgrid, E.firstname, E.lastname
	from CTEemp as C inner join HR.Employees as E
	on E.mgrid = C.empid
)

select empid, mgrid, firstname, lastname
from CTEemp

option(maxrecursion 0);

-- pag 172
drop view if exists Sales.USACusts
go

create view Sales.USACusts 
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
go

select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
from Sales.USACusts;

-- pag 175
select custid, companyname, region
from Sales.USACusts
order by region;
go 

alter view Sales.USACusts /*error*/
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
	order by region;
go

--
alter view Sales.USACusts
as
	select	top(100) percent custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
	order by region;
go

--
alter view Sales.USACusts
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
	order by region
	offset 0 rows;
go

-- pag 176

alter view Sales.USACusts 
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
go

select OBJECT_DEFINITION(OBJECT_ID('Sales.USACusts'));
go

alter view Sales.USACusts with encryption
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
go

exec sp_helptext 'Sales.USACusts';
go
--
alter view Sales.USACusts with schemabinding
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
go

alter table Sales.Customers drop column address;

-- 
insert into Sales.USACusts (companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax)
values(	N'Customer ABCD', N'Contact ABCD', N'Title ABCD', N'Address ABCD', N'London', 
		Null, N'12345', N'UK', N'012-3456789', N'012-3456789');
go

select custid, companyname, country
from sales.USACusts
where companyname = N'Customer ABCD';
go

select custid, companyname, country
from sales.Customers
where companyname = N'Customer ABCD';
go

alter view Sales.USACusts with schemabinding
as
	select	custid, companyname, contactname, contacttitle, address, 
			city, region, postalcode, country, phone, fax
	from Sales.Customers
	where country = N'USA'
	with check option;
go

delete from Sales.Customers
where custid > 91;

drop view if exists Sales.USACusts;

-- pag 179

use tsqlv4;

drop function if exists dbo.GetCustOrders;
go

create function dbo.GetCustOrders(@cid as int) returns table
as
return
	select	orderid, custid, empid, orderdate, requireddate, shippeddate, 
			shipperid, freight, shipname, shipaddress, shipcity, shipregion, 
			shippostalcode, shipcountry
	from Sales.Orders
	where custid = @cid;
go

select orderid, custid
from dbo.GetCustOrders(1) as O;

select O.orderid, O.custid, OD.productid, OD.qty
from dbo.GetCustOrders(1) as O 
inner join Sales.OrderDetails as OD
on O.orderid = OD.orderid;

drop function if exists dbo.GetCustOrders;
go

-- pag 181
select S.shipperid, E.empid
from Sales.Shippers as S cross join 
HR.Employees as E;

select S.shipperid, E.empid
from Sales.Shippers as S cross apply 
HR.Employees as E;

--
select C.custid, A.orderid, A.orderdate
from Sales.Customers as C
cross apply
	(
		select top (3) orderid, empid, orderdate, requireddate
		from Sales.Orders as O
		where O.custid = C.custid
		order by orderdate desc, orderid desc
	) as A;

--

select C.custid, A.orderid, A.orderdate
from Sales.Customers as C
outer apply
	(
		select top (3) orderid, empid, orderdate, requireddate
		from Sales.Orders as O
		where O.custid = C.custid
		order by orderdate desc, orderid desc
	) as A;

--

select C.custid, A.orderid, A.orderdate
from Sales.Customers as C
outer apply
	(
		select orderid, empid, orderdate, requireddate
		from Sales.Orders as O
		where O.custid = C.custid
		order by orderdate desc, orderid desc
		offset 0 rows fetch next 3 rows only
	) as A;

--

drop function if exists dbo.topOrders;
go

create function dbo.topOrders(@n as int, @cid as int) returns table
as 
return
	select top(@n) orderid, empid, orderdate, requireddate
	from Sales.Orders
	where custid = @cid
	order by orderdate desc, orderid desc;
go

select C.custid, C.companyname, A.orderdate, A.empid, A.orderdate, A.requireddate
from Sales.Customers as C
cross apply dbo.topOrders(custid, 3) as A;

-- pag 183
/*****************CHAPTER 5 EXERCISES*****************/

-- Exercise 1
-- The following query attemps to filter orders that were not palced on the last day of the year. 
-- It's supposed to return the order ID, order date, customer ID, employee ID, and respective 
-- end-of-year date for each order:

select	orderid, orderdate, custid, empid,
		DATEFROMPARTS(YEAR(orderdate), 12, 31) as endofyear
from Sales.Orders
where orderdate <> endofyear;

-- When you try to run this query, you get the following error:
-- Msg 207, Level 16, State 1, Line 223
-- Invalid column name 'nameofyear'.

-- Explain what the problem is, and suggest a valid solution.

-- Explanation:
-- you can't refer to column aliases assigned in the SELECT clause in query
-- clauses that are logically processed prior to the SELECT clause

select orderid, orderdate, custid, empid, endofyear
from	(
			select	orderid, orderdate, custid, empid, 
					DATEFROMPARTS(YEAR(orderdate), 12, 31) as endofyear
			from Sales.Orders
		) as C
where orderdate <> endofyear;

-- alternative
with C as
(
	select *, DATEFROMPARTS(year(orderdate), 12, 31) as endofyear
	from Sales.Orders
)
select orderid, orderdate, custid, empid, endofyear
from C
where orderdate <> endofyear

-- Exercise 2 - 1
-- Write a query that returns the maximum value in the orderdate column for each employee:
-- Table involved: TSQLV4, database, Sales.Orders table

select empid, MAX(orderdate) as maxorderdate
from Sales.Orders
group by empid;

-- Exercise 2 - 2
-- Encapsulate the query from Exercise 2-1 in a derived table. Write a join query between
-- the derived table and the Orders table to return the orders with the maximum order date 
-- for each employee:
-- Table involved: Sales.Orders

-- (no valida)
select O1.empid, O1.orderdate, O1.orderid, O1.custid		
from 
	(
		select empid, MAX(orderdate) as maxorderdate
		from Sales.Orders
		group by empid
	) as D inner join Sales.Orders as O1
	on D.empid = O1.empid
where O1.orderid =
	(
		select max(O2.orderid)
		from Sales.Orders as O2
		where O2.empid = O1.empid
	)
order by D.empid desc;

-- alternative:
select O.empid, O.orderdate, O.orderid, O.custid
from 
	(
		select empid, MAX(orderdate) as maxorderdate
		from Sales.Orders
		group by empid
	) as D inner join Sales.Orders as O
	on D.empid = O.empid 
	and D.maxorderdate = O.orderdate;

-- EXERCISE 3 - 1
-- Write a query that calculates a row number for each order based on orderdate, orderid ordering:
-- Table involved: Sales.Orders

select	orderid, orderdate, custid, empid,  
		(
			select O.orderid - min(orderid) + 1
			from Sales.Orders
		) as rownum
from Sales.Orders as O
order by orderdate, orderid;

-- alternative
select	orderid, orderdate, custid, empid,  
		ROW_NUMBER() OVER(order by orderdate, orderid) as rownum
from Sales.Orders;


-- EXERCISE 3 - 2
-- Write a query that returns rows with row numbers 11 through 20 based on the row-number definition in
-- exercise 3 - 1. Use CTE to encapsulate the code from Exercise 3 - 1:
-- Table involved: Sales.Orders

with Rowsnums
as
(
	select top(100) percent	orderid, orderdate, custid, empid,  
		(
			select O.orderid - min(orderid) + 1
			from Sales.Orders
		) as rownum
	from Sales.Orders as O	
)

select orderid, orderdate, custid, empid, rownum
from Rowsnums
order by orderdate, orderid
offset 10 rows fetch next 10 rows only;

-- alternative 1
with Rowsnums
as
(
	select	orderid, orderdate, custid, empid,  
		ROW_NUMBER() OVER(order by orderdate, orderid) as rownum
	from Sales.Orders
)

select *
from Rowsnums
where rownum between 11 and 20;

-- alternative 2
with Rowsnums
as
(
	select	orderid, orderdate, custid, empid,  
		ROW_NUMBER() OVER(order by orderdate, orderid) as rownum
	from Sales.Orders
)

select orderid, orderdate, custid, empid, rownum
from Rowsnums
order by orderdate, orderid
offset 10 rows fetch next 10 rows only;


-- EXERCISE 4
-- Write a solution usaing a recursive CTE that returns the management chain leading to Patricia Doyle
-- (employee ID 9):
-- Table involved: HR.Employees

with EmpsCTE2 as
(
	select empid, mgrid, firstname, lastname
	from HR.Employees
	where empid = 9

	union all
	
	select C.empid, C.mgrid, C.firstname, C.lastname
	from EmpsCTE2 as P inner join HR.Employees as C
	on  P.mgrid = C.empid
)

select empid, mgrid, firstname, lastname
from EmpsCTE2;

-- EXERCISE 5 - 1
-- Write a query that returns the total quantity for each employee and year:
-- Tables involved: Sales.Orders and Sales.OrderDetails
-- When running the following code:
-- Select * from Sales.VEmpOrders order by empid, orderyear;

drop view if exists Sales.VEmpOrders;
go
create view Sales.VEmpOrders
as
	select O.empid, year(O.orderdate) as orderyear, sum(qty) as qty
	from Sales.OrderDetails as OD inner join Sales.Orders as O
	on OD.orderid = O.orderid
	group by O.empid, year(O.orderdate);
go

Select * from Sales.VEmpOrders 
order by empid, orderyear;

-- EXERCISE 5 - 2 
-- Write a query against Sales.VEmpOrders that returns the runing total quantity for each employee and
-- year:
-- Table involved: Sales.VEmpOrders view

Select	empid, orderyear, qty,
		(
			select sum(V2.qty)
			from Sales.VEmpOrders as V2
			where (V2.empid = V1.empid) and (V2.orderyear <= V1.orderyear)
		) as runqty

from Sales.VEmpOrders as V1
order by empid, orderyear;

-- EXERCISE 6 - 1
-- Create an inline TVF that accepts as inputs a supplier ID (@supid AS INT) and a requested number of
-- products (@n AS INT). The function should return @n products with the highest unit prices that are 
-- supplied by the specified supplier ID:
-- Table involved: Production.Products
-- When issuing the following query:
-- select * from Production.TopProducts(5, 2);

drop function if exists Production.TopProducts;
go

create function Production.TopProducts(@supid as int, @n as int) returns table
as
return 
	select top(@n) productid, productname, unitprice
	from Production.Products
	where supplierid = @supid
	order by unitprice desc;
go

select * from Production.TopProducts(5, 2);

-- EXERCISE 6 - 2
-- Using the CROSS APPLY operator and the function you created in Exercise 6 - 1, return the two most
-- expensive products for each supplier:
-- Table involved: Production.Suppliers

select S.supplierid, S.companyname, A.productid, A.productname, A.unitprice
from Production.Suppliers as S
cross apply Production.TopProducts(supplierid, 2) as A;


drop view if exists Sales.VEmpOrders;
drop function if exists Production.TopProducts;

-- pag 195
select country, region, city
from HR.Employees

union --all

select country, region, city
from Sales.Customers

-- pag 196
select country, region, city
from HR.Employees

intersect

select country, region, city
from Sales.Customers

-- pag 198
select (
	ROW_NUMBER() 
	over(partition by country, region, city 
		order by (select 0))
) as rownum,
country, region, city
from Sales.Customers

intersect

select (
	ROW_NUMBER() 
	over(partition by country, region, city 
		order by (select 0))
) as rownum,
country, region, city
from HR.Employees
go
-- pag 199
with INTERSECT_ALL
as
(
	select (
	ROW_NUMBER() 
	over(partition by country, region, city 
		order by (select 0))
	) as rownum,
	country, region, city
	from Sales.Customers

	intersect

	select (
		ROW_NUMBER() 
		over(partition by country, region, city 
			order by (select 0))
	) as rownum,
	country, region, city
	from HR.Employees	
)

select country, region, city 
from INTERSECT_ALL;

-- pag 200
select country, region, city
from HR.Employees

except

select country, region, city
from Sales.Customers;

--

select country, region, city
from Sales.Customers

except

select country, region, city
from HR.Employees;

-- pag 201
with SELECT_ALL 
as
(
	select 	row_number() 
			over(partition by country, region, city 
			order by (select 0)) as rownum,
			country, region, city
	from HR.Employees
			
	except

	select 	row_number() 
			over(partition by country, region, city 
			order by (select 0)) as rownum,
			country, region, city
	from Sales.Customers
)
select country, region, city
from SELECT_ALL;

-- 
-- locations that are supplier locations, but not 
-- (locations that are both employee and customer locations)
select country, region, city
from Production.Suppliers

except

select country, region, city
from HR.Employees

intersect

select country, region, city
from Sales.Customers
go
-- (locations that are supplier locations but not employee locations) and that are also customer locations.
(select country, region, city
from Production.Suppliers

except

select country, region, city
from HR.Employees)

intersect

select country, region, city
from Sales.Customers

-- pag 203
select country, count(*) as locationsnum
from
	(select country, region, city
	from HR.Employees

	union

	select country, region, city
	from Sales.Customers) as U
group by country;


-- pag 204
go
select empid, orderid, orderdate
from
	(
		select top(2) empid, orderid, orderdate
		from Sales.Orders
		where empid = 3
		order by orderid desc, orderdate desc
	) as D1

union all

select empid, orderid, orderdate
from
	(
		select top(2) empid, orderid, orderdate
		from Sales.Orders
		where empid = 5
		order by orderid desc, orderdate desc
	) AS D2;


/**********************EXERCISES CHAPTER 6*********************/
-- Exercise 1
-- Explain the difference between UNION ALL and UNION operators. In what cases are the two
-- equivalent? When they are equivalent, which one should you use?
/*
	UNION no duplicates
	UNION ALL duplicates

	Both return the same result when duplicates cannot exist

	When they are equivalent UNION ALL don't pay the unnecessary performance penalty 
	related to checking for duplicates
*/

-- Exercise 2
-- Write a query that generates a virtual auxiliary table of 10 numbers in the range 1 through 10 without
-- using a looping construct. You do not to guarantee any order of the rows in the output of your
-- solution:
-- Tables involved: None

select 1 as n
union all
select 2
union all
select 3
union all
select 4
union all
select 5
union all
select 6
union all
select 7
union all
select 8
union all
select 9
union all
select 10;

-- EXERCISE 3
-- Write a query that returs customer and employee pairs that had order activity in January 2016 but not
-- in February 2016:
-- Table involved: Sales.Orders table

select custid, empid
from Sales.Orders
where orderdate >= '20160101' and orderdate < '20160201'

except

select custid, empid
from Sales.Orders
where orderdate >= '20160201' and orderdate < '20160301';

-- EXERCISE 4
-- Write a query that returs customer and employee pairs that had order activity in both January 2016 
-- and February 2016:
-- Table involved: Sales.Orders table
select custid, empid
from Sales.Orders
where orderdate >= '20160101' and orderdate < '20160201'

intersect

select custid, empid
from Sales.Orders
where orderdate >= '20160201' and orderdate < '20160301';


-- EXERCISE 5
-- Write a query that returns customer and employee pairs that had order activity in both January 2016
-- and February 2016 but not in 2015:
-- Tables involved: Sales.Orders

(select custid, empid
from Sales.Orders
where orderdate >= '20160101' and orderdate < '20160201'

intersect

select custid, empid
from Sales.Orders
where orderdate >= '20160201' and orderdate < '20160301')

except 

select custid, empid
from Sales.Orders
where orderdate >= '20150101' and orderdate < '20160101';

-- pag 207

--EXERCISE 6
-- You are given the following query:

select country, region, city
from HR.Employees

union all

select country, region, city
from Production.Suppliers;

-- You are asked to add logic to the query so that it guarantees that the rows from Employees are
-- returned in the output before the rows from Suppliers. Also, within each segment, the rows should be
-- sorted by country, region, and city:
-- Tables involved: HR.Employees and Production.Suppliers

select country, region, city
from
	(select 1 as sortcol, country, region, city
	from HR.Employees

	union all

	select 2, country, region, city
	from Production.Suppliers) as D

order by sortcol, country, region, city;

-- pag 214

select empid, ordermonth, val,
	(
		sum(val) 
		over( 
			partition by empid
			order by ordermonth
			rows between unbounded preceding and current row
		)
	) as runval

from Sales.EmpOrders;

--
 
select empid, ordermonth, val,
	(
		sum(val) 
		over()
	) as runval

from Sales.EmpOrders;

-- pag 216

select orderid, custid, val,
		ROW_NUMBER()	over(order by val) as rownum,
		rank()			over(order by val) as rank,
		dense_rank()	over(order by val) as dense_rank,
		ntile(10)		over(order by val) as ntile
from Sales.OrderValues
order by val;

-- pag 217

select orderid, custid, val,
	ROW_NUMBER() over(partition by custid order by val) as numord
from Sales.OrderValues
order by custid, val;

-- pag 218

select	distinct val, ROW_NUMBER() over(order by val) as rownum
from Sales.OrderValues;

--

select val, ROW_NUMBER() over(order by val) as rownum
from Sales.OrderValues
group by val;

-- pag 219

select custid, orderid, val,
		lag(val, 3, 0) over(partition by custid order by orderdate, orderid) as prevval,
		lead(val, 3, 0) over(partition by custid order by orderdate, orderid) as nextval
from Sales.OrderValues
order by custid, orderdate, orderid;


-- pag 221
select custid, orderid, val,
	FIRST_VALUE(val) 
	over
	(
		partition by custid 
		order by orderdate, orderid
		rows between unbounded preceding and current row
	) as firstval,

	LAST_VALUE(val) 
	over
	(
		partition by custid 
		order by orderdate, orderid
		rows between current row and unbounded following 
	) as lastval

from Sales.OrderValues
order by custid, orderdate, orderid;

-- pag 222
select orderid, custid, val,
		sum(val) over() as totalvalue,
		sum(val) over(partition by custid) as custtotalvalue
from Sales.OrderValues;

--
select orderid, custid, val,
		100. * val/sum(val) over() as pctall,
		100. * val/sum(val) over(partition by custid) as pctcust
from Sales.OrderValues;

-- pag 223
select empid, ordermonth, val,
		sum(val)
		over
		(
			partition by empid
			order by ordermonth
			rows between unbounded preceding and current row
		) as runval
from Sales.EmpOrders;

-- pag 224
use tsqlv4;

drop table if exists dbo.Orders;

create table dbo.Orders
(
	orderid int not null,
	orderdate date not null,
	empid int not null, 
	custid varchar(5) not null,
	qty int not null, 
	constraint PK_Orders primary key(orderid)
);

insert into dbo.Orders(orderid, orderdate, empid, custid, qty)
values
	(30001, '20140802', 3, 'A', 10),
	(10001, '20141224', 2, 'A', 12),
	(10005, '20140802', 1, 'B', 20),
	(40001, '20150109', 2, 'A', 40),
	(10006, '20150118', 1, 'C', 14),
	(20001, '20150212', 2, 'B', 12),
	(40005, '20160212', 3, 'A', 10),
	(20002, '20160216', 1, 'C', 20),
	(30003, '20160418', 2, 'B', 15),
	(30004, '20140418', 3, 'C', 22),
	(30007, '20160907', 3, 'D', 30);

select *
from dbo.Orders;

-- Total order quantity for each employee and customer
select empid, custid, sum(qty) as sum_qty
from dbo.Orders
group by empid, custid;

-- pag 227

select empid,
		sum(case when custid = 'A' then qty end) as A,
		sum(case when custid = 'B' then qty end) as B,
		sum(case when custid = 'C' then qty end) as C,
		sum(case when custid = 'D' then qty end) as D
from dbo.Orders
group by empid;

-- pag 228
select empid, A, B, C, D
from
	(	
		select empid, custid, qty
		from dbo.Orders		
	) as D1
pivot(sum(qty) for custid in (A, B, C, D)) AS P;

-- pag 229
select custid, [1], [2], [3]
from
	(	
		select empid, custid, qty
		from dbo.Orders		
	) as D1
pivot(sum(qty) for empid in ([1], [2], [3])) AS P;


-- pag 230
use tsqlv4;

drop table if exists dbo.EmpCustOrders;

create table dbo.EmpCustOrders(
	empid int not null constraint PK_EmpCustOrders primary key,
	A varchar(5) null,
	B varchar(5) null,
	C varchar(5) null,
	D varchar(5) null
);

insert into dbo.EmpCustOrders(empid, A, B, C, D)
	select empid, A, B, C, D
	from		
		(select empid, custid, qty
		from dbo.Orders) as O
		pivot(sum(qty) for custid in(A, B, C, D) ) as P;
		

select * from dbo.EmpCustOrders

-- pag 231
-- copy
select empid, A, B, C, D, custid
from dbo.EmpCustOrders
cross join(values('A'), ('B'), ('C'), ('D')) as C(custid);

-- pag 232
-- extract 1 
select empid, custid, qty
from dbo.EmpCustOrders
cross join(values('A', A), ('B', B), ('C', C), ('D', D)) as C(custid, qty);

-- extract 2
select empid, custid, qty
from dbo.EmpCustOrders
cross apply(values('A', A), ('B', B), ('C', C), ('D', D)) as C(custid, qty);

-- pag 233
-- delete null
select empid, custid, qty
from dbo.EmpCustOrders
cross apply(values('A', A), ('B', B), ('C', C), ('D', D)) as C(custid, qty)
where qty is not null;

--

select empid, custid, qty
from dbo.EmpCustOrders
unpivot(qty for custid in(A, B, C, D)) as U;

drop table if exists dbo.EmpCustOrders;

-- pag 237
select empid, custid, sum(qty) as sumqty
from dbo.Orders
group by empid, custid

union all

select empid, null, sum(qty) as sumqty
from dbo.Orders
group by empid

union all

select null, custid, sum(qty) as sumqty
from dbo.Orders
group by custid

union all

select null, null, sum(qty) as sumqty
from dbo.Orders;

-- pag 236
-- grouping set
select empid, custid, sum(qty) as sumqty
from dbo.Orders
group by
	grouping sets
	(
		(empid, custid),
		(empid),
		(custid),
		()
	);

-- 
select empid, custid, sum(qty) as sumqty
from dbo.Orders
group by cube(empid, custid);

-- pag 237
select year(orderdate) as orderyear, month(orderdate) as ordermonth, day(orderdate) as orderday
from dbo.Orders
group by 
	grouping sets
	(
		(year(orderdate), month(orderdate), day(orderdate)),
		(year(orderdate), month(orderdate)),
		(year(orderdate)),
		()
	);

-- rollup
select year(orderdate) as orderyear, month(orderdate) as ordermonth, day(orderdate) as orderday
from dbo.Orders
group by rollup(year(orderdate), month(orderdate), day(orderdate));

-- pag 239

select	grouping(empid) as groupempid,
		grouping(custid) as groupcustid,
		empid, custid, sum(qty) as sumqty
from dbo.Orders
group by cube(empid, custid);

-- pag 240

select	GROUPING_ID(empid, custid) as grouping_set,
		empid, custid, sum(qty) as sumqty
from dbo.Orders
group by cube(empid, custid);

-- pag 241
-- ***************EXERCISES CHAPTER 9***************

-- Exercise 1
-- Write a query against the dbo.Orders table that computes both a rank and a dense rank for each 
-- customer order, partioned by custid and ordered by qty:
-- Tables involved: TSQLV4 database, dbo.Orders table

select	custid, orderid, qty,
		rank() over(partition by custid order by qty) as rnk,
		dense_rank() over(partition by custid order by qty) as drnk
from dbo.Orders;

-- Exercise 2
-- Earlier in this chapter in the section "Ranking window functions," I provided the following query against
-- the Sales.OrderValues view to return distinct values and their associated row numbers:

/*
	select val, row_number() over(order by val) as rownum
	from Sales.OrderValues
	group by val;
*/

-- Can you think of an alternative way to achieve the same task?
-- Table involved: TSQLV4 database, Sales.OrderValues view

with c as
(
	select distinct val
	from Sales.OrderValues
)

select val, ROW_NUMBER() over(order by val) as rownum
from c;

-- Exercise 3
-- Write a query against the dbo.Orders table that computes for each customer order both the difference
-- between the current order quantity and the customer's previous order quantity and the difference
-- between the current order quantity and the customer's next order quentity:
-- Table involved: TSQLV4 database, dbo.Orders table

select	custid, orderid, qty,
		qty - lag(qty) over(partition by custid order by orderid) as diffprev,
		qty - lead(qty) over(partition by custid order by orderid) as diffnext
from dbo.Orders
order by custid, orderdate;

-- Exercise 4
-- Write a query against the dbo.Orders table that returns a row for each employee, a column for each
-- order year, and the count of orders for each employee and order year:
-- Table involved: TSQLV4 database, dbo.Orders table

select empid, [2014] as cnt2014, [2015] as cnt2015, [2016] as cnt2016
from
	(	
		select empid, year(orderdate) as orderyear, qty
		from dbo.Orders
	) as D
	pivot(count(qty) for orderyear in([2014], [2015], [2016])) as P;

--

select empid, [2014] as cnt2014, [2015] as cnt2015, [2016] as cnt2016
from
	(	
		select empid, year(orderdate) as orderyear
		from dbo.Orders
	) as D
	pivot(count(orderyear) for orderyear in([2014], [2015], [2016])) as P;

-- Exercise 5
-- Run the following code to create and populate the EmpYearOrders table:

/*
use tsqlv4;

drop table if exists dbo.EmpYearOrders;

create table dbo.EmpYearOrders
(
	empid int not null constraint PK_EmpYearOrders primary key,
	cnt2014 int null,
	cnt2015 int null,
	cnt2016 int null
);

insert into dbo.EmpYearOrders(empid, cnt2014, cnt2015, cnt2016)
	select empid, [2014] as cnt2014, [2015] as cnt2015, [2016] as cnt2016
	from
		(	
			select empid, year(orderdate) as orderyear, qty
			from dbo.Orders
		) as D
		pivot(count(qty) for orderyear in([2014], [2015], [2016])) as P;

select * from dbo.EmpYearOrders;
*/

-- Write a query against the EmpYearOrders table that unpivots the data, returning a row for each
-- employee and order year with the number of orders. Exclude rows in which the number of orders is 0
-- (in this example, employee 3 in year 2015)

select empid, substring(orderyear, 4, 4) as orderyear, numorders
from dbo.EmpYearOrders unpivot(numorders for orderyear in(cnt2014, cnt2015, cnt2016)) as U
where numorders <> 0;

-- Exercise 6
-- Write a query against the dbo.Orders table that returns the total quantities for each of the following:
-- (employee, customer, and order year), (employee and order year), and (customer and otder year).
-- Include a result column in the output that uniquely identifies the grouping set with which the current
-- row is associated:
-- Table involved: TSQLV4 database, dbo.Orders table
select	GROUPING_ID(empid, custid, year(orderdate)) as groupingset, 
		empid, 
		custid, 
		year(orderdate) as orderyear,
		sum(qty) as sumqty
		--qty as sumqty
from dbo.Orders
group by grouping sets
(
	(empid, custid, year(orderdate)),
	(empid, year(orderdate)),
	(custid, year(orderdate))
);

-- pag 249
use tsqlv4;
drop table if exists dbo.Orders;

create table dbo.Orders(
	orderid int not null constraint PK_Orders primary key,
	orderdate date not null constraint DFT_Orderdate default(sysdatetime()),
	empid int not null,
	custid varchar(10) not null
);

-- pag 250

insert into dbo.Orders(orderid, orderdate, empid, custid)
values(10001, '20160212', 3, 'A');

insert into dbo.Orders(orderid, empid, custid)
values(10002, 5, 'B');

insert into dbo.Orders(orderid, orderdate, empid, custid)
values
	(10003, '20160213', 4, 'B'),
	(10004, '20160214', 1, 'A'),
	(10005, '20160213', 1, 'C'),
	(10006, '20160215', 3, 'C');


select *
from( 	values
		(10003, '20160213', 4, 'B'),
		(10004, '20160214', 1, 'A'),
		(10005, '20160213', 1, 'C'),
		(10006, '20160215', 3, 'C') )
	 as O (orderid, orderdate, empid, custid);
	 
-- pag 251
insert into dbo.Orders(orderid, orderdate, empid, custid)
	select orderid, orderdate, empid, custid
	from Sales.Orders
	where shipcountry = N'UK';

-- pag 252

drop proc if exists Sales.GetOrders;
go

create proc Sales.GetOrders @country as varchar(40)
as
	select orderid, orderdate, empid, custid
	from Sales.Orders
	where shipcountry = @country
go

insert into dbo.Orders(orderid, orderdate, empid, custid)
	exec Sales.GetOrders @country = N'France';


-- pag 252
drop table if exists dbo.Orders;

select orderid, orderdate, empid, custid
into dbo.Orders
from Sales.Orders;

-- pag 253
drop table if exists dbo.Locations;


select country, region, city
into dbo.Locations
from Sales.Customers

except 

select country, region, city
from HR.Employees;

select *
from dbo.Orders;

select *
from dbo.Locations;

--

bulk insert dbo.Orders from 'C:\Users\Hernan\Documents\order.csv'
with
(
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

-- pag 254
drop table if exists dbo.T1;

create table dbo.T1(
	keycol int not null identity(1,1) constraint PK_T1 primary key,
	datacol varchar(10) not null constraint CHK_T1_datacol check(datacol like '[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%')
);


insert into dbo.T1(datacol)
values 
	('AAAAA'), 
	('CCCCC'), 
	('BBBBB');

select *
from dbo.T1;

-- pag 255
select $identity
from dbo.T1;

-- 

declare @new_key as int;

insert into dbo.T1(datacol) values('AAAAA');

set @new_key = SCOPE_IDENTITY();

select @new_key as new_key;

-- pag 256
select SCOPE_IDENTITY() as [scope_identity], @@IDENTITY as [identity], IDENT_CURRENT(N'dbo.T1') as [ident_current];

insert into dbo.T1(datacol) values (12345);

insert into dbo.T1(datacol) values ('EEEEE');

select * from dbo.T1;

-- pag 257
set identity_insert dbo.T1 on;
insert into dbo.T1(keycol, datacol) values(5, 'FFFFF');
set identity_insert dbo.T1 off;

insert into dbo.T1(datacol) values ('GGGGG');

-- pag 258
create sequence dbo.SeqOrderIDs as int
	minvalue 1
	cycle;

-- pag 259
alter sequence dbo.SeqOrderIDs
	no cycle;

select next value for dbo.T1;
--
drop table if exists dbo.T1;

create table dbo.T1(
	keycol int not null constraint PK_T1 primary key,
	datacol varchar(10) not null
);

declare @neworderid int = next value for dbo.SeqOrderIDs;

insert into dbo.T1(keycol, datacol) values(@neworderid, 'a');

insert into dbo.T1(keycol, datacol) values(next value for dbo.SeqOrderIDs, 'b');

update dbo.T1 set keycol = next value for dbo.SeqOrderIDs;

select *
from T1;

-- pag 260
select current_value
from sys.sequences
where OBJECT_ID = OBJECT_ID(N'dbo.SeqOrderIDs');

--

set identity_insert dbo.T1 on;

insert into dbo.T1(keycol, datacol)
	select next value for dbo.SeqOrderIDs over(order by hiredate), left(firstname, 1) + left(lastname, 1)
	from HR.Employees;

set identity_insert dbo.T1 off;

-- pag 261

alter table dbo.T1
	add constraint DFT_T1_keycol
		default(next value for dbo.SeqOrderIDs)
		for keycol;

insert into dbo.T1(datacol) values('d');

alter table dbo.T1
	drop constraint DFT_T1_keycol;

insert into dbo.T1(keycol, datacol) values(20, 'd');

select * 
from dbo.T1;

-- pag 262
declare @first as sql_variant;

exec sys.sp_sequence_get_range
	@sequence_name = N'dbo.SeqOrderIDs',
	@range_size = 1000,
	@range_first_value = @first output;
	
select @first;

drop table if exists dbo.T1;
drop sequence if exists dbo.SeqOrderIDs;

-- pag 263
drop table if exists dbo.Orders, dbo.Customers;

create table dbo.Customers(
	custid			int				not null,
	companyname		nvarchar(40)	not null,
	contactname		nvarchar(30)	not null,
	contacttitle	nvarchar(30)	not null,
	address			nvarchar(60)	not null,
	city			nvarchar(15)	not null,
	region			nvarchar(15)	null,
	postalcode		nvarchar(10)	null,
	country			nvarchar(15)	not null,
	phone			nvarchar(24)	not null,
	fax				nvarchar(24)	null,
	constraint PK_Customers primary key(custid)
);

create table dbo.Orders(
	orderid			int			not null,
	custid			int			null,
	empid			int			not null,
	orderdate		date		not null,
	requiredate		date		not null,
	shippeddate		date		null,
	shipperid		int			not null,
	freight			money		not null
		constraint DFT_Orders_freight default(0),
	shipname		nvarchar(40) not null,
	shipaddress		nvarchar(60) not null,
	shipcity		nvarchar(15) not null,
	shipregion		nvarchar(15) null,
	shippostalcode	nvarchar(10) null,
	shipcountry		nvarchar(15) not null,
	constraint PK_Orders primary key(orderid),
	constraint FK_Orders_Customers foreign key(custid)	
		references dbo.Customers(custid)
);
go

insert into dbo.Customers select * from Sales.Customers;
insert into dbo.Orders select * from Sales.Orders;

delete from dbo.Orders
where orderdate < '20150101';

-- pag 267
drop table if exists dbo.OrderDetails, dbo.Orders;

create table dbo.Orders(
	orderid 		int			not null,
	custid 			int			null,
	empid 			int			not null,
	orderdate 		date		not null,
	requireddate	date		not null,
	shippeddate		date		null,
	shipperid		int			not null,
	freight			money		not null
		constraint DFT_Orders_freight default(0),
	shipname		nvarchar(40) not null,
	shipaddress		nvarchar(60) not null,
	shipcity		nvarchar(15) not null,
	shiperegion		nvarchar(15) null,
	shippostalcode	nvarchar(10) null,
	shipcountry		nvarchar(15) not null,
	constraint PK_Orders primary key(orderid)
);

create table dbo.OrderDetails(
	orderid			int				not null,
	productid		int				not null,
	unitprice		money			not null
		constraint DFT_OrderDetails_unitprice default(0),
	qty				smallint		not null
		constraint DFT_OrderDetails_qty default(1),
	discount		numeric(4,3)	not null
		constraint DFT_OrderDetails_discount default(0),
	constraint PK_OrderDetails primary key(orderid, productid),
	constraint FK_OrderDetails_Orders foreign key(orderid)
		references dbo.Orders(orderid),
	constraint CHK_discount check(discount between 0 and 1),
	constraint CHK_qty check(qty > 0),
	constraint CHK_unitprice check(unitprice >= 0)	
);
go

insert into dbo.Orders select * from Sales.Orders;
insert into dbo.OrderDetails select * from Sales.OrderDetails;

-- pag 267
update dbo.OrderDetails
set discount += 0.05
where productid = 51;

-- pag 268
update dbo.T1
set col1 = col1 + 10, col2 = col1 + 10;

update dbo.T1
set col1 = col2, col2 = col1;

select discount
from dbo.OrderDetails
where custid = 1;

select *
from dbo.T1;

--
update OD
	set discount += 0.05
from dbo.OrderDetails as OD 
	inner join dbo.Orders as O
		on OD.orderid = O.orderid
where O.custid = 1;

select *
from dbo.OrderDetails as OD 
	inner join dbo.Orders as O
		on OD.orderid = O.orderid
where O.custid = 1;

-- pag 269
update dbo.OrderDetails
set discount += 0.05
where exists
	(
		select *
		from dbo.Orders as O
		where O.orderid = OrderDetails.orderid 
			and custid = 1
	);

-- pag 271
create table dbo.MySequences(
	id varchar(10) not null
		constraint PK_sequence primary key(id),
	val int not null
);

insert into dbo.MySequences(id, val) values('Seq01', 0);

select *
from dbo.MySequences;

declare @nextval as int;

update dbo.MySequences
set @nextval = val += 1
where id = 'Seq01';

select @nextval;

drop table if exists dbo.MySequences;

-- pag 272
drop table if exists dbo.Customers, dbo.CustomersStage;
go

create table dbo.Customers(
	custid			int 		not null,
	companyname		varchar(25) not null,
	phone			varchar(20) not null,
	address			varchar(50) not null,
	constraint PK_Customers primary key(custid)
);

insert into dbo.Customers(custid, companyname, phone, address)
values
	(1, 'cust 1', '(111) 111-1111', 'address 1'),
	(2, 'cust 2', '(222) 222-2222', 'address 2'),
	(3, 'cust 3', '(333) 333-3333', 'address 3'),
	(4, 'cust 4', '(444) 444-4444', 'address 4'),
	(5, 'cust 5', '(555) 555-5555', 'address 5');

create table dbo.CustomersStage(
	custid			int 		not null,
	companyname		varchar(25) not null,
	phone			varchar(20) not null,
	address			varchar(50) not null,
	constraint PK_CustomersStage primary key(custid)
);

insert into dbo.CustomersStage(custid, companyname, phone, address)
values
	(2, 'AAAAA', '(222) 222-2222', 'address 2'),
	(3, 'cust 3', '(333) 333-3333', 'address 3'),
	(5, 'BBBBB', 'CCCCC', 'DDDDD'),
	(6, 'cust 6 (new)', '(666) 666-6666', 'address 6'),
	(7, 'cust 7 (new)', '(777) 777-7777', 'address 7');

select * from dbo.Customers;
select * from dbo.CustomersStage;

-- pag 273
merge into dbo.Customers as TGT
using dbo.CustomersStage as SRC
	on TGT.custid = SRC.custid
when matched then
	update set
		TGT.companyname = SRC.companyname,
		TGT.phone = SRC.phone,
		TGT.address = SRC.address
when not matched then
	insert(custid, companyname, phone, address)
	values(SRC.custid, SRC.companyname, SRC.phone, SRC.address);

-- pag 274
merge into dbo.Customers as TGT
using dbo.CustomersStage as SRC
	on TGT.custid = SRC.custid
when matched then
	update set
		TGT.companyname = SRC.companyname,
		TGT.phone = SRC.phone,
		TGT.address = SRC.address
when not matched then
	insert(custid, companyname, phone, address)
	values(SRC.custid, SRC.companyname, SRC.phone, SRC.address)

when not matched by source then
	delete;

-- pag 275
merge into dbo.Customers as TGT
using dbo.CustomersStage as SRC
	on TGT.custid = SRC.custid
when matched and
	(
		TGT.companyname <> SRC.companyname
		or TGT.phone <> SRC.phone
		or TGT.address <> SRC.address
	) then
	update set
		TGT.companyname = SRC.companyname,
		TGT.phone = SRC.phone,
		TGT.address = SRC.address
when not matched then
	insert(custid, companyname, phone, address)
	values(SRC.custid, SRC.companyname, SRC.phone, SRC.address);

-- pag 276
with C as
(
	select OD.orderid, productid, custid, discount, discount + 0.05 as newdiscount
	from Orders as O inner join OrderDetails as OD
	on O.orderid = OD.orderid
	where O.custid = 1
)

update C
set discount = newdiscount;

--
update D
	set discount = newdiscount
from(
	select OD.orderid, productid, custid, discount, discount + 0.05 as newdiscount
	from Orders as O inner join OrderDetails as OD
	on O.orderid = OD.orderid
	where O.custid = 1
)as D;

-- pag 277
drop table if exists dbo.T1;

create table dbo.T1(col1 int, col2 int);
go
insert into dbo.T1(col1) values(20),(10),(30);

select * from dbo.T1;

with C as (
	select col1, col2, ROW_NUMBER() over(order by col1) as rownum
	from dbo.T1
)

update C
set col2 = rownum;

-- pag 278
drop table if exists dbo.Orders;

create table dbo.Orders(
	orderid			int not null,
	custid			int null,
	empid			int not null,
	orderdate		date not null,
	requireddate	date not null,
	shippeddate		date null,
	shipperid		int not null,
	freight			money not null
		constraint DFT_Orders_freight default(0),
	shipname		nvarchar(40) not null,
	shipaddress		nvarchar(60) not null,
	shipcity		nvarchar(15) not null,
	shipregion		nvarchar(15) null,
	shippostalcode	nvarchar(10) null,
	shipcountry		nvarchar(15) not null
		constraint PK_Orders primary key(orderid)
);

insert into dbo.Orders select * from Sales.Orders;

-- pag 280
delete top(50) from dbo.Orders;

update top(50) dbo.Orders
set freight += 10.00;

--
with C as 
(
	select top(50) *
	from dbo.Orders
	order by orderid
)

delete from C;

--

with C as 
(
	select top(50) *
	from dbo.Orders
	order by orderid desc
)

update C
set freight += 10.00;

--
with C as 
(
	select *
	from dbo.Orders	
	order by orderid
	offset 0 rows fetch next 50 rows only
)

delete from C;

--

with C as
(
	select *
	from dbo.Orders
	order by orderid desc
	offset 0 rows fetch next 50 rows only
)

update C
set freight += 10;

-- pag 281
drop table if exists dbo.T1;

create table dbo.T1(
	keycol	int				not null identity(1,1) constraint PK_T1 primary key,
	datacol nvarchar(40)	not null
);

insert into dbo.T1(datacol)
	output inserted.keycol, inserted.datacol
		select lastname
		from HR.Employees
		where country = N'USA';

--
declare @NewRows table(keycol int, datacol nvarchar(40));

insert into dbo.T1(datacol)
	output inserted.keycol, inserted.datacol
	into @NewRows(keycol, datacol)
		select lastname
		from HR.Employees
		where country = N'UK'

select * from @NewRows;

-- pag 282
alter table dbo.OrderDetails drop constraint FK_OrderDetails_Orders;
alter table dbo.Orders drop constraint DFT_Orders_freight;
drop table if exists dbo.Orders;
drop table if exists dbo.OrderDetails;

create table dbo.Orders(
	orderid 		int			not null,
	custid 			int			null,
	empid 			int			not null,
	orderdate 		date		not null,
	requireddate	date		not null,
	shippeddate		date		null,
	shipperid		int			not null,
	freight			money		not null
		constraint DFT_Orders_freight default(0),
	shipname		nvarchar(40) not null,
	shipaddress		nvarchar(60) not null,
	shipcity		nvarchar(15) not null,
	shiperegion		nvarchar(15) null,
	shippostalcode	nvarchar(10) null,
	shipcountry		nvarchar(15) not null,
	constraint PK_Orders primary key(orderid)
);

create table dbo.OrderDetails(
	orderid			int				not null,
	productid		int				not null,
	unitprice		money			not null
		constraint DFT_OrderDetails_unitprice default(0),
	qty				smallint		not null
		constraint DFT_OrderDetails_qty default(1),
	discount		numeric(4,3)	not null
		constraint DFT_OrderDetails_discount default(0),
	constraint PK_OrderDetails primary key(orderid, productid),	
	constraint CHK_discount check(discount between 0 and 1),
	constraint CHK_qty check(qty > 0),
	constraint CHK_unitprice check(unitprice >= 0)	
);
go

insert into dbo.Orders select * from Sales.Orders;
insert into dbo.OrderDetails select * from Sales.OrderDetails;

--
delete from dbo.Orders
	output
		deleted.orderid,
		deleted.orderdate,
		deleted.empid,
		deleted.custid
where orderdate < '20160101';

-- pag 284
update dbo.OrderDetails
set discount += 0.05
	output
		inserted.orderid,
		inserted.productid,
		deleted.discount as old_discount,
		inserted.discount as new_discount
where productid = 51;

-- pag 284
merge into dbo.Customers as TGT
using dbo.CustomersStage as SRC
	on TGT.custid = SRC.custid
when matched then
	update set
		TGT.companyname = SRC.companyname,
		TGT.phone = SRC.phone,
		TGT.address = SRC.address
when not matched then
	insert(custid, companyname, phone, address)
	values(SRC.custid, SRC.companyname, SRC.phone, SRC.address)

output	$action as theaction,
		inserted.custid,
		deleted.companyname as oldcompanyname,
		inserted.companyname as newcompanyname,
		deleted.phone as oldphone,
		inserted.phone as newphone,
		deleted.address as oldaddress,
		inserted.address as newaddress;

-- pag 286
drop table if exists dbo.ProductsAudit, dbo.Products;

create table dbo.Products(
	productid		int				not null,
	productname		nvarchar(40)	not null,
	supplierid		int				not null,
	categoryid		int				not null,
	unitprice		money			not null
		constraint DFT_Products_unitprice default(0),
	discontinued	bit				not null
		constraint DFT_Producst_discontinued default(0),
	constraint PK_Products primary key(productid),
	constraint CHK_Products_unitprice check(unitprice >= 0)
);
		
insert into dbo.Products select * from Production.Products;

create table dbo.ProductsAudit(
	LSN			int			not null identity primary key,
	TS			datetime2	not null default(sysdatetime()),
	productid	int			not null,
	colname		sysname		not null,
	oldval		sql_variant not null,
	newval		sql_variant not null
);

--
insert into dbo.ProductsAudit(productid, colname, oldval, newval)
	select productid, N'unitprice', oldval, newval
	from (
		update dbo.Products
		set unitprice *= 1.15
		output 	inserted.productid,
				deleted.unitprice as oldval,
				inserted.unitprice as newval
		where supplierid = 1
	) as D
	where oldval < 20 and newval >= 20;

select * from dbo.ProductsAudit;
drop table if exists dbo.ProductsAudit;

-- pag 287
drop table if exists dbo.OrderDetails, dbo.ProductsAudit, dbo.Products,
dbo.Orders, dbo.Customers, dbo.T1, dbo.MySequences, dbo.CustomersStage;


/***************EXERCISES CHAPTER 8***************/

-- EXERCISE 1
-- Run the following code to create the dbo.Customers table in the TSQLV4 database:
 /*
 use TSQLV4;
 drop table if exists dbo.Customers;

 create table dbo.Customers (
	custid		int				not null primary key,
	companyname nvarchar(40)	not null,
	country		nvarchar(15)	not null,
	region		nvarchar(15)	null,
	city		nvarchar(15)	not null
 );
 */

 -- EXERCISE 1 - 1
 -- Insert into the dbo.Customers table a row with the following information:
 -- custid: 100
 -- companyname: Coho Winery
 -- country: USA
 -- region: WA
 -- city: Redmond
 
 insert into dbo.Customers(custid, companyname, country, region, city)
 values(100, N'Coho Winery', N'USA', N'WA', N'Redmond');

 select *
 from dbo.Customers;

-- EXERCISE 1 - 2
-- Insert into the dbo.Customers table all customers from Sales.Customers who placed orders.
 insert into dbo.Customers(custid, companyname, country, region, city)
	select distinct O.custid, C.companyname, C.country, C.region, C.city
	from Sales.Orders as O join Sales.Customers as C
	on C.custid = O.custid;	

-- correccion
insert into dbo.Customers(custid, companyname, country, region, city)
	select custid, companyname, country, region, city
	from Sales.Customers as C
	where exists
	(
		select *
		from Sales.Orders as O
		where O.custid = C.custid
	);

-- EXERCISE 1 - 3
-- Use a SELECT INTO statement to create and populate the dbo.Orders table with orders from the 
-- Sales.Orders table that were placed in the years 2014 through 2016.
use TSQLV4;
drop table if exists dbo.Orders;

select *
into dbo.Orders
from Sales.Orders
where orderdate >= '20140101' and orderdate < '20170101';

-- EXERCISE 2
-- Delete from the dbo.Orders table orders that were placed before August 2014. Use the OUTPUT clause
-- to return the orderid and orderdate values of the deleted orders
delete from dbo.Orders
	output 
		deleted.orderid, deleted.orderdate
where orderdate < '20140801';

-- EXERCISE 3
-- Delete from the dbo.Orders table orders placed by customers from Brazil.
delete from dbo.Orders 
where exists
	(
		select *
		from dbo.Customers as C
		where Orders.custid = C.custid and C.country = N'Brazil'
	);

-- EXERCISE 4
-- Run the following query against dbo.Customers, and notice that some rows have a NULL in the region
-- column:
-- SELECT * FROM dbo.Customers;
-- The output from this query is as follows:
---
-- Update the dbo.Customers table, and change all NULL region values to <None>. Use the OUTPUT
-- clause to show the custid, oldregion, and newregion.
update dbo.Customers
set region = '<None>'
	output
		inserted.custid, 
		deleted.region as oldregion, 
		inserted.region as newregion
where region is null;


-- EXERCISE 5
-- Update all orders in the dbo.Orders table that were placed by United Kingdom customers, and set their
-- shipcountry, shipregion, and shipcity values to the country, region, and city values of the corresponding
-- customers.

update O
	set 
		shipcountry = C.country,
		shipregion = C.region,
		shipcity = C.city
from dbo.Orders as O inner join dbo.Customers as C
	on O.custid = C.custid
where C.country = N'UK';

-- alternativa
with C_UDT as (
		select 
			O.shipcountry as ocountry, C.country as ccountry,
			O.shipergion as oregion, C.region as cregion,
			O.shipcity as ocity, C.city as ccity		
			
		from dbo.Orders as O inner join dbo.Customers as C
			on O.custid = C.custid
		where C.country = N'UK';
	)
update C_UDT
set ocountry = ccountry, 
	oregion = cregion,
	ocity = ccity;	

-- alternativa

merge into dbo.Orders as TGT
using (select * from dbo.Customers where country = N'UK') as SRC
	on TGT.custid = SRC.custid
when matched then
	update set
	shipcountry = SRC.country,
	shipregion = SRC.region,
	shipcity = SRC.city;

-- EXERCISE 6
-- Run the following code to create the tables Orders and OrderDetails and populate them with data:

/*
use	TSQLV4;

drop table if exists dbo.OrderDetails, dbo.Orders;

create table dbo.Orders
(
	orderid				int				not null,
	custid				int				null,
	empid				int				not null,
	orderdate			date			not null,
	requireddate		date			not null,
	shippeddate			date			null,
	shipperid			int				not null,
	freight				money			not null
		constraint DFT_Orders_freight default(0),
	shipname			nvarchar(40)	not null,
	shipaddress			nvarchar(60)	not null,
	shipcity			nvarchar(15)	not null,
	shipregion			nvarchar(15)	null,
	shippostalcode		nvarchar(10)	null,
	shipcountry			nvarchar(15)	not null,
	constraint	PK_Orders primary key(orderid)
);

create table dbo.OrderDetails
(
	orderid			int			not null,
	productid		int			not null,
	unitprice		money		not null
		constraint DFT_OrderDetails_unitprice default(0),
	qty				smallint	not null
		constraint DFT_OrderDetails_qty default(1),
	discount	numeric(4, 3)	not null
		constraint DFT_OrderDetails_discount default(0),
	constraint PK_OrderDetails primary key(orderid, productid),
	constraint FK_OrderDetails_Orders foreign key(orderid)
		references dbo.Orders(orderid),
	constraint CHK_discount check(discount between 0 and 1),
	constraint CHK_qty check(qty > 0),
	constraint CHK_unitprice check(unitprice >= 0)
);
go
*/

-- insert into dbo.Orders select * from Sales.Orders;
-- insert into dbo.OrderDetails select * from Sales.OrderDetails;

-- Write and test the T-SQL code that is required to truncate both tables, and make sure your code runs 
-- successfully.
	select * from dbo.Orders; 
	select * from dbo.OrderDetails;
	
	alter table dbo.OrderDetails drop constraint FK_OrderDetails_Orders;

	truncate table dbo.Orders; 
	truncate table dbo.OrderDetails;

	alter table dbo.OrderDetails add constraint FK_OrderDetails_Orders
	foreign key(orderid) references dbo.Orders(orderid);
	
-- When you're done, run the following code for cleanup:
-- drop table if exists dbo.OrderDetails, dbo.Orders, dbo.Customers;

-- pag 298
create table dbo.Employees
(
	empid int not null
		constraint PK_Employees primary key nonclustered,
	empname varchar(25) not null,
	department varchar(50) not null,
	salary numeric(10,2) not null,
	sysstart datetime2(0) generated always as row start hidden not null,
	sysend datetime2(0) generated always as row end hidden not null,
	period for SYSTEM_TIME(sysstart, sysend),
	index idx_Employees clustered(empid, sysstart, sysend)
)
with(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeesHistory));

-- pag 300
select *
from dbo.Employees;

select *
from dbo.EmployeesHistory;
--

select empid, empname, department, salary, sysstart, sysend
from dbo.Employees;

alter table dbo.Employees
	add hiredate date
		constraint DFT_Employees_hiredate default('19000101');

-- pag 301
alter table dbo.Employees
	drop constraint DFT_Employees_hiredate;

alter table dbo.Employees
	drop column hiredate;

-- pag 302
select SYSUTCDATETIME();

insert into dbo.Employees(empid, empname, department, salary)
	values	(1, 'Sara', 'IT'		, 50000.00),
			(2, 'Don',	'HR'		, 45000.00),
			(3, 'Judy', 'Sales'		, 55000.00),
			(4, 'Yael', 'Marketing'	, 55000.00),
			(5, 'Sven', 'IT'		, 45000.00),
			(6, 'Paul', 'Sales'		, 40000.00);

select empid, empname, department, salary, sysstart, sysend
from dbo.Employees;

--

select empid, empname, department, salary, sysstart, sysend
from dbo.EmployeesHistory;

--

delete from dbo.Employees
where empid = 6;

--

update dbo.Employees
set salary *= 1.05
where department = 'IT';

-- pag 304
begin tran
	update dbo.Employees
	set department = 'Sales'
	where empid = 5;

	update dbo.Employees
	set department = 'IT'
	where empid = 3;

commit tran;

-- pag 305
use tsqlv4;

-- drop tables if exists
if OBJECT_ID(N'dbo.Employees', N'U') is not null
begin
	if OBJECTPROPERTY(OBJECT_ID(N'dbo.Employees', N'U'), N'TableTemporalType') = 2
		alter table dbo.Employees set(system_versioning = OFF);
	drop table if exists dbo.Employees, dbo.EmployeesHistory;
end;
go

--

-- create and populate Employees table
create table dbo.Employees
(
	empid		int				not null
		constraint PK_Employees primary key nonclustered,
	empname		varchar(25)		not null,
	department	varchar(50)		not null,
	salary		numeric(10,2)	not null,
	sysstart	datetime2(0)	not null,
	sysend		datetime2(0)	not null,
	index ix_Employees clustered(empid, sysstart, sysend)
);

insert into dbo.Employees(empid, empname, department, salary, sysstart, sysend) values
	(1, 'Sara', 'IT'		, 52500.00, '2016-02-16 17:20:02', '9999-12-31 23:59:59'),
	(2, 'Don',	'HR'		, 45000.00, '2016-02-16 17:08:41', '9999-12-31 23:59:59'),
	(3, 'Judy', 'IT'		, 55000.00, '2016-02-16 17:28:10', '9999-12-31 23:59:59'),
	(4, 'Yael', 'Marketing'	, 55000.00, '2016-02-16 17:08:41', '9999-12-31 23:59:59'),
	(5, 'Sven', 'Sales'		, 47250.00, '2016-02-16 17:28:10', '9999-12-31 23:59:59');

-- create and populate EmployeesHistory table
create table dbo.EmployeesHistory
(
	empid		int				not null,
	empname		varchar(25)		not null,
	department	varchar(50)		not null,
	salary		numeric(10,2)	not null,
	sysstart	datetime2(0)	not null,
	sysend		datetime2(0)	not null,
	index ix_EmployeesHistory clustered(sysend, sysstart)
		with(DATA_COMPRESSION = PAGE)
);

insert into dbo.EmployeesHistory(empid, empname, department, salary, sysstart, sysend) values
	(6, 'Paul', 'Sales'	, 40000.00, '2016-02-16 17:08:41', '2016-02-16 17:15:26'),
	(1, 'Sara', 'IT	'	, 50000.00, '2016-02-16 17:08:41', '2016-02-16 17:20:02'),
	(5, 'Sven', 'IT'	, 45000.00, '2016-02-16 17:08:41', '2016-02-16 17:20:02'),
	(3, 'Judy', 'Sales'	, 55000.00, '2016-02-16 17:08:41', '2016-02-16 17:28:10'),
	(5, 'Sven', 'IT'	, 47250.00, '2016-02-16 17:20:02', '2016-02-16 17:28:10');

-- Enable system versioning
alter table dbo.Employees add period for SYSTEM_TIME(sysstart, sysend);

alter table dbo.Employees alter column sysstart add hidden;
alter table dbo.Employees alter column sysend add hidden;

alter table dbo.Employees set(SYSTEM_VERSIONING = ON(HISTORY_TABLE = dbo.EmployeesHistory));

select *
from dbo.Employees;

-- pag 307
select * 
from dbo.Employees for SYSTEM_TIME as of '2016-02-16 17:10:00';

--

select	T2.empid, 
		T2.empname,
		cast((T2.salary/T1.salary - 1)*100 as numeric(10, 2)) as pct
from dbo.Employees for system_time as of '2016-02-16 17:10:00' as T1
inner join dbo.Employees for system_time as of '2016-02-16 17:25:00' as T2
on T1.empid = T2.empid
and T2.salary > T1.salary;

-- 
select empname, empid, department, salary, sysstart, sysend
from dbo.Employees for system_time from '2016-02-16 17:15:26' to '2016-02-16 17:20:02';

select empid, empname, department, salary, sysstart, sysend
from dbo.Employees for SYSTEM_TIME between '2016-02-16 17:15:26' and '2016-02-16 17:20:02';

select empid, empname, department, salary, sysstart, sysend
from dbo.Employees for SYSTEM_TIME contained in ('2016-02-16 17:00:00', '2016-02-16 18:00:00');

-- pag 309
select empid, empname, department, salary, sysstart, sysend
from dbo.Employees for SYSTEM_TIME all;

-- pag 310
select	empid, empname, department, salary,
		sysstart at time zone 'UTC' at time zone 'Pacific Standard Time' as sysstart,
		case
			when sysend = '9999-12-31 23:59:59' then sysend at time zone 'UTC'
			else sysend at time zone 'UTC' at time zone 'Pacific Standard Time'
		end as sysend
from dbo.Employees for system_time all;

if OBJECT_ID(N'dbo.Employees', N'U') is not null
begin
	if(OBJECTPROPERTY(OBJECT_ID(N'dbo.Employees', N'U'), N'TableTemporalType')) = 2
		alter table dbo.Employees set(SYSTEM_VERSIONING = OFF);
	drop table if exists dbo.Employees, dbo.EmployeesHistory;
end

/***************EXERCISES CHAPTER 9***************/

-- Exercise 1
-- In this exercise , you create a system-versioned temporal table and identify it in SSMS.

-- Exercise 1  - 1
-- Create a system-versioned temporal called Departments with an associated history table called
-- DepartmentsHistory in the database TSQLV4. The table should have the following columns: deptid INT,
-- deptname VARCHAR(25), and mgrid INT, all disallowing NULLs. Also include columns called validfrom
-- and validto that define the validy period of the row. Define those with precision zero (1 second), and
-- make them hidden.
use TSQLV4;

create table dbo.Departments(
	deptid		int				not null
		constraint PK_Departments primary key nonclustered,
	deptname	varchar(25)		not null,
	mgrid		int				not null,
	validfrom	datetime2(0)	generated always as row start hidden not null,
	validto		datetime2(0)	generated always as row end hidden not null,
	period for SYSTEM_TIME(validfrom, validto)
)

with(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DepartmentsHistory));

-- Exercise 1 - 2
-- Browse the object tree in Object Explorer in SSMS, and identify the Departments table and its
-- associated history table.

-- Exercise 2
-- In this exercise, you'll modify data in the table Departments. Note the point in time in UTC when you
-- submit each statement, and mark those as P1, P2, and so on. You can do so by invoking the SYSUTCDATETIME
-- function in the same batch in which you submit the modification. Another option is to 
-- query the Departments table and its associated history table and to obtain the point in time from the
-- validfrom and validto columns.

-- Exercise 2 - 1
-- Insert four rows to the table Departments with the following details, and note the time when you apply
-- this insert(call it P1):

-- deptid: 1, deptname: HR, mgrid: 7
-- deptid: 2, deptname: IT, mgrid: 5
-- deptid: 3, deptname: Sales, mgrid: 11
-- deptid: 4, deptname: Marketing, mgrid: 13

select cast(SYSUTCDATETIME() as datetime2) as P1; --P1: 2022-12-05 15:59:08.9991481
insert into dbo.Departments(deptid, deptname, mgrid) values
	(1, 'HR', 7),
	(2, 'IT', 5),
	(3, 'Sales', 11),
	(4, 'Marketing', 13);

-- Exercise 2 - 2
-- In one transaction, update the name of department 3 to Sales and Marketing and delete department 4.
-- Call the point in time when the transaction starts P2.
select cast(SYSUTCDATETIME() as datetime2) as P2; -- P2: 2022-12-05 15:59:25.3280450
begin tran;
	update dbo.Departments
	set deptname = 'Sales and Marketing'
	where deptid = 3;

	delete from dbo.Departments
	where deptid = 4;
commit tran;

-- Exercise 2 - 3
-- Update the manager ID of department 3 to 13. Call the point in the time when you apply this update P3.

select cast(SYSUTCDATETIME() as datetime2) as P3; -- P3: 2022-12-05 15:59:36.4959244
update dbo.Departments
set mgrid = 13
where deptid = 3;

-- Exercise 3
-- In this exercise, you'll query date from the table Departments.

-- Exercise 3 - 1
-- Query the current state of the table Departments:
select deptid, deptname, mgrid
from dbo.Departments;

-- Exercise 3 - 2
-- Query the state of the table Departments at a point in time after P2 and before P3:
select deptid, deptname, mgrid
from dbo.Departments for system_time as of '2022-12-05 15:59:30';

-- Exercise 3 - 3
-- Query the state of the table Departments in the period between P2 and P3. Be explicit about the
-- column names in the SELECT list, and include the validfrom and validto columns:
-- Desired output (with validfrom and validto reflecting your modification times):

select deptid, deptname, mgrid, validfrom, validto
from dbo.Departments for system_time between '2022-12-05 15:59:25' and '2022-12-05 15:59:36';

-- Exercise 4
-- Drop the table Departments and its associated history table
if OBJECT_ID(N'dbo.Departments', N'U') is not null
begin
	if OBJECTPROPERTY(OBJECT_ID(N'dbo.Departments', N'U'), N'TableTemporalType') = 2
		alter table dbo.Departments set(SYSTEM_VERSIONING = OFF);
	drop table if exists dbo.Departments, dbo.DepartmentsHistory;
end;

-- pag 320
use tsqlv4;

begin tran;
	declare @neworderid as int;

	insert into Sales.Orders(custid, empid, orderdate, requireddate, shippeddate,
		shipperid, freight, shipname, shipaddress, shipcity,
		shippostalcode, shipcountry)
	values
		(85, 5, '20090212', '20090301', '20090216',
		3, 32.38, N'Ship to 85-B', N'6789 rue de l''Abbaye', N'Reims',
		N'10345', N'France');

	set @neworderid = SCOPE_IDENTITY();

	select @neworderid as neworderid;

	insert into Sales.OrderDetails(orderid, productid, unitprice, qty, discount) values
		(@neworderid, 11, 14.00, 12, 0.000),
		(@neworderid, 42, 9.80, 10, 0.000),
		(@neworderid, 72, 34.80, 5, 0.000);

commit tran;

-- pag 322
delete from Sales.Orders
where orderid > 11077;

delete from Sales.OrderDetails
where orderid > 11077;

-- pag 326

-- session 1:
begin tran;

update Production.Products
set unitprice +=1.00
where productid = 2;

-- session 2:
select productid, unitprice
from Production.Products
where productid = 2;

-- session 3:
select 
	request_session_id				as sid,
	resource_type					as restype,
	resource_database_id			as dbid,
	DB_NAME(resource_database_id)	as dbname,
	resource_description			as res,
	resource_associated_entity_id	as resid,
	request_mode					as mode,
	request_status					as status
from sys.dm_tran_locks;

select OBJECT_NAME(709577566);

-- pag 328
select 
	session_id as sid,
	connect_time,
	last_read,
	last_write,
	most_recent_sql_handle
from sys.dm_exec_connections
where session_id in(64, 65);

--
select session_id, text
from sys.dm_exec_connections
	cross apply sys.dm_exec_sql_text(most_recent_sql_handle) as st
where session_id in(64, 65);

-- pag 329
select session_id, event_info
from sys.dm_exec_connections
	cross apply sys.dm_exec_input_buffer(session_id, null) as IB
where session_id in(64, 65);

--
select 
	session_id as sid,
	login_time,
	host_name,
	program_name,
	login_name,
	nt_user_name,
	last_request_start_time,
	last_request_end_time
from sys.dm_exec_sessions
where session_id in(64, 65);

-- pag 230
select
	session_id as sid,
	blocking_session_id,
	command,
	sql_handle,
	database_id,
	wait_type,
	wait_time,
	wait_resource
from sys.dm_exec_requests
where blocking_session_id > 0;

--
select
	blocking_session_id
from sys.dm_os_waiting_tasks
where blocking_session_id > 0;

-- pag 334

-- connection 1
use TSQLV4;
begin tran;
	update Production.Products
	set unitprice += 1.00
	where productid = 2;

	select productid, unitprice
	from Production.Products
	where productid = 2;

commit tran;

-- connection 2
	select productid, unitprice
	from Production.Products
	where productid = 2;

-- pag 335
update Production.Products
set unitprice = 19.00
where productid = 2;

-- pag 336
-- connection 1
set transaction isolation level repeatable read
begin tran;
	select productid, unitprice
	from Production.Products
	where productid = 2;

commit tran;

-- Connection 2
	update Production.Products
	set unitprice += 1.00
	where productid = 2;

	update Production.Products
	set unitprice = 19.00
	where productid = 2;

-- pag 338
-- Connection 1
set transaction isolation level serializable
begin tran
	select productid, productname, categoryid, unitprice
	from Production.Products
	where categoryid = 1;

commit tran;

-- Connection 2
insert into Production.Products
	(productname, supplierid, categoryid, unitprice, discontinued)
values('Product ABCD', 1, 1, 20.00, 0);

--
delete from Production.Products
where productid > 77;

set transaction isolation level read committed;

-- pag 339
-- Connection 1
alter database TSQLV4 set allow_snapshot_isolation on;

begin tran;
	update Production.Products
	set unitprice += 1.00
	where productid = 2;

	select productid, unitprice
	from Production.Products
	where productid = 2;
commit tran;

-- Connection 2
set transaction isolation level snapshot;

begin tran;
	select productid, unitprice
	from Production.Products
	where productid = 2;
commit tran;

--
update Production.Products
	set unitprice = 19.00
	where productid = 2;

-- pag 342
-- Connection 1
set transaction isolation level snapshot

begin tran;
	select productid, unitprice
	from Production.Products
	where productid = 2;

	update Production.Products
	set unitprice = 20
	where productid = 2;

-- Connection 2
	update Production.Products
	set unitprice = 20
	where productid = 2;

-- pag 346

-- Connection 1
use TSQLV4;
begin tran;
	update Production.Products
	set unitprice += 1.00
	where productid = 2;

	select orderid, productid, unitprice
	from Sales.OrderDetails
	where productid = 2;

commit tran;

-- Connection 2
begin tran;
	update Sales.OrderDetails
	set unitprice += 1
	where productid = 2;

	select productid, unitprice
	from Production.Products
	where productid = 2;
commit tran;

--
update Production.Products
set unitprice = 19.00
where productid = 2;

update Sales.OrderDetails
set unitprice = 19.00
where productid = 2 and orderid >= 10500;

update Sales.OrderDetails
set unitprice = 15.20
where productid = 2 and orderid < 10500;

-- pag 361 - 363
use tsqlv4;

declare @empname as nvarchar(61);
	set @empname = 	(select firstname + N' ' + lastname
					from HR.Employees
					where empid = 3);
select @empname as empname;

--

declare @firstname as nvarchar(20), @lastname as nvarchar(40);
	set @firstname = 	(select firstname
						from HR.Employees
						where empid = 3);
						
	set @lastname = 	(select lastname
						from HR.Employees
						where empid = 3);
select @firstname as firstname, @lastname as lastname;
go
--

declare @firstname as nvarchar(20), @lastname as nvarchar(40);
	select 
		@firstname = firstname,
		@lastname = lastname
	from HR.Employees
	where mgrid = 2;
select @firstname as firstname, @lastname as lastname;

--

declare @empname as nvarchar(61);
	set @empname = 	(select firstname + N' ' + lastname 
					from HR.Employees
					where mgrid = 2);
select @empname as empname;

-- pag 364
-- Valid batch
print 'first batch'
use TSQLV4;
go
-- Invalid batch
print 'second batch'
select custid from Sales.Customers;
select orderid fom Sales.Customers; --ERROR!
go
-- Valid batch
print 'third batch';
select empid from HR.Employees;

-- pag 365
declare @i int;
set @i = 10;
print @i;
go

-- not valid
select @i; -- Debe declarar la variable escalar '@i'.

--
drop view if exists Sales.MyView;

create view Sales.MyView
as

select year(orderdate) as orderyear, count(*) as numorders
from Sales.Orders
group by year(orderdate);
go

-- pag 366
drop table if exists dbo.T1;
create table dbo.T1(col1 int);

alter table dbo.T1 add col2 int;
go
select col1, col2 from dbo.T1;

-- pag 367
drop table if exists dbo.T1;

create table dbo.T1(col1 int identity);

set nocount on;

insert into dbo.T1 default values;
go 100

select * from dbo.T1;

-- pag 367
if year(sysdatetime()) <> year(dateadd(day, 1, sysdatetime()))
	print 'This is the last day of the year';
else
	print 'This is not the last day of the year';

-- pag 368
if year(sysdatetime()) <> year(dateadd(day, 1, sysdatetime()))
	print 'This is the last day of the year';
else
	if month(sysdatetime()) <> month(dateadd(day, 1, sysdatetime()))
		print 'This is the last day of the month';
	else
		print 'This is not the last day of the month';

--
if day(SYSDATETIME()) = 1
	begin
		print 'This is the first day of the month';
		print 'Starting first-of-month-day process';
		/*process code goes here*/
		print 'Finished first-of-month-day process';
	end;
else
	begin
		print 'This is not the first day of the month';
		print 'Ending non-first-of-month-day process';
		/*process code goes here*/
		print 'Finished non-first-of-month-day process';
	end;

-- 
declare @i as int = 1
while @i <= 10
begin
	print @i;
	set @i = @i + 1;
end;
go
-- pag 369
declare @i as int = 1;
while @i <= 10
begin
	if @i = 6 break;
	print @i;
	set @i = @i + 1;
end;
go

--
declare @i as int = 0;
while @i <= 10
begin
	set @i = @i + 1;
	if @i = 6 continue;
	print @i;
end;

go

-- pag 370
drop table if exists dbo.Numbers;

create table dbo.Numbers(n int not null primary key);

set nocount on;

declare @i as int = 1;

while @i <= 100
begin
	insert into dbo.Numbers(n) values (@i);
	set @i = @i + 1;
end;

select * from dbo.Numbers;

-- pag 372
use TSQLV4;

set nocount on;

declare @Result as TABLE
(
	custid		int,
	ordermonth	date,
	qty			int,
	runqty		int,
	primary key(custid, ordermonth)
);

declare 
	@custid 		as int,
	@prvcustid 		as int,
	@ordermonth 	as date,
	@qty 			as int,
	@runqty 		as int;

declare C cursor fast_forward for
	select custid, ordermonth, qty
	from Sales.CustOrders
	order by custid, ordermonth;
	
open C;
	
	fetch next from C into @custid, @ordermonth, @qty;
	
	select @prvcustid = @custid, @runqty = 0;
	
	while @@fetch_status = 0
	begin
		if @prvcustid <> @custid
			select @prvcustid = @custid, @runqty = 0;
			
			set @runqty = @runqty + @qty;
			insert into @Result values(@custid, @ordermonth, @qty, @runqty);
			fetch next from C into @custid, @ordermonth, @qty;
	end;

close C;

deallocate C;

select 
	custid,
	convert(varchar(7), ordermonth, 121) as ordermonth,
	qty,
	runqty
from @Result
order by custid, ordermonth;

-- pag 373
select 
	custid,
	ordermonth,
	qty,
	sum(qty) 
	over(
		partition by custid
		order by ordermonth
		rows unbounded preceding
	) as runqty
from Sales.CustOrders
order by custid, ordermonth;

-- pag 375
drop table if exists #MyOrderTotalsByYear;
go

create table #MyOrderTotalsByYear
(
	orderyear 	int not null primary key,
	qty			int not null
);

insert into #MyOrderTotalsByYear(orderyear, qty)
	select
		year(O.orderdate) as orderyear,
		sum(OD.qty) as qty
	from Sales.Orders as O inner join Sales.OrderDetails as OD
		on O.orderid = OD.orderid
		
	group by year(orderdate);
	
select Cur.orderyear as orderyear, Cur.qty as curqty, Prv.qty as prvqty
from #MyOrderTotalsByYear as Cur left outer join #MyOrderTotalsByYear as Prv
	on Cur.orderyear = Prv.orderyear + 1;

-- other session
select orderyear, qty from #MyOrderTotalsByYear;

-- pag 376
create table ##Globals
(
	id 	sysname 	not null primary key,
	val SQL_VARIANT not null
);

insert into ##Globals(id, val) values(N'i', cast(10 as int));

-- other session
select val from ##Globals where id = N'i';

-- pag 377
declare @MyOrderTotalByYear table
(
	orderyear 	int not null primary key,
	qty			int not null
);

insert into @MyOrderTotalByYear
	select 
		year(O.orderdate) as orderyear,
		sum(OD.qty) as qty
	from Sales.Orders as O inner join Sales.OrderDetails as OD
		on O.orderid = OD.orderid
	group by year(orderdate);

select
	Cur.orderyear as orderyear, Cur.qty as curqty, Prv.qty as prvqty
from @MyOrderTotalByYear as Cur left outer join @MyOrderTotalByYear as Prv
	on Cur.orderyear = Prv.orderyear + 1;

--
select 
	year(O.orderdate) as orderyear,
	sum(OD.qty) as qty,
	lag(sum(OD.qty)) over(order by year(orderdate)) as prvqty
from Sales.Orders as O inner join Sales.OrderDetails as OD
	on O.orderid = OD.orderid
group by year(orderdate);
go
-- pag 378
drop type if exists dbo.OrderTotalByYear;

create type dbo.OrderTotalByYear as table
(
	orderyear 	int not null primary key,
	qty 		int not null
);
go

declare @MyOrderTotalByYear as dbo.OrderTotalByYear;

insert into @MyOrderTotalByYear
	select 
		year(O.orderdate) as orderyear,
		sum(OD.qty) as qty
	from Sales.Orders as O inner join Sales.OrderDetails as OD
		on O.orderid = OD.orderid
	group by year(orderdate);
	
select orderyear, qty from @MyOrderTotalByYear;

-- pag 380
declare @sql as nvarchar(100);
set @sql = 'print ''This message was printed by dynamic sql'' ';
exec(@sql);
go
-- pag 380
declare @sql as nvarchar(100);
set @sql = N'select orderid, custid, empid, orderdate
			from Sales.Orders
			where orderid = @orderid;';
exec sp_executesql
	@stmt = @sql,
	@params = N'@orderid as INT',
	@orderid = 10248;

-- pag 381
select *
from 
(
	select shipperid, year(orderdate) as orderyear, freight
	from Sales.Orders
) as D
pivot(sum(freight) for orderyear in ([2014], [2015], [2016])) as P;
go
-- pag 382
declare 
	@sql 		as nvarchar(1000),
	@first 		as int,
	@orderyear 	as int;
	
declare C cursor fast_forward for
	select distinct(year(orderdate)) as orderyear
	from Sales.Orders
	order by orderyear;
	
set @first = 1;
	
set @sql = 	
		N'select *
		from
			(
				select shipperid, year(orderdate) as orderyear, freight
				from Sales.Orders
			) as D
		pivot(sum(freight) for orderyear in (';

open C;

	fetch next from C into @orderyear;
	
	while @@fetch_status = 0
	begin
		if @first = 0
			set @sql += N',';
		else
			set @first = 0;
			
		set @sql += quotename(@orderyear);
		
		fetch next from C into @orderyear;
	end;

close C;

deallocate C;
		
set @sql += N')) as P;';

exec sp_executesql @stmt = @sql;

-- pag 384
drop function if exists dbo.GetAge;
go

create function dbo.GetAge
(
	@birthdate as date,
	@eventdate as date
)
returns int
as
begin
	return datediff(year, @birthdate, @eventdate) -
	case
		when 100*month(@eventdate) + day(@eventdate) < 100*month(@birthdate) + day(@birthdate)
			then 1
		else 0
	end;
end;
go

select empid, firstname, lastname, birthdate, dbo.GetAge(birthdate, SYSDATETIME()) as age
from HR.Employees;

-- pag 386
drop proc if exists Sales.GetCustomerOrders;
go

create proc Sales.GetCustomerOrders
	@custid 	as int,
	@fromdate	as datetime = '19000101',
	@todate 	as datetime = '99991231',
	@numrow 	as int output

as 
set nocount on;
select orderid, custid, empid, orderdate
from Sales.Orders
where custid = @custid
	and orderdate >= @fromdate
	and orderdate <  @todate

set @numrow = @@rowcount;
go

declare @rc as int;

exec Sales.GetCustomerOrders
	@custid = 1,
	@fromdate = '20150101',
	@todate = '20160101',
	@numrow = @rc output;
	
select @rc as rowsnumber;

-- pag 388
drop table if exists dbo.T1, dbo.T1_Audit;
go 

create table dbo.T1 
(
	keycol 	int 		not null primary key,
	datacol varchar(10) not null 
);

create table dbo.T1_Audit
(
	audit_lsn	int 			not null identity primary key,
	dt			datetime2(3)	not null default(sysdatetime()),
	login_name	sysname			not null default(original_login()),
	keycol 		int 			not null,
	datacol 	varchar(10) 	not null 
);
go

create trigger trg_T1_insert_audit on dbo.T1 after insert
as
	set nocount on;
	insert into dbo.T1_Audit(keycol, datacol)
		select keycol, datacol
		from inserted;
go

insert into dbo.T1(keycol, datacol) values(10, 'a');
insert into dbo.T1(keycol, datacol) values(20, 'b');
insert into dbo.T1(keycol, datacol) values(30, 'c');

select audit_lsn, dt, login_name, keycol, datacol
from dbo.T1_Audit;

drop trigger if exists trg_T1_insert_audit;

-- pag 389
drop table if exists dbo.AuditDDLEvents

create table dbo.AuditDDLEvents
(
	audit_lsn			int				not null identity,
	posttime			datetime2(3)	not null,
	eventtype			sysname			not null,
	loginname			sysname			not null,
	schemaname			sysname			not null,
	objectname			sysname			not null,
	targetobjectname	sysname			null,
	eventdata			xml				not null,
	constraint PK_AuditDDLEvents PRIMARY KEY(audit_lsn)
);
go

create trigger trg_audit_ddl_events
	on database for DDL_DATABASE_LEVEL_EVENTS
as
set nocount on;

declare @eventdata as xml = eventdata();

insert into dbo.AuditDDLEvents(
	posttime, eventtype, loginname, schemaname,
	objectname, targetobjectname, eventdata
)
values(
	@eventdata.value('(/EVENT_INSTANCE/PostTime)[1]',	'VARCHAR(23)'),
	@eventdata.value('(/EVENT_INSTANCE/EventType)[1]',	'sysname'),
	@eventdata.value('(/EVENT_INSTANCE/LoginName)[1]',	'sysname'),
	@eventdata.value('(/EVENT_INSTANCE/SchemaName)[1]',	'sysname'),
	@eventdata.value('(/EVENT_INSTANCE/ObjectName)[1]',	'sysname'),
	@eventdata.value('(/EVENT_INSTANCE/TargetObjectName)[1]',	'sysname'),
	@eventdata);
go

create table dbo.T1(col1 int not null primary key);
alter table dbo.T1 add col2 int null;
alter table dbo.T1 alter column col2 int not null;
create nonclustered index idx1 on dbo.T1(col2);

select * from dbo.AuditDDLEvents;

drop trigger if exists trg_audit_ddl_events on database;
drop table if exists dbo.AuditDDLEvents;

-- pag 391
begin try
	print(10/0);
	print('no error');
end try

begin catch
	print('error');
end catch;

-- pag 392 - 394
drop table if exists dbo.Employee;
go

create table dbo.Employee
(
	empid	int			not null,
	empname varchar(10) not null,
	mgrid	int			null,
	constraint PK_Employee primary key(empid),
	constraint CHK_Employee_empid check(empid > 0),
	constraint FK_Employee_Employee foreign key(mgrid) references dbo.Employee(empid)
);

begin try
	insert into dbo.Employee(empid, empname, mgrid)
	values(1, 'Emp1', null);
	--values(0, 'A', null);
end try

begin catch
	if ERROR_NUMBER() = 2627
	begin
		print 'Handling PK violation';
	end;

	else if ERROR_NUMBER() = 547
	begin
		print 'Handling CH/FK violation';
	end;

	else if ERROR_NUMBER() = 515
	begin
		print 'Handling null violation';
	end;

	else if ERROR_NUMBER() = 245
	begin
		print 'Handling conversion error';
	end;

	else
	begin
		print 'Re-throwing error...';
		throw;
	end;

	print '		ERROR NUMBER: ' +	cast(ERROR_NUMBER() as varchar(10));
	print '		ERROR MESSAGE: ' + ERROR_MESSAGE();
	print '		ERROR SEVERITY: ' + cast(ERROR_SEVERITY() as varchar(10));
	print '		ERROR STATE: ' + cast(ERROR_STATE() as varchar(10));
	print '		ERROR LINE: ' + cast(ERROR_LINE() as varchar(10));
	print '		ERROR PROCEDURE: ' + cast(ERROR_PROCEDURE() as varchar(10));
end catch;
go

drop proc if exists dbo.ErrInsertHandler;
go

create proc dbo.ErrInsertHandler
as
begin
set nocount on;
	if ERROR_NUMBER() = 2627
	begin
		print 'Handling PK violation';
	end;

	else if ERROR_NUMBER() = 547
	begin
		print 'Handling CH/FK violation';
	end;

	else if ERROR_NUMBER() = 515
	begin
		print 'Handling null violation';
	end;

	else if ERROR_NUMBER() = 245
	begin
		print 'Handling conversion error';
	end;

	print '		ERROR NUMBER: ' +	cast(ERROR_NUMBER() as varchar(10));
	print '		ERROR MESSAGE: ' + ERROR_MESSAGE();
	print '		ERROR SEVERITY: ' + cast(ERROR_SEVERITY() as varchar(10));
	print '		ERROR STATE: ' + cast(ERROR_STATE() as varchar(10));
	print '		ERROR LINE: ' + cast(ERROR_LINE() as varchar(10));
	print '		ERROR PROCEDURE: ' + cast(ERROR_PROCEDURE() as varchar(10));
end;

begin try
	insert into dbo.Employee(empid, empname, mgrid)
	values(1, 'Emp1', null);
end try

begin catch
	if ERROR_NUMBER() in (2627, 547, 515, 245)
		exec dbo.ErrInsertHandler;
	else
		throw;
end catch;

select * from dbo.Employee;