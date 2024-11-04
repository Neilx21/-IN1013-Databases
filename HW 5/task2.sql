-- 1
SELECT SUM(bill_total) as Income
FROM restBill;

-- 2
SELECT SUM(bill_total) as Feb_Income
FROM restBill
WHERE bill_date LIKE "1602%";

-- 3
SELECT AVG(bill_total)
FROM restBill
WHERE table_no = 2;

-- 4
SELECT MIN(no_of_seats) AS Min, MAX(no_of_seats) as Max, AVG(no_of_seats) AS Avg
FROM restRest_table
WHERE room_name = "Blue";

-- 5
SELECT COUNT(DISTINCT table_no)
FROM restBill
WHERE waiter_no = 004 or waiter_no = 002