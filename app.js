const express = require('express');
const app = express();
const fileupload = require("express-fileupload");
const mysql = require('mysql');
var fs = require('fs');
const  path  = require('path');
const { constants } = require('buffer');


const PORT = 2500;


// connnection pool
const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password:"root",
  port: "8889",
database: "image-progate",
})



/*
const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost" ,
  user: "root",
  password: "root",
  port:"8889",
  database: "image-uploader-youtube",
  });
*/

app.use(express.static('public'));

app.use(fileupload());


app.get('/', (req, res) => {

  pool.getConnection((err, connection ) => {
    if(err) throw err;
    
    console.log("MYSQLと接続中・・・・！！！");
  



    // データの取得

    connection.query(" SELECT *  FROM image" , (err, rows) =>{
connection.release();

console.log(rows);


if(!err)
{
  res.render("index.ejs", { web: rows});
}


    });
  });
//     res.render("index.ejs");
  });



app.get('/top', (req, res) => {
  res.render('top.ejs');
});

app.get('/index', (req, res) => {
  res.render('index.ejs');
});




app.post("/",(req,res) =>{
  let imageFile = req.files.imageFile;
// let uploadPath = __dirname + "/upImage/images" + imageFile.name;
let uploadPath = __dirname + "/public/images/" + imageFile.name;
imageFile.mv(uploadPath,function(err) {
  if(err) return res.status(500).send(err);


});

// Mysqlに画像を追加して保存する。

pool.getConnection((err, connection ) => {
  if(err) throw err;
  
  console.log("MYSQLと接続中・・・・！！！");
var abc = "xxx";
connection.query('INSERT INTO  image(imageName) VALUES  ("${abc}")`',
  (err, rows) =>{
  connection.release();
  console.log(rows);
  if(!err)
  {
   
    res.redirect("/");
  }
  else {
    console.log(err);
  }
  
      }
);
});


});

app.listen(PORT,() => 
console.log("サーバー起動中だよー！")

);


/*
let text = fs.readFileSync("test.txt",'utf-8');
 console.log(text);


fs.writeFile('test.txt','
 <!--
  <p>↓に画像を表示</p>
  <% web.forEach(function(value){ %>
img src="/images/" +  <%= value.imageName> %> 

  <% }) %>

  -->
',function(err){
  console.log("書き込みました。");

})

 fs.readFile(path.resolve(__dirname,'./public/test.txt'),'utf8',function(err,data)
 {
 console.log(data);
 })
 
 fs.readFile(path.resolve(__dirname,'./test.txt'),'utf8',function(err,data)
 {
 console.log(data);
 })
*/ 
 
 

