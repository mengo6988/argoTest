const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Kubernetes and Argo Workflows demo!');
});

app.get('/health', (req, res) => {
  res.status(200).send('Healthy');
});

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
});
