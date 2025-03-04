require("dotenv").config();
const express = require("express");
const cors = require("cors");
const { createClient } = require("@supabase/supabase-js");

const app = express();
const PORT = process.env.PORT || 5000;

// This is to allow cross origin usage, not great for security but it
//  allows me to keep running the server without it breaking constantly
app.use(
  cors({
    origin: "*",
    methods: "GET,POST,PUT,DELETE",
    allowedHeaders: "Content-Type, Authorization",
  })
);
app.use(express.json());

// Create connection to supabase, credentials read from .env
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY;

// const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Routes
app.get("/", (req, res) => {
  res.send("Cobbler API is running!");
  res.sendStatus(200);
});

// Start the Server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
