const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, Kubernetes! aabbdd, #UPDATED');
});

app.listen(port, () => {
  console.log(`NodeJS app is running on http://localhost:${port}`);
});