const userRouter = require("./routes/userRoute");

const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());  // Middleware pour parser le JSON


app.use('/api', userRouter)

 // Route de test
app.get('/', (req, res) => {
    res.send('Hello World!');
  });
  
  // Démarrage du serveur
  app.listen(port, () => {
    console.log(`Serveur à l'écoute sur http://localhost:${port}`);
});