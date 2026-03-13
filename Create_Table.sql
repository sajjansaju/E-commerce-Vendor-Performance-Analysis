CREATE TABLE vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100),
    country VARCHAR(50),
    vendor_rating DECIMAL(3,2),
    onboarding_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category_id INT,
    vendor_id INT,
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    launch_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    payment_method VARCHAR(30)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock_quantity INT,
    reorder_level INT,
    warehouse_location VARCHAR(50),
    last_restock_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


