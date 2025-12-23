# Vehicle Rental System - Database Design & SQL Queries

## 1. Project Explanation

This project is a **Vehicle Rental System** designed to manage the core operations of a rental business. It handles three main entities: **Users**, **Vehicles**, and **Bookings**.

The system allows **Customers** to book vehicles and **Admins** to manage the fleet. It tracks vehicle availability (available, rented, or under maintenance) and automatically records the history of bookings. The database is built using **PostgreSQL** with a focus on relational integrity, using Primary Keys to uniquely identify records and Foreign Keys to establish relationships between users, vehicles, and their specific rental transactions.

---

## 2. SQL Queries and Solutions

The following queries solve specific business requirements and are also available in the `queries.sql` file.

### Query 1: JOIN (Retrieve booking information)

**Requirement**: Retrieve booking information along with the Customer name and Vehicle name.

```sql
SELECT
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```

### Query 2: EXISTS (Vehicles never booked)

**Requirement**: Find all vehicles that have never been booked using the `NOT EXISTS` concept.

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);
```

### Query 3: WHERE (Filter available vehicles)

**Requirement**: Retrieve all available vehicles of a specific type (e.g., 'car').

```sql
SELECT *
FROM vehicles
WHERE type = 'car'
AND status = 'available';
```

### Query 4: GROUP BY and HAVING (High-demand vehicles)

**Requirement**: Find the total number of bookings for each vehicle and display only those that have more than 2 bookings.

```sql
SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
```

---

## Links

- **ERD Link**: [PASTE_YOUR_DBDIAGRAM_LINK_HERE]

---

### 💡 Quick Instructions :

1.  The table schemas and sample data insertion scripts are located in `queries.sql`.
2.  The ERD link provides a visual representation of the relationships (1:M between Users and Bookings and M:1 between Bookings and Vehicles).
3.  All queries were tested using PostgreSQL and match the expected output defined in the assignment requirements.
