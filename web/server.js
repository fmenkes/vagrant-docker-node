'use strict';

const MongoClient = require('mongodb').MongoClient;
const express = require('express');

let database = null;
let collection = null;

const url = 'mongodb://mongo:27017/test';

MongoClient.connect(url, function(err, db) {
        if (err !== null) {
            console.log("Could not connect to MongoDB!");
            return;
        }

        database = db;
        collection = db.collection("testcollection");

        collection.updateOne({testdoc:true}, {$set:{name:"Hello World!"}}, {upsert:true});
    }
);

const PORT = 8080;

const app = express();

app.get('/', function (req, res) {
    if(database === null) {
        res.send("Could not connect to MongoDB.");
    } else {
        collection.findOne({testdoc: true}, function (err, doc) {
            if (doc !== null) {
                res.send(doc.name);
            } else {
                res.send("Could not find requested document.");
            }
        });
    }
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);