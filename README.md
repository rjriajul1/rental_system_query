# Vehicle Rental System - SQL Queries

## Project Overview
This project is designed to demonstrate the use of SQL queries based on a simplified **Vehicle Rental System** database.  
The system manages **Users**, **Vehicles**, and **Bookings**, and the queries are intended to retrieve meaningful information based on real-world business logic.

---

## Database Tables

### 1. Users
Stores user information.

| Column Name | Description |
|-------------|------------|
| id (PK)     | Primary Key, unique user ID |
| role        | Admin / Customer |
| name        | User name |
| email       | Unique email |
| password    | User password |
| phone       | Contact number |

---

### 2. Vehicles
Stores vehicle information.

| Column Name | Description |
|-------------|------------|
| id (PK)     | Primary Key, unique vehicle ID |
| name        | Vehicle name |
| type        | Car / Bike / Truck |
| model       | Model name |
| registration_number | Unique registration number |
| price_per_day | Rental price per day |
| availability_status | Available / Rented / Maintenance |

---

### 3. Bookings
Stores booking information and connects Users and Vehicles.

| Column Name | Description |
|-------------|------------|
| id (PK)     | Primary Key, unique booking ID |
| user_id (FK)| References Users(id) |
| vehicle_id (FK) | References Vehicles(id) |
| start_date  | Rental start date |
| end_date    | Rental end date |
| status      | Pending / Confirmed / Completed / Cancelled |
| total_cost  | Total booking cost |

---

## SQL Queries

### **Query 1: Booking Information (INNER JOIN)**
**Objective:** Retrieve booking details along with customer name and vehicle name.

```sql
select
  booking_id,
  u.name,
  v.name,
  start_date,
  end_date,
  b.status
from
  bookings as b
  inner join users as u on b.user_id = u.user_id
  inner join vehicles as v on b.vehicle_id = v.vehicle_id


### **Query 2: Vehicles Never Booked (NOT EXISTS)**
**Objective:** Find all vehicles that have never been booked.

```sql

SELECT
  *
FROM
  vehicles as v
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      bookings as b
    WHERE
      b.vehicle_id = v.vehicle_id
  );


Query 3: Available Vehicles of a Specific Type (WHERE)
Objective: Retrieve all available vehicles of a given type (e.g., cars).

```sql

select
  *
from
  vehicles
where
  status = 'available'
  and
type
  = 'car'


Query 4: Vehicles with More Than 2 Bookings (GROUP BY & HAVING)
Objective: Find total number of bookings for each vehicle and display only those with more than 2 bookings.

```sql

select
  v.name as vehicle_name,
  count(*) as total_bookings
from
  vehicles as v
  inner join bookings as b on v.vehicle_id = b.vehicle_id
group by
  v.name having count(*) > 2