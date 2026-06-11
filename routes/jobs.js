import express from "express";
import pool from "../config/db.js";

const router = express.Router();

router.get("/", async (req, res) => {
    try {

        const search = req.query.search;
        const location = req.query.location;
        const jobType = req.query.job_type;
        const minSalary = req.query.min_salary;

        let query = `
            SELECT
                j.id,
                j.title,
                c.name AS company_name,
                j.location,
                j.job_type,
                j.salary_min,
                j.salary_max,
                j.experience_years
            FROM jobs j
            JOIN companies c
            ON j.company_id = c.id
            WHERE j.is_active = true
        `;

        if (search) {
            query += `
                AND j.title ILIKE '%${search}%'
            `;
        }

        if (location) {
            query += `
                AND j.location = '${location}'
            `;
        }

        if (jobType) {
            query += `
                AND j.job_type = '${jobType}'
            `;
        }

        if (minSalary) {
            query += `
                AND j.salary_min >= ${minSalary}
            `;
        }

        query += `
            ORDER BY j.posted_at DESC
        `;

        const jobsDetail = await pool.query(query);

        res.render("jobs", {
            jobsDetail: jobsDetail.rows,
            search,
            location,
            jobType,
            minSalary
        });

    } catch (err) {
        console.log(err);
        res.status(500).send("Internal Server Error");
    }
});

export default router;