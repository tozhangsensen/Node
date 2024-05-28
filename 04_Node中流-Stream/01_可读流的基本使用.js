const fs = require('fs')

// 1.一次性读取
// 缺点一: 没有办法精准控制从哪里读取, 读取什么位置.
// 缺点二: 读取到某一个位置的, 暂停读取, 恢复读取.
// 缺点三: 文件非常大的时候, 多次读取.

// fs.readFile('./aaa.txt', (err, data) => {
//   console.log(data)
// })

// 2.通过流读取文件
// 2.1. 创建一个可读流
// start: 从什么位置开始读取
// end: 读取到什么位置后结束(包括end位置字节)
const readStream = fs.createReadStream('./aaa.txt', {
 start: 8,
 end: 22,
 highWaterMark: 3
})

readStream.on('data', (mes) => {
  console.log(mes.toString())

  readStream.pause()

  setTimeout(() => {
    readStream.resume()
  }, 2000)
})



// 在Node.js中，readStream.on('data', callback)中的data是一个固定的事件名称，表示当流有可读数据时触发的事件。这是Node.js中流（Stream）的一种标准事件。

// 在这种情况下，callback是一个回调函数，当流有新的数据可读时，会执行这个函数。在你的代码中，你通过readStream.pause()暂停了流，然后在2秒后通过readStream.resume()恢复了流。这样的操作在某些情况下可能是有意义的，例如控制数据的流动速率。