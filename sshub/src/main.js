// npm i koa @koa/router koa-bodyparser
const Koa = require('koa');
// const Router = require('@koa/router');
const app = new Koa();

// const useRouter = new Router({prefix:'/users'});
// useRouter.get('/list',(ctx,next) => {
//   ctx.body="获取用户列表"
// })
app.use(useRouter.routes())
app.use(useRouter.allowedMethods())







app.listen(8000,() => {
  console.log("服务器启动成功！");
})