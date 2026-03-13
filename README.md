# 📊 E-commerce Vendor Performance Analysis (SQL Project)

## 📌 Project Overview

This project analyses **vendor performance, product sales, category trends, and inventory health** for an e-commerce platform using SQL.

The goal of this project is to generate insights that help businesses:

- 📈 Improve vendor performance  
- 📦 Optimise product selection  
- 🛒 Monitor product demand  
- ⚠️ Identify inventory risks  

The analysis simulates real-world **e-commerce data analysis used by large online retail platforms**.

---

# 🎯 Business Problem

E-commerce platforms manage multiple vendors, thousands of products, and daily transactions. Understanding vendor and product performance is essential for improving revenue and operational efficiency.

This project answers key business questions such as:

- 🏆 Which vendors generate the most revenue?
- 📦 Which products drive the highest sales?
- 📊 Which categories perform best?
- ⚠️ Which products are at risk of stockout?
- 🛒 Are there products listed but never sold?

These insights help businesses improve **vendor management, product strategy, and inventory planning**.

---

# 🗄 Database Schema

The dataset contains **6 relational tables** representing vendors, Categories, products, orders, Order Items and inventory.

---

# 🗺️ Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    VENDORS {
        INT vendor_id PK
        VARCHAR vendor_name
        VARCHAR country
        DECIMAL vendor_rating
        DATE onboarding_date
    }

    CATEGORIES {
        INT category_id PK
        VARCHAR category_name
    }

    PRODUCTS {
        INT product_id PK
        VARCHAR product_name
        INT category_id FK
        INT vendor_id FK
        DECIMAL price
        DECIMAL cost_price
        DATE launch_date
        VARCHAR status
    }

    ORDERS {
        INT order_id PK
        INT customer_id
        DATE order_date
        VARCHAR order_status
        VARCHAR payment_method
    }

    ORDER_ITEMS {
        INT order_item_id PK
        INT order_id FK
        INT product_id FK
        INT quantity
        DECIMAL unit_price
        DECIMAL discount
    }

    INVENTORY {
        INT product_id PK
        INT stock_quantity
        INT reorder_level
        VARCHAR warehouse_location
        DATE last_restock_date
    }

    VENDORS ||--o{ PRODUCTS : supplies
    CATEGORIES ||--o{ PRODUCTS : classifies
    ORDERS ||--o{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : appears_in
    PRODUCTS ||--|| INVENTORY : stock
```
---


## What the relationships mean
- One **vendor** can supply many **products**
- One **category** can contain many **products**
- One **order** can contain many **order items**
- One **product** can appear in many **order items**
- One **product** has one **inventory record**

---
