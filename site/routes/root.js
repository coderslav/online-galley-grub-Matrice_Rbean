var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('index');
});


router.get('/contact', function(req, res, next) {
  res.render('contact');
});


router.post('/contact', function(req, res, next) {
  console.log(req.body)

  res.redirect('/contact')
});


module.exports = router;
