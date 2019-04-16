let http = require('http')


http.createServer(function (req, res) {
  res.write('नमस्ते दुनिया')
  res.end()
}).listen(process.env.PORT || 5000)
