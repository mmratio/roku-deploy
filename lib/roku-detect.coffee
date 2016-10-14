{ Client } = require 'node-ssdp'
request = require 'request'
cheerio = require 'cheerio'
PORT = 8060
ROKU_SEARCH_STRING = 'roku:ecp'

module.exports =
  detectDevices : (callback) ->
    client = new Client
    #process response
    client.on('response', (headers, statusCode, rokuInfo) =>
      if (rokuInfo.address)
        @requestDeviceData rokuInfo.address, callback
    )
    # search for roku devices
    client.search ROKU_SEARCH_STRING


  requestDeviceData : (ip, callback) ->
    url = "http://#{ip}:#{PORT}";

    request(url, (error, response, body) ->
      if (not error and response.statusCode is 200)
        $ = cheerio.load body
        device = $('device > modelName').text() + ' - ' + $('device > modelNumber').text()
        callback?({ name : "#{device} @ #{ip}" , ip : ip })
      else
        console.log 'error!'
    )
