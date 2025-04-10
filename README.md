# task-3
# 🛒 E-Commerce Database Project (MySQL)

This project simulates a simplified e-commerce database using MySQL. It demonstrates SQL operations such as SELECT, WHERE, ORDER BY, GROUP BY, JOINs, subqueries, aggregate functions, views, and more — all built on real-world e-commerce data.


---

## 🔧 Technologies Used

- MySQL 8.x
- SQL (DDL & DML)
- GitHub for version control
- Optionally: MySQL Workbench, phpMyAdmin, XAMPP

---

## 🧱 Tables & Sample Schema

### 👥 `customers`
| customer_id | name   | city       |
|-------------|--------|------------|

### 🧾 `orders`
| order_id | customer_id | order_date | total_amount |

### 📦 `products`
| product_id | name       | category     | price  |

### 📋 `order_items`
| item_id | order_id | product_id | quantity |

---

## 📌 Features & Operations

### ✅ Basic SQL Operations
- SELECT, WHERE, ORDER BY
- GROUP BY with aggregates (SUM, AVG, COUNT)

### 🔗 Joins
- INNER JOIN, LEFT JOIN, RIGHT JOIN (if supported)

### 🧠 Subqueries
- Filters based on nested queries and aggregates

### 📊 Views
- Summarized customer order metrics

### 🚀 Optimization
- Index strategies explained (not supported in some environments)

---


