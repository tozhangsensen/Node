const http = require('http');
const path = require('path');

// 1.创建server服务器
const server = http.createServer((req, res) => {
  // request对象中包含哪些信息?
  // 1.url信息
  console.log(req.url)
  // 2.method信息(请求方式)
  console.log(req.method)

  // 3.headers信息(请求信息)
  console.log(req.headers)

  res.end('hello world aaaa')
})


// 2.开启server服务器
server.listen(8000, () => {
  console.log('服务器开启成功~')
})
