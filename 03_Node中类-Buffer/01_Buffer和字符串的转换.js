const fs = require('fs')

// 1.创建Buffer
const buf = new Buffer('hello')
console.log("🚀 ~ file: 01_Buffer和字符串的转换.js:5 ~ buf:", buf)


// 2.创建Buffer
const buf2 = Buffer.from('world')
console.log("🚀 ~ file: 01_Buffer和字符串的转换.js:10 ~ buf2:", buf2)

// 3.创建Buffer(字符串中包含中文)
const buf3 = Buffer.from('你好啊hhhhh')
console.log("🚀 ~ file: 01_Buffer和字符串的转换.js:14 ~ buf3:", buf3)
// console.log(buf3.toString())

// 4.手动指定的Buffer创建过程的编码
// 编码操作
const buf4 = Buffer.from('哈哈哈', 'utf16le')
console.log("🚀 ~ file: 01_Buffer和字符串的转换.js:20 ~ buf4:", buf4)

// // 解码操作
// console.log(buf4.toString('utf16le'))
