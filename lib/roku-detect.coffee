{ Client } = require 'node-ssdp'
request = require 'request'
cheerio = require 'cheerio'
PORT = 8060;

module.exports =
    detect: detectRoku


detectRoku() ->
    client = new Client
    #process response
    client.on('response', (headers, statusCode, rinfo) ->
        if (rinfo.address)
            requestDeviceData rinfo.address
    )
    # search for roku devices
    client.search 'roku:ecp'
}

requestDeviceData(ip) ->
    url = "http://#{ip}:#{PORT}";

    request(url, (error, response, body) ->
        if (!error && response.statusCode == 200)
            $ = cheerio.load body
            console.log 'Found:', $('device > friendlyName').text(),'@',ip
        else
            console.log 'error!'
    )
