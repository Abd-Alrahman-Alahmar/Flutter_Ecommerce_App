//import from packages
const express = require('express');
const mongoose = require('mongoose');
const adminRouter = require('./routes/admin');

//import from other files
const authRouter = require('./routes/auth');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

//init
const PORT = process.env.PORT || 3000;
const app = express();
const DB = 'addyourdblink';

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});

//local host is set by default, zeros mean everyone can access it
app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected at port ${PORT}`);
});