import express from "express";
import bodyParser from "body-parser"
import homeRoutes from "./routes/home.js";
import jobRoutes from "./routes/jobs.js";

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true}));
app.use(express.static("public"));

app.set("view engine", "ejs");

app.use("/", homeRoutes);
app.use("/job", jobRoutes);

app.listen(port, () =>{
    console.log(`server is running on port ${port}`);
});
