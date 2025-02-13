import { Router } from "express";
import {CreateUserController}  from "./controllers/user/createUserController";
const rotas = Router();



rotas.post('/users', new CreateUserController().handle)

export default rotas