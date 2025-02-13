import prismaClient from "../../prisma"

interface userRequest{
    name:string
    email:string
    password:string
}


class CreateUserService{
    async execute({name,email,password}:userRequest){
        if(!email){
            throw new Error("Email incorreto")
        }

        const EmailExistente = await prismaClient.user.findFirst({
            where:{
                email:email
            }
        })
        if(EmailExistente){
             throw new Error("Email ja esta cadastrado")
        }

        const user = await prismaClient.user.create({
            data:{
                nome:name,
                email:email,
                password:password
             },
           select:{
            id:true,
            nome:true,
            email:true
           }
        })

        return {user}
    }
}
export {CreateUserService}