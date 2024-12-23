# Freakymon.sql

This repository contains the **Freakymon.sql** project, a database management system designed for handling and querying a custom Pokémon-like dataset. Developed by **Eduardo Torres Alamo**, this project demonstrates proficiency in SQL for creating, managing, and interacting with relational databases.

---

## Table of Contents

- [About](#about)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Database Structure](#database-structure)
- [How to Use](#how-to-use)
- [Contributing](#contributing)

---

## About

**Freakymon.sql** is a database project designed to emulate a Pokémon-inspired universe. It includes:

- Tables for creatures (Freakymon), their abilities, stats, and types.
- Relationships between different entities, such as trainers and their Freakymon.
- Queries for data retrieval, including battles, type matchups, and stats analysis.

This project showcases advanced SQL skills, including joins, constraints, and complex queries.

---

## Technologies Used

- **SQL**: Core language for creating and managing the database.
- **SQL Plus**: Tool used for executing SQL queries.
- **VSCode**: Code editor for managing and editing the SQL scripts.
- **Notepad++**: Lightweight editor for quick modifications and notes.

---

## Features

- **Freakymon Data**: Information on various creatures, including stats, types, and abilities.
- **Trainer Data**: Details about trainers and their owned Freakymon.
- **Battle Simulation**: Queries to simulate battles based on stats and types.
- **Relational Integrity**: Properly structured relationships and constraints to ensure data consistency.
- **Custom Queries**: A set of pre-designed queries for various use cases, such as fetching top performers, type matchups, and more.

---

## Database Structure

### Example Tables

1. **Freakymon**
   - ID (Primary Key)
   - Name
   - Type1
   - Type2
   - HP, Attack, Defense, Speed, Special Attack, Special Defense

2. **Trainers**
   - ID (Primary Key)
   - Name
   - Region

3. **Ownership**
   - Trainer ID (Foreign Key)
   - Freakymon ID (Foreign Key)

4. **Abilities**
   - ID (Primary Key)
   - Name
   - Description

---

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/EduardoTorresAlamo/Freakymon.sql.git
   ```

2. Set up your database environment:
   - Install SQL Plus.
   - Open the script file using VSCode or Notepad++ for review.

3. Execute the SQL script:
   - Open SQL Plus and connect to your database.
   - Run the script:
     ```sql
     @Freakymon.sql
     ```

4. Run queries:
   - Use the pre-defined queries or write your own to explore the dataset.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature description"
   ```
4. Push to your fork:
   ```bash
   git push origin feature-name
   ```
5. Open a Pull Request.

---

## Author

**Eduardo Torres Alamo**  
GitHub: [EduardoTorresAlamo](https://github.com/EduardoTorresAlamo)

---

## Acknowledgments

Special thanks to the inspiration from the Pokémon universe and database management best practices for making this project possible.

