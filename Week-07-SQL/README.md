# 🛢 CS50x - Week 07: SQL
## 🌟 Overview
This folder contains my solutions for Week 7 of Harvard's CS50x course, focusing on SQL and database management. Week 7 introduces Structured Query Language (SQL) for creating, querying, and manipulating relational databases using SQLite. These exercises enhance my ability to design efficient database schemas and write complex queries to extract insights from data. 🚀
## 🧩 Problem Sets
Below are the problem sets and labs included in this folder, with brief descriptions:
- **Songs**: A program to answer questions about a database of the 100 most-streamed songs on Spotify in 2018 using SQL queries. 💽
- **Movies**: A series of SQL queries to answer questions about the IMDb movie database; linking movies, stars, directors, and ratings using SELECT statements with JOINs, aggregates, and subqueries. 🎬
- **Fiftyville**: A detective-style investigation using SQL to solve a crime by querying a database of logs, interviews, and transactions to identify culprits and accomplices. 🕵️‍♂️

## 📚 Learning Objectives
Through these assignments, I aimed to master the following concepts:
- **SQL Basics**: Creating tables, inserting data, and using data types like INTEGER, TEXT, and REAL.
- **Querying Data**: Writing SELECT statements with WHERE, ORDER BY, LIMIT, and DISTINCT clauses.
- **Advanced Queries**: Using JOINs to combine tables, aggregate functions (COUNT, AVG, MAX), and subqueries for complex analysis.
- **Database Design**: Normalizing data with primary keys, foreign keys, indexes, and constraints for efficient storage and retrieval.
- **Transactions**: Managing database changes with INSERT, UPDATE, DELETE, and handling atomic operations.
- **Tools**: Using SQLite commands, CS50's SQL library in Python, and visualizing data with tools like DB Browser for SQLite.

## ⚙️ How to Run the Code
To run the programs:
1. Ensure Python 3 and SQLite are installed (`sqlite3 --version`).
2. Clone the repository: `git clone https://github.com/nvgraha/intro-to-cs.git`
3. Navigate to the folder: `cd intro-to-cs/Week-07-SQL`
4. For SQL files: Open in SQLite (`sqlite3 database.db`) and run `.read queries.sql` or execute queries directly.
5. For Python-integrated scripts: `python3 script.py` (e.g., using CS50's SQL module).

Use CS50 tools like `check50` for testing and submit via `submit50`. 🛠️
## 💭 Reflections
Week 7 was a fascinating dive into the world of databases! 🛢 Learning SQL felt like unlocking a superpower for handling real-world data—querying the Fiftyville database to crack a mystery case was incredibly engaging and taught me the power of relational data. Mastering JOINs and aggregates boosted my ability to think logically about data relationships. These exercises made me appreciate how databases power everything from apps to analytics.

## 📂 Directory Structure
Here’s how the repository is organized:
```
Week-07-SQL/
├── Problem-Set-07/
│   ├── 1-Songs/
│   ├── 2-Movies/
│   ├── 3-Fiftyville/
│   └── README.md
└── README.md
```
> **Note**: The `movies.db` file is not included in this repository due to its size. You can download it from the [external link](https://drive.google.com/file/d/1zfDFwFnrs4FtV9k2vX8GLIe7OGq1eUS8/view?usp=drive_link).

Thanks for checking out my CS50x project! Looking forward to JavaScript in Week 8! 💻
