-- 1
SELECT first_name, surname FROM restStaff m
JOIN restBill g on g.waiter_no = m.staff_no
WHERE cust_name = "Tanya Singh"

-- 2
SELECT rm.room_date 
FROM restRoom_management rm
JOIN restStaff s ON s.staff_no = rm.headwaiter
WHERE s.first_name = 'Charles' AND rm.room_date LIKE '1602%' AND rm.room_name = 'Green';

-- 3
SELECT first_name, surname 
FROM restStaff 
WHERE headwaiter = (SELECT headwaiter 
                    FROM restStaff 
                    WHERE first_name = 'Zoe' AND surname = 'Ball') AND staff_no != (
                    SELECT staff_no
                    FROM restStaff
                    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, w.first_name, w.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT w.first_name, w.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
WHERE b.table_no IN (
    SELECT DISTINCT b1.table_no
    FROM restBill b1
    WHERE b1.bill_no IN (00014, 00017)
);

-- 6 
SELECT s.first_name, s.surname 
FROM restStaff s
JOIN restRoom_management rm ON (s.staff_no = rm.headwaiter OR s.headwaiter = rm.headwaiter)
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;