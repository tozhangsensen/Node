const Koa = require('koa')
const KoaRouter = require('@koa/router')
const jwt = require('jsonwebtoken')

const app = new Koa()

const userRouter = new KoaRouter({ prefix: '/users' })

const secretkey = 'aaabbbccxxxx'

userRouter.get('/login', (ctx, next) => {
  // 1.颁发token
  const payload = { id: 111, name: 'why' }
  const token = jwt.sign(payload, secretkey, {
    expiresIn: 60
  })

  ctx.body = {
    code: 0,
    token,
    message: '登录成功, 可以进行其他的操作'
  }
})

userRouter.get('/list', (ctx, next) => {
  // 1.获取客户端携带过来的token
  const authorization = ctx.headers.authorization
  const token = authorization.replace('Bearer ', '')
  console.log(token)

  // 2.验证token
  try {
    const result = jwt.verify(token, secretkey)
    
    ctx.body = {
      code: 0,
      data: [
        { id: 111, name: 'why' },
        { id: 111, name: 'why' },
        { id: 111, name: 'why' },
      ]
    }
  } catch (error) {
    ctx.body = {
      code: -1010,
      message: 'token过期或者无效的token~'
    }
  }
})

app.use(userRouter.routes())
app.use(userRouter.allowedMethods())

app.listen(8000, () => {
  console.log('服务器启动成功~')
})
