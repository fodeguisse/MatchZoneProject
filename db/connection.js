
var mysql = require('mysql');

var connection = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        database : "matchzone"
    }
)

connection.connection(function(err) {
    
    if (err) {
        console.error('erreur de connexion');
    }
    console.log("connecté à la base de données");
})

module.exports = connection;