-- 1
SELECT bill_date, bill_total 
FROM restBill
WHERE cust_name = "Bob Crow";

-- 2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "%Smith" ORDER BY cust_name DESC;

-- 3
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "% C%";

-- 4
SELECT DISTINCT m.first_name, m.surname
FROM restStaff m 
JOIN restStaff g ON g.headwaiter = m.staff_no
WHERE g.headwaiter IS NOT NULL;

-- 5
SELECT * FROM restBill
WHERE bill_date LIKE "1602%";

-- 6
SELECT bill_date from restBill
WHERE bill_date LIKE "15%" ORDER BY bill_date ASC