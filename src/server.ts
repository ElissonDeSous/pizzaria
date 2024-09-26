import express, {Request,Response,NextFunction} from "express";
import "express-async-errors"
import rotas from "./Routes";
import cors from 'cors'


const app = express();
app.use(express.json())
app.use(cors())

app.use(rotas)


app.use((err:Error, req:Request,res:Response,next:NextFunction)=>{
   if(err instanceof Error){
        res.status(400).json({
            error: err.message
        })
   }

   res.status(500).json({
    status:"error",
    message:"Erro interno do servidor"
   })
})
app.listen(5000,()=>{
    console.log("servidor online")
})