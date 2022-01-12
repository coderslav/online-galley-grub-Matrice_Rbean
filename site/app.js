const createError = require('http-errors');
const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');

const rootRouter = require('./routes/root');
const foodsRouter = require('./routes/foods');

const app = express();
let categories;

// view engine setup
const hbs = exphbs.create({
    extname: '.hbs',
    helpers: {
        json: (data) => {
            return JSON.stringify(data);
        },
        categoryNameGetter: (id) => {
            return categories[id - 1].name.toUpperCase();
        },
        getCategories: (categoriesFromTemplate) => {
            categories = categoriesFromTemplate;
        },
    },
});
app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');

// Register middlewares
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

// Specify from which directory to serve static files
app.use(express.static(path.join(__dirname, 'public')));

// Register routes
app.use('/', rootRouter);
app.use('/foods', foodsRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? JSON.stringify(err) : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;
