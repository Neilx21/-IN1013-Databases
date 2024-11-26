-- 1
SELECT 
    t1.first_name, 
    t1.surname, 
    t2.bill_date, 
    COUNT(*) AS bill_count
FROM restStaff t1
JOIN restBill t2 ON t2.waiter_no = t1.staff_no
GROUP BY t1.first_name, t1.surname, t2.bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT room_name, COUNT(*) AS table_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT t1.room_name, SUM(t2.bill_total)
FROM restRest_table t1
JOIN restBill t2 on t2.table_no = t1.table_no
GROUP BY t1.room_name

-- 4
SELECT t3.first_name, t3.surname, sum(t2.bill_total) AS Total_Bill_Amount
FROM restStaff t1
JOIN restBill t2 ON t2.waiter_no = t1.staff_no
JOIN restStaff t3 on t1.headwaiter = t3.staff_no
GROUP BY t1.headwaiter
ORDER BY Total_Bill_Amount DESC

-- 5
SELECT cust_name, AVG(bill_total) as average_bill
FROM restBill
group by cust_name
HAVING average_bill > 400

-- 6 
SELECT t1.first_name,t1.surname, count(*) as bill_count
FROM restStaff t1
JOIN restBill t2 on t2.waiter_no = t1.staff_no
group by t1.first_name, t1.surname
HAVING bill_count >= 3;