import express from "express";
import pool from "../config/db.js";

const router = express.Router();

router.get("/", async (req, res) => {
    try {

        const search = req.query.search;
        const location = req.query.location;
        const jobType = req.query.job_type;
        const minSalary = req.query.min_salary;

        const page = Number(req.query.page) || 1;

        const limit = 10;
        const offset = (page - 1) * limit;

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

        let countQuery = `
            SELECT COUNT(*)
            FROM jobs j
            WHERE j.is_active = true
        `;

        if (search) {
            query += `
                AND j.title ILIKE '%${search}%'
            `;

            countQuery += `
                AND j.title ILIKE '%${search}%'
            `;
        }

        if (location) {
            query += `
                AND j.location = '${location}'
            `;

            countQuery += `
                AND j.location = '${location}'
            `;
        }

        if (jobType) {
            query += `
                AND j.job_type = '${jobType}'
            `;

            countQuery += `
                AND j.job_type = '${jobType}'
            `;
        }

        if (minSalary) {
            query += `
                AND j.salary_min >= ${minSalary}
            `;

            countQuery += `
                AND j.salary_min >= ${minSalary}
            `;
        }

        query += `
            ORDER BY j.posted_at DESC
            LIMIT ${limit}
            OFFSET ${offset}
        `;

        const totalJobsResult = await pool.query(countQuery);

        const totalJobs = Number(totalJobsResult.rows[0].count);

        const totalPages = Math.ceil(totalJobs / limit);

        const jobsDetail = await pool.query(query);

        res.render("jobs", {
            jobsDetail: jobsDetail.rows,
            search,
            location,
            jobType,
            minSalary,
            page,
            totalPages
        });

    } catch (err) {
        console.log(err);
        res.status(500).send("Internal Server Error");
    }
});

router.get("/delete/:id", async (req, res) => {

    try {

        const id = req.params.id;

        await pool.query(`
            DELETE FROM jobs
            WHERE id = ${id}
        `);

        res.redirect("/job");

    } catch (err) {
        console.log(err);
        res.status(500).send("Internal Server Error");
    }

});


router.get("/:id", async (req, res) => {

    try {

        const id = req.params.id;

        const jobDetail = await pool.query(`
            SELECT
                j.*,
                c.name AS company_name,
                c.industry,
                c.location AS company_location,
                c.website,
                c.founded_year
            FROM jobs j
            JOIN companies c
            ON j.company_id = c.id
            WHERE j.id = ${id}
        `);

        res.render("job-detail", {
            job: jobDetail.rows[0]
        });

    } catch (err) {
        console.log(err);
        res.status(500).send("Internal Server Error");
    }

});

export default router;