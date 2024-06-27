const { getAllUsers, addUser } = require("../controllers/userController");


const userRouter = require("express").Router();

userRouter.get("/users", getAllUsers)
userRouter.post("/addUser", addUser)

module.exports = userRouter;