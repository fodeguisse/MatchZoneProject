
//const fs = require('fs');
var mysql = require('mysql');

var connection = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        database: "matchzone"
    }
)

//lire le fichier sql
//const sql = fs.readFileSync('db/mydbSQL.sql', 'utf8');

//se connecter à la base de données MySQL
connection.connect((err) => {
    
    if (err) throw err;
    console.log("connecté à la base de données");
/*
    //éxécutées les requêtes pour créer la base de données et les tables
    connection.query(sql, (err) => {
        if (err) throw err;
        console.log("Base de données et tables crées avec succès");
    })
        */
})

module.exports = connection;