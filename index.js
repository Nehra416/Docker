const express = require("express");
const app = express();

const PORT = process.env.PORT || 8000;

app.get("/", (req, res) => {
    return res.json({
        message: "Hello from the Docker's nodejs"
    })
});

app.listen(PORT, () => {
    console.log("Server is started on PORT: " + PORT)
})
