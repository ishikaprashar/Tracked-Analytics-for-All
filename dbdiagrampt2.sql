CREATE TABLE `Customer` (
  `customer_id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255)
);

CREATE TABLE `Flight` (
  `flight_id` int PRIMARY KEY,
  `customer_id` int
);

CREATE TABLE `schedule` (
  `flight_id` int,
  `arrival_time` int,
  `departure_time` int,
  `departure_gate` varchar(255),
  `departure_location` varchar(255),
  `aircraft_id` int,
  `arrival_location` varchar(255)
);

CREATE TABLE `booking` (
  `booking_code` int PRIMARY KEY,
  `flight_id` int,
  `cabin_class_id` int
);

CREATE TABLE `price` (
  `price` int,
  `cabin_class_id` int,
  `destination` varchar(255)
);

CREATE TABLE `aircraft` (
  `aircraft_id` int PRIMARY KEY,
  `aircraft_operator` varchar(255)
);

ALTER TABLE `Flight` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

ALTER TABLE `schedule` ADD FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`);

ALTER TABLE `schedule` ADD FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`aircraft_id`);

ALTER TABLE `booking` ADD FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`);

CREATE TABLE `price_booking` (
  `price_cabin_class_id` int,
  `booking_cabin_class_id` int,
  PRIMARY KEY (`price_cabin_class_id`, `booking_cabin_class_id`)
);

ALTER TABLE `price_booking` ADD FOREIGN KEY (`price_cabin_class_id`) REFERENCES `price` (`cabin_class_id`);

ALTER TABLE `price_booking` ADD FOREIGN KEY (`booking_cabin_class_id`) REFERENCES `booking` (`cabin_class_id`);


CREATE TABLE `price_schedule` (
  `price_cabin_class_id` int,
  `schedule_arrival_location` varchar,
  PRIMARY KEY (`price_cabin_class_id`, `schedule_arrival_location`)
);

ALTER TABLE `price_schedule` ADD FOREIGN KEY (`price_cabin_class_id`) REFERENCES `price` (`cabin_class_id`);

ALTER TABLE `price_schedule` ADD FOREIGN KEY (`schedule_arrival_location`) REFERENCES `schedule` (`arrival_location`);

