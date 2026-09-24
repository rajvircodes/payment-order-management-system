import "dotenv/config";
configDotenv()
import app from "./app.js";
import { configDotenv } from "dotenv";
import pool from "./config/db.js";

const PORT = process.env.PORT


const startServer = async()=>{
    try {
        await pool.query("SELECT 1")

        console.log("PostgreSQL connected successfully!");
        app.listen(PORT, ()=>{
            console.log(`Server is running on ${PORT}`)

        })
        
    } catch (error) {
        console.error("Failed to connect postgreSQL",error);
        process.exit(1)
    }
}

startServer()
