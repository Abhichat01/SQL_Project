/* SQL_Project1 */

use AdventureWorks2012

--a. Get all the details from the person table including email ID, phone number and phone number type
select P.*, PE.EmailAddress, PP.PhoneNumber, PP.PhoneNumberTypeID from Person.Person as P inner join Person.PersonPhone as PP
on P.BusinessEntityID = PP.BusinessEntityID
inner join Person.EmailAddress as PE
on PP.BusinessEntityID = PE.BusinessEntityID

--b. Get the details of the sales header order made in May 2011

select * from Sales.SalesOrderHeader where year(OrderDate) = 2011 and month(OrderDate) = 5

--c. Get the details of the sales details order made in the month of May 2011

Select S.* from Sales.SalesOrderDetail as S inner join Sales.SalesOrderHeader as SO
on S.SalesOrderID = SO.SalesOrderID
where year(SO.OrderDate) = 2011 and month(SO.OrderDate) = 5


--d. Get the total sales made in May 2011
select OrderDate, sum(totaldue) [total_sum] from Sales.SalesOrderHeader
group by OrderDate
having year(OrderDate) = 2011 and month(OrderDate) = 5



--e. Get the total sales made in the year 2011 by month order by increasing sales
select year(OrderDate) [Year], month(OrderDate) [Month], sum(totaldue) [total_sum] from sales.SalesOrderHeader
group by year(OrderDate), month(OrderDate)
having year(OrderDate)=2011
order by sum(totaldue)


--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName = 'Achong'
select * from Sales.SalesOrderHeader
select * from Sales.Customer C
select * from Person.Person

select P.FirstName,P.LastName, sum(S.TotalDue) total_sales 
from sales.SalesOrderHeader S
inner join Sales.Customer C
on S.CustomerID = C.CustomerID
inner join person.Person P 
on C.PersonID = P.BusinessEntityID
where P.FirstName = 'Gustavo' and P.LastName = 'Achong'
group by P.FirstName, P.LastName
