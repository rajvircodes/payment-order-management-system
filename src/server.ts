import "dotenv/config";
configDotenv()
import app from "./app.js";
import { configDotenv } from "dotenv";

const PORT = process.env.PORT

app.listen(PORT,()=>{
    console.log(`Server is running on ${PORT}`)
})