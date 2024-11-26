-- 1
select t1.cust_name
FROM restBill t1
INNER JOIN restStaff t2 on t1.waiter_no = t2.staff_no
INNER join restStaff t3 on t2.headwaiter = t3.staff_no
WHERE t3.first_name = 'Charles' AND t1.bill_total >450.00;

-- 2
select t3.first_name, t3.surname
FROM restStaff t1
JOIN restBill t2 ON t1.staff_no = t2.waiter_no
JOIN restStaff t3 on t1.headwaiter = t3.staff_no
WHERE t2.bill_date = "160111" and t2.cust_name LIKE "Nerida %";

-- 3
select cust_name
From restBill
WHERE bill_total = (SELECT min(bill_total) from restBill)

-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT waiter_no
    FROM restBill
);

-- 5
select t1.cust_name, t3.first_name, t3.surname, t4.room_name
FROM restBill t1
JOIN restStaff t2 ON t2.staff_no = t1.waiter_no
JOIN restStaff t3 on t3.staff_no = t2.headwaiter
JOIN restRest_table t4 on t4.table_no = t1.table_no
WHERE bill_total = (SELECT max(bill_total) FROM restBill);
