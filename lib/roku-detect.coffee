{ Client } = require 'node-ssdp'
request = require 'request'
cheerio = require 'cheerio'
PORT = 8060;

module.exports =
    detectDevices : (callback) ->
        client = new Client
        #process response
        client.on('response', (headers, statusCode, rinfo) ->
            if (rinfo.address)
                @requestDeviceData rinfo.address, callback
        )
        # search for roku devices
        client.search 'roku:ecp'


    requestDeviceData : (ip, callback) ->
        url = "http://#{ip}:#{PORT}";

        request(url, (error, response, body) ->
            if (not error and response.statusCode is 200)
                $ = cheerio.load body
                console.log 'Found:', $('device > friendlyName').text(),'@',ip
                callback?(ip)
            else
                console.log 'error!'
        )
