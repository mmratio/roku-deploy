Client = require('node-ssdp').Client

module.exports =
    detectRoku: ()->
	    client = new Client()

	    client.on('response',(headers, statusCode, rinfo) ->
	        console.log 'Roku detected'
	        console.log(rinfo);
	    )

	    client.search('roku:ecp')
