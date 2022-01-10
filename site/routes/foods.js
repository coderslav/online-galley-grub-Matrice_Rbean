var express = require('express');
var router = express.Router();

var db = require("../database.js")

router.get('/', function(req, res, next) {
  db.all("SELECT * FROM categories", [], (err, categories) => {
    db.all("SELECT * FROM foods", [], (err, foods) => {

      foods = foods.reduce((current, elem) => { (current[elem.category_id] ??= []).push(elem) ; return current }, {})
      res.render('foods/index', { categories: categories, foods: foods });
    })
  })
});


router.get('/:id', function(req, res, next) {
  db.all("SELECT * FROM foods WHERE id = ? LIMIT 1", [req.params.id], (err, food) => {
    db.all("SELECT * FROM comments WHERE food_id = ?", [req.params.id], (err, comments) => {
      res.render('foods/show', {food: food[0], comments: comments});
    })
  })
});

module.exports = router;
