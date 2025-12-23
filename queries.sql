-- Query 1: JOIN (Retrieve booking info with Customer & Vehicle names)

SELECT 
    b.booking_id, 
    u.name AS customer_name, 
    v.name AS vehicle_name, 
    b.start_date, 
    b.end_date, 
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id;



-- Query 2: EXISTS (Vehicles never booked)

SELECT * 
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1 FROM bookings b WHERE b.vehicle_id = v.vehicle_id
);


-- Query 3: WHERE (Available cars)

SELECT * 
FROM vehicles 
WHERE type = 'car' AND status = 'available';


-- Query 4: GROUP BY and HAVING (Vehicles with more than 2 bookings)

SELECT 
    v.name AS vehicle_name, 
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;




