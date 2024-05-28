const fs = require('fs')

// 1.有一段内容(客户端传递过来http/express/koa)
const content = "hello world, my name is ss"


// flag: 'a' 追加，w默认覆盖,w+可读可写
// 2.文件的写入操作
fs.writeFile('./ccc.txt', content, {
  encoding: 'utf8',
  flag: 'a'
}, (err) => {
  if (err) {
    console.log("文件写入错误:", err)
  } else {
    console.log("文件写入成功")
  }
})
