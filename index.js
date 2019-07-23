let http = require('http')


http.createServer(function (req, res) {
  res.write('Godspeed')
  res.end()
}).listen(5000)
