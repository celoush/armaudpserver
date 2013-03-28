dgram = require "dgram"
fs = require "fs"
stream = fs.createWriteStream "received.txt",
  flags: 'w'
  encoding: "utf8"
  mode: '0666'

server = dgram.createSocket "udp4"
server.on "message", (msg, rinfo) ->
  console.log "server got: " + msg + " from " + rinfo.address + ":" + rinfo.port
  stream.write msg

server.on "listening", ->
  address = server.address()
  console.log "server listening " + address.address + ":" + address.port

server.bind 4433
