INSERT INTO vendors (vendor_id, vendor_name, country, vendor_rating, onboarding_date) VALUES
(1, 'TechNova', 'USA', 4.5, '2021-03-15'),
(2, 'HomeComfort', 'Australia', 4.2, '2022-06-10'),
(3, 'FitLife', 'UK', 4.7, '2020-09-21'),
(4, 'StyleHub', 'India', 4.1, '2023-01-05'),
(5, 'KitchenPro', 'Germany', 4.6, '2021-11-30'),
(6, 'EcoLiving', 'Canada', 4.3, '2022-02-14'),
(7, 'GadgetWorld', 'USA', 4.4, '2021-07-08'),
(8, 'UrbanStyle', 'Australia', 4.0, '2023-03-12'),
(9, 'FitGear', 'UK', 4.6, '2020-11-19'),
(10, 'KitchenElite', 'Germany', 4.5, '2021-04-27');


INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Home & Living'),
(3, 'Fitness'),
(4, 'Fashion'),
(5, 'Kitchen');


INSERT INTO products (product_id, product_name, category_id, vendor_id, price, cost_price, launch_date, status) VALUES
(101, 'Wireless Earbuds', 1, 1, 120.00, 70.00, '2022-01-10', 'Active'),
(102, 'Smart Watch', 1, 1, 250.00, 150.00, '2023-04-12', 'Active'),
(103, 'LED Desk Lamp', 2, 2, 45.00, 20.00, '2022-08-15', 'Active'),
(104, 'Memory Foam Pillow', 2, 2, 60.00, 30.00, '2021-12-10', 'Active'),
(105, 'Yoga Mat', 3, 3, 35.00, 15.00, '2021-05-22', 'Active'),
(106, 'Dumbbell Set', 3, 3, 150.00, 80.00, '2022-03-18', 'Active'),
(107, 'Men T-Shirt', 4, 4, 25.00, 10.00, '2023-02-01', 'Active'),
(108, 'Women Jacket', 4, 4, 120.00, 60.00, '2022-11-20', 'Active'),
(109, 'Blender Mixer', 5, 5, 90.00, 50.00, '2021-09-14', 'Active'),
(110, 'Nonstick Pan Set', 5, 5, 130.00, 75.00, '2022-07-19', 'Active'),
(111, 'Bluetooth Speaker', 1, 7, 95.00, 50.00, '2023-05-10', 'Active'),
(112, 'Smart Home Camera', 1, 7, 180.00, 120.00, '2022-09-21', 'Active'),
(113, 'Decor Wall Clock', 2, 6, 40.00, 18.00, '2022-06-15', 'Active'),
(114, 'Indoor Plant Pot', 2, 6, 25.00, 10.00, '2023-01-11', 'Active'),
(115, 'Resistance Bands Set', 3, 9, 30.00, 12.00, '2021-10-12', 'Active'),
(116, 'Treadmill', 3, 9, 650.00, 450.00, '2022-04-08', 'Active'),
(117, 'Men Jeans', 4, 8, 55.00, 28.00, '2023-02-20', 'Active'),
(118, 'Women Handbag', 4, 8, 85.00, 45.00, '2022-08-09', 'Active'),
(119, 'Air Fryer', 5, 10, 140.00, 90.00, '2023-03-25', 'Active'),
(120, 'Knife Set', 5, 10, 70.00, 35.00, '2021-12-18', 'Active'),
(121, 'Smart Desk Organizer', 2, 1, 55.00, 25.00, '2024-02-01', 'Active'),
(122, 'Portable Juicer', 5, 10, 65.00, 30.00, '2024-02-10', 'Active');

INSERT INTO orders (order_id, customer_id, order_date, order_status, payment_method) VALUES
(1001, 501, '2024-01-05', 'Completed', 'Credit Card'),
(1002, 502, '2024-01-07', 'Completed', 'PayPal'),
(1003, 503, '2024-02-10', 'Completed', 'Debit Card'),
(1004, 504, '2024-02-15', 'Cancelled', 'Credit Card'),
(1005, 505, '2024-03-03', 'Completed', 'Credit Card'),
(1006, 506, '2024-03-10', 'Completed', 'PayPal'),
(1007, 507, '2024-03-22', 'Completed', 'Debit Card'),
(1008, 508, '2024-04-02', 'Completed', 'Credit Card'),
(1009, 509, '2024-04-10', 'Completed', 'Credit Card'),
(1010, 510, '2024-04-15', 'Completed', 'PayPal'),
(1011, 511, '2024-05-02', 'Completed', 'Debit Card'),
(1012, 512, '2024-05-08', 'Completed', 'Credit Card'),
(1013, 513, '2024-05-14', 'Cancelled', 'PayPal'),
(1014, 514, '2024-05-20', 'Completed', 'Credit Card'),
(1015, 515, '2024-06-01', 'Completed', 'Debit Card'),
(1016, 516, '2024-06-10', 'Completed', 'Credit Card');


INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1001, 101, 2, 120.00, 10),
(2, 1001, 105, 1, 35.00, 0),
(3, 1002, 103, 3, 45.00, 5),
(4, 1003, 102, 1, 250.00, 15),
(5, 1003, 107, 2, 25.00, 0),
(6, 1004, 104, 1, 60.00, 0),
(7, 1005, 106, 1, 150.00, 10),
(8, 1006, 108, 1, 120.00, 20),
(9, 1007, 109, 2, 90.00, 5),
(10, 1008, 110, 1, 130.00, 10),
(11, 1009, 111, 1, 95.00, 5),
(12, 1009, 115, 2, 30.00, 0),
(13, 1010, 112, 1, 180.00, 10),
(14, 1011, 113, 3, 40.00, 0),
(15, 1012, 117, 2, 55.00, 5),
(16, 1012, 119, 1, 140.00, 10),
(17, 1013, 118, 1, 85.00, 0),
(18, 1014, 120, 2, 70.00, 5),
(19, 1015, 116, 1, 650.00, 15),
(20, 1016, 114, 2, 25.00, 0);


INSERT INTO inventory (product_id, stock_quantity, reorder_level, warehouse_location, last_restock_date) VALUES
(101, 50, 20, 'Sydney', '2024-02-10'),
(102, 30, 10, 'Melbourne', '2024-03-01'),
(103, 80, 30, 'Sydney', '2024-02-18'),
(104, 60, 25, 'Brisbane', '2024-01-25'),
(105, 100, 40, 'Melbourne', '2024-02-05'),
(106, 40, 15, 'Sydney', '2024-03-12'),
(107, 120, 50, 'Perth', '2024-02-20'),
(108, 35, 15, 'Melbourne', '2024-03-02'),
(109, 45, 20, 'Brisbane', '2024-01-30'),
(110, 25, 10, 'Sydney', '2024-03-05'),
(111, 40, 15, 'Sydney', '2024-03-20'),
(112, 25, 10, 'Melbourne', '2024-03-18'),
(113, 90, 30, 'Brisbane', '2024-02-28'),
(114, 110, 40, 'Perth', '2024-03-10'),
(115, 70, 20, 'Sydney', '2024-03-05'),
(116, 10, 5, 'Melbourne', '2024-03-12'),
(117, 95, 35, 'Perth', '2024-03-15'),
(118, 50, 20, 'Brisbane', '2024-02-25'),
(119, 30, 12, 'Sydney', '2024-03-17'),
(120, 60, 25, 'Melbourne', '2024-03-09'),
(121, 35, 15, 'Sydney', '2024-03-22'),
(122, 40, 12, 'Melbourne', '2024-03-25');


