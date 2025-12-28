

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


select
  *
from
  vehicles
where
  status = 'available'
  and
type
  = 'car'
  


select
  v.name as vehicle_name,
  count(*) as total_bookings
from
  vehicles as v
  inner join bookings as b on v.vehicle_id = b.vehicle_id
group by
  v.name having count(*) > 2