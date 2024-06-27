const connection = require("../db/mydb");



const getAllUsers = async(req, res) =>{
    //const queryUsers = 'SELECT * FROM user';
    connection.connect(function(err) {
        if (err) throw err;
        connection.query("SELECT * FROM user", function (err, result, fields) {
          if (err) throw err;
          console.log(result);
        });
      });
};

const addUser = async(req, res) => {
    const {lastName, firstName, email, phone, id_role} = req.body;
    const newUser = {name, age};
    const myQuery = 'INSERT INTO users FROM SET ? ';

    try {
        const user = pool.query(myQuery, newUser);
        res.json(user)
    } catch (error) {
        console.error('Erreur lors de l\'ajout de l\'utilisateur:', error);
        res.status(500).json({ error: "Failed to add user" });
    }
};

module.exports = {getAllUsers, addUser};


