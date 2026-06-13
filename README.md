# Job Board Portal

A full-stack Job Board Portal built using Node.js, Express.js, PostgreSQL, EJS, and CSS. The application allows users to browse job listings, apply filters, view detailed job information, and manage jobs efficiently.

---

## Features

### Dashboard

* Total Active Jobs Count
* Total Companies Count
* Active Cities Count
* Latest 5 Job Listings
* Quick Navigation to Jobs Page

### Jobs Listing

* View all available jobs
* Search jobs by title
* Filter jobs by:

  * Location
  * Job Type
  * Minimum Salary
* Multiple filters can be applied together
* Active jobs only

### Pagination

* 10 jobs per page
* Previous and Next navigation
* Direct page number navigation
* Filter-aware pagination

### Job Details

* Dynamic route using Job ID
* Company Information
* Job Information
* Job Description

### Job Management

* Delete Job functionality
* Automatic redirection after deletion

### Database

* PostgreSQL relational database
* Companies and Jobs tables
* Foreign Key relationships
* Database schema included in `database.sql`

---

## Tech Stack

### Backend

* Node.js
* Express.js

### Database

* PostgreSQL

### Frontend

* EJS
* CSS

### Version Control

* Git
* GitHub

---

## Database Structure

### Companies Table

Stores company information.

Fields include:

* id
* name
* industry
* location
* website
* founded_year

### Jobs Table

Stores job listings.

Fields include:

* id
* title
* description
* company_id
* location
* job_type
* salary_min
* salary_max
* experience_years
* is_active
* posted_at

---

## SQL Concepts Used

* SELECT
* COUNT
* DISTINCT
* JOIN
* ORDER BY
* LIMIT
* OFFSET
* DELETE
* WHERE Conditions

---

## Backend Concepts Used

* Express Routing
* Query Parameters
* Route Parameters
* Dynamic SQL Queries
* Server-side Rendering
* Pagination Logic
* Filtering Logic

---

## Installation

### Clone Repository

```bash
git clone <repository-url>
cd Job_Board_Portal
```

### Install Dependencies

```bash
npm install
```

### Configure Environment Variables

Create a `.env` file:

```env
DB_USER=your_username
DB_HOST=localhost
DB_NAME=your_database_name
DB_PASSWORD=your_password
DB_PORT=5432
```

### Create Database

Run the SQL schema:

```bash
psql -U postgres -d your_database_name -f database.sql
```

### Start Server

```bash
npm start
```

or

```bash
node index.js
```

---

## Project Structure

```text
Job_Board_Portal/
│
├── config/
│   └── db.js
│
├── routes/
│   ├── home.js
│   └── jobs.js
│
├── views/
│   ├── home.ejs
│   ├── jobs.ejs
│   └── job-detail.ejs
│
├── public/
│   └── styles/
│       └── main.css
│
├── database.sql
├── index.js
├── package.json
└── README.md
```

---

## Future Improvements

* Add Job Form
* Update Job Feature
* Company Management
* Authentication & Authorization
* Save Jobs Functionality
* Apply for Jobs Feature
* Admin Dashboard

---

## Author

**Divyanshu Gautam**

B.Tech CSE, IIIT Kalyani

Aspiring Backend Developer
