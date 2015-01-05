'use strict';
var restify = require('restify');

function getPing(req, res, next) {
    res.send('pong');
    next();
}

var consultants = [{
  name: 'test.consultant',
  email: 'test.consultant@smsmt.com',
  clients: [
    {
      name: 'TestClient'
    }
  ]
}];

function getConsultant(req, res, next) {
    console.log("Consultant: " + req.params.id);
    res.send(consultants[0]);
    next();
}

var server = restify.createServer();
server.get('/ping/', getPing);

server.get('/consultant/:id', getConsultant);

server.listen(8080, function() {
    console.log('%s listening at %s', server.name, server.url);
});