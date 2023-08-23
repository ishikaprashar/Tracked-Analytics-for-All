CREATE TABLE `Order_items` (
  `order_id` int PRIMARY KEY,
  `product_id` int,
  `quantity` int
);

CREATE TABLE `Orders` (
  `Id` int PRIMARY KEY,
  `User_id` int,
  `status` varchar(255),
  `created_at` varchar(255)
);

CREATE TABLE `products` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `merchant_id` int,
  `price` int,
  `status` varchar(255),
  `created_at` varchar(255)
);

CREATE TABLE `merchants` (
  `id` int PRIMARY KEY,
  `admin_id` int,
  `merchant_name` varchar(255),
  `country_code` int,
  `created_at` varchar(255)
);

CREATE TABLE `Users` (
  `id` int PRIMARY KEY,
  `fullname` varchar(255),
  `email` varchar(255),
  `gender` varchar(255),
  `dob` varchar(255),
  `created_at` varchar(255),
  `country_code` int
);

CREATE TABLE `countries` (
  `code` int PRIMARY KEY,
  `name` varchar(255),
  `continent_name` varchar(255)
);

ALTER TABLE `Users` ADD FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`);

ALTER TABLE `merchants` ADD FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`);

ALTER TABLE `Order_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`);

ALTER TABLE `products` ADD FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`);

ALTER TABLE `Order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`Id`);
