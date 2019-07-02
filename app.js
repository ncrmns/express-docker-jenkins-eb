'use strict'
const express = require('express');
const app = express();
const PORT = 8080

app.get('/', (req, res) => {
  res.status(200).sendFile(__dirname + '/public/index.html');
});

app.listen(PORT, () => console.log('Server is listening on port: ' + PORT));
