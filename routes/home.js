import express from "express";
import pool from "../config/db.js";

const router = express.Router();

router.get("/", async (req, res) => {
    const totalActive = await pool.query(`
        SELECT COUNT(*) FROM jobs
        WHERE jobs.is_active = true;
    `)

    const totalCompanies = await pool.query(`
        SELECT COUNT(*) FROM companies;
        `); 

    const latestJobs = await pool.query(`
        SELECT c.name AS Company, j.title AS Role 
        FROM jobs j
        JOIN companies c
        ON j.company_id = c.id
        ORDER BY posted_at DESC LIMIT 5;
        `);

    const totalCities = await pool.query(`
        SELECT COUNT(DISTINCT location) FROM jobs
        WHERE is_active = true AND location <> 'Remote';
        `);

    console.log(totalActive.rows[0]); 
    console.log(totalCompanies.rows[0]);
    console.log(latestJobs.rows)
    console.log(totalCities.rows[0]); 

    res.render("home", {totalActive : totalActive.rows[0],
        totalCompanies: totalCompanies.rows[0],
        latestJobs : latestJobs.rows,
        totalCities : totalCities.rows[0] 
    });

});

export default router;