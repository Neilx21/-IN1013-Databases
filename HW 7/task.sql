-- 1
CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE first_name = 'Sam' AND surname = 'Pitt';


SELECT * from samsBills;

-- 2
Select * from samsBills
WHERE bill_total > 400;

-- 3
Create view roomTotals
AS SELECT room_name, COUNT(restBill.table_no) as total_sum
FROM restRest_table
INNER JOIN restBill on restRest_table.table_no = restBill.table_no
GROUP BY room_name;

SELECT * FROM roomTotals;

-- 4
create view teamTotals 
AS SELECT concat(l.first_name, ' ', l.surname) as headwaiter_name, SUM(restBill.bill_total) as total_sum
FROM restBill
INNER JOIN restStaff w ON restBill.waiter_no = w.staff_no
JOIN restStaff l on w.headwaiter = l.staff_no
WHERE l.headwaiter IS NULL
GROUP BY l.staff_no;

SELECT * from teamTotals
