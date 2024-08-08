
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const app = express();
app.use(express.urlencoded({extended: false}));
const fileupload = require("express-fileupload");
const bcrypt = require('bcrypt');
const session = require('express-session');


// const syokigazou = "neko.jpeg"; // 登録時の最初の画像です。
app.use(express.json());
app.use(bodyParser.json());

app.use(
  session({
    secret: 'my_secret_key',
    resave: false,
    saveUninitialized: false,
  })
)

app.use((req,res,next) =>{
  
  if (req.session.userId === undefined) {
 
    res.locals.username = 'ゲスト';
    res.locals.gazou ='sample1.jpeg';
    res.locals.isLoggedIn = false;

  } else {
 
    res.locals.username = req.session.username;
    res.locals.gazou = req.session.gazou;
    res.locals.isLoggedIn = true;

  }
  
  next();
});



app.use(express.static('public'));

app.use(fileupload());









const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  port: "8889",
  database: 'image-progate',
  multipleStatements: true  
});

app.get('/', (req, res) => {
  res.render('top.ejs');
});

app.get('/index2', (req, res) => {



  // データベースからデータを取得する処理を書いてください
    connection.query(
    'SELECT * FROM image',
    (error, results) => {
    //   console.log(results);
      res.render('index2.ejs',{items:results});
    }
  );
  
  // 下記のコードを削除してください
  // 削除ここまで
});




app.get('/new',(req,res) => {
  
  res.render('new.ejs');
});

app.post('/create',(req,res) =>{
  
  let imageFile = req.files.imageFile;
  let uploadPath = __dirname + "/public/images/" + imageFile.name;
imageFile.mv (uploadPath)
 

  connection.query(
    'INSERT INTO image(imageName) VALUES(?)',
    [imageFile.name],
    (error,results)=>{
      res.redirect("/index2");
/*
  connection.query(
    'SELECT * FROM image',
    (error, results) => {
      res.render('index2.ejs', {items: results});
    }
  );
    */

}
);
});

app.post('/delete/:id', (req,res) =>{

//  console.log(req.params.id);
connection.query(
  'DELETE FROM image WHERE id=?',
  [req.params.id],
(error,results) =>{
  res.redirect('/index2');
}
)  
});

app.post('/sentaku/:imageName', (req,res) =>{
  
  //  console.log(req.params.id);
  connection.query(
    'UPDATE  user SET  gazou=? WHERE username=?',
   [req.params.imageName,res.locals.username],
  (error,results) =>{
    req.session.gazou = req.params.imageName;  
    res.redirect('/index2');

  }
  )
  });


app.get('/edit/:id', (req, res) => {
   console.log(req.params.id);
  // 選択されたメモをデータベースから取得する処理を書いてください
  connection.query(
    'SELECT * FROM image WHERE id=?',
    [req.params.id],
    (error, results) => {
      res.render('edit.ejs', {item: results[0]});
    }
  );
  
});





app.post('/update/:id', (req,res) =>{
   imageFile = req.files.imageName;
   uploadPath = __dirname + "/public/images/" + imageFile.name;
imageFile.mv (uploadPath)

  connection.query(
    'UPDATE image SET imageName=? WHERE id=?',
    [imageFile.name,req.params.id],
    (error,results) =>{
     res.redirect('/index2');
   }
    )
  
});

app.get('/signup',(req,res) =>{
  res.render('signup.ejs',{errors:[]});
  });


app.post('/signup',(req,res,next) =>{
  console.log("入力値の空チェック");
const username = req.body.username;
const userID = req.body.userID;
const pass = req.body.pass;

const errors = [];
if(username === ''){
  errors.push('ユーザー名が空です');
  }
  if(userID === ''){
    errors.push('登録するIDが空です');
    }
    if(pass === ''){
      errors.push('パスワードが空です');
      }
      if(errors.length > 0){
        res.render('signup.ejs',{errors: errors});
      } else{
        next();
      }
  
    },

    (req, res, next) => {
      // console.logを用いて「メールアドレスの重複チェック」と出力してください
      console.log("メールアドレスの重複チェック");
      
const  userID = req.body.userID;

const errors = [];

connection.query(
  'SELECT * FROM user WHERE userID = ?',
  [userID],
  (error,results) =>{
    if(results.length > 0){
      errors.push("同じIDの方がいらっしゃったので、別のIDにしてください");
      res.render('signup.ejs',{errors: errors});
    } 
    
    

    else {
      next();
    }
  },

  
  
);
      
    },

    (req, res, next) => {
      // console.logを用いて「メールアドレスの重複チェック」と出力してください
      console.log("名前の重複チェック");
      
const username = req.body.username;

const errors = [];

connection.query(
  'SELECT * FROM user WHERE username = ?',
  [username],
  (error,results) =>{
    if(results.length > 0){
      errors.push("同じ名前の方がいるので、別の名前にしてください。");
      res.render('signup.ejs',{errors: errors});
    } 
    
    

    else {
      next();
    }
  },

  
  
);
      
    },



    


    (req,res,next) => {

      console.log('ユーザー登録');

      const username = req.body.username;
const userID = req.body.userID;
const pass = req.body.pass;

bcrypt.hash(pass,10,(error,hash) =>{


  connection.query(
    'INSERT INTO user (username, userID, pass) VALUES (?, ?, ?)',
    [username, userID, hash],
    (error, results) => {
      console.log(userID);
      console.log(username);
   //   登録後、すぐにログインできるようにする記述
      req.session.userId = userID;
      req.session.username = username;
  //    req.session.gazou = syokigazou;
  //    res.redirect('/game');
      next();
  
    },
     
  );
});
},





(req,res) => {
const username = req.body.username;
  connection.query(
    'SELECT *  FROM user   WHERE username= ? ',
    [username],
    (error2, results2) => {
      const gazou2 = results2[0].gazou;
  console.log(username);
  console.log(gazou2);
        req.session.gazou = gazou2;
        res.redirect('/game');
   //   登録後、すぐにログインできるようにする記述
   
    }
  );
  
     }
);


app.get('/login', (req, res) => {
  res.render('login.ejs');
});




app.post('/login', (req, res) => {
  const userID = req.body.userID;
  connection.query(
    'SELECT * FROM user WHERE userID = ?',
    [userID],

    (error, results) => {
      if (results.length > 0) {
      // 定数plainを定義してください
      const plain = req.body.pass;
      // 定数hashを定義してください
      const hash = results[0].pass;
      
        
        // パスワードを比較するためのcompareメソッドを追加してください
        bcrypt.compare(plain, hash, (error, isEqual) => {            
          if (isEqual) {            
            
          req.session.userId = results[0].id;           
          
          req.session.username = results[0].username;  
          req.session.gazou = results[0].gazou;          
          
          res.redirect('/game');            
                   } else {            
         res.redirect('/login');            
           }            
           });
        


        
        // ここから削除
        // ここまで削除
        
      } else {
        res.redirect('/login');
      }
    }
  );
});

app.get('/logout',(req,res) =>{
  req.session.destroy((error) =>{
    
    res.redirect('/');
  });
   
 });

 app.get('/game', (req, res) => {



  // データベースからデータを取得する処理を書いてください
  
    connection.query(
    'SELECT *  FROM user  WHERE username=?',
    [res.locals.username],
    (error, results) => {
       console.log(results);
      res.render('game.ejs',{sute: results});
    }
   );
  
  // 下記のコードを削除してください
  // 削除ここまで
});

app.get('/hazimete', (req, res) => {
  // データベースからデータを取得する処理を書いてください
    connection.query(
    'SELECT *  FROM user  WHERE username=?',
    [res.locals.username],
    (error, results) => {
       console.log(results);
      res.render('hazimete.ejs',{sute: results});
    }
   );
});




 app.post('/kougekiryokuUP/', (req,res) =>{
  
  connection.query(
    'UPDATE  user SET kougekiryoku= kougekiryoku + 1, syozikin = syozikin - 1000  WHERE username=?',
    [res.locals.username],
  (error,results) =>{

    res.redirect('/game');
  }
  )  
  });

  app.post('/bougyoryokuUP/', (req,res) =>{
  connection.query(
    'UPDATE  user SET bougyoryoku = bougyoryoku + 1, syozikin = syozikin - 1000  WHERE username=?',
    [res.locals.username],
  (error,results) =>{

    res.redirect('/game');
  }
  )  
  });

  app.post('/mahoukougekiUP/', (req,res) =>{
    connection.query(
      'UPDATE  user SET mahoukougeki= mahoukougeki + 1, syozikin = syozikin - 1000  WHERE username=?',
      [res.locals.username],
   
    (error,results) =>{
  
      res.redirect('/game');
    }
    )  
    });

    app.post('/mahoubougyoUP/', (req,res) =>{
      connection.query(
        'UPDATE  user SET mahoubougyo= mahoubougyo + 1, syozikin = syozikin - 1000  WHERE username=?',
        [res.locals.username],
     
      (error,results) =>{
    
        res.redirect('/game');
      }
      )  
      });

      app.post('/syozikinUP/', (req,res) =>{
        connection.query(
          'UPDATE  user SET syozikin = syozikin + 10000  WHERE username=?',
          [res.locals.username],
       
        (error,results) =>{
      
          res.redirect('/game');
        }
        )  
        });

        app.get('/yatou', async (req, res) => {
          try {
              // heiテーブルのデータを取得
              const heiResults = await new Promise((resolve, reject) => {
                  connection.query('SELECT * FROM hei', (error, results) => {
                      if (error) return reject(error);
                      resolve(results);
                  });
              });
      
              // userテーブルのデータを取得
              const userResults = await new Promise((resolve, reject) => {
                  connection.query('SELECT * FROM user', (error, results) => {
                      if (error) return reject(error);
                      resolve(results);
                  });
              });
      
              // 両方のデータをテンプレートに渡す
              res.render('yatou.ejs', { yatou: heiResults, sute: userResults });
          } catch (error) {
              console.error(error);
              res.status(500).send('Internal Server Error');
          }
      });
      

        app.post('/yatou2/:id', (req, res) => {
const getUserData = new Promise((resolve, reject) => {
          connection.query(
         'SELECT kaikyuu , syozikin , heisyu , heisuu FROM user WHERE username = ?',
         [res.locals.username],
          (error,results) =>{
            console.log(results[0]);
           resolve(results[0]);
            return;
          }
          );
        });

const getHeiData = new Promise((resolve, reject) => {        
connection.query(
  'SELECT kaikyuu , hiyou , namae FROM hei WHERE id = ?',
  [req.params.id],
    (error2,results2) =>{
 console.log(results2[0]);
   resolve(results2[0]);
 return;
    }
);
    });

    Promise.all([getUserData, getHeiData])
    .then(([userData, heiData]) => {
      const  ninzuu = Number(req.body.ninzuu); 
      const userKaikyuu = Number(userData.kaikyuu);
      const userSyozikin = Number(userData.syozikin);
      const userHeisyu = userData.heisyu;
      const userHeisuu =  Number(userData.heisuu);
      const heiKaikyuu = Number(heiData.kaikyuu);
      const heiHiyou = Number(heiData.hiyou);
      const heiNamae = heiData.namae;
      let hituyounaOkane = 0;
const  aaa = ninzuu ;
      let abc = 0;
if(userHeisyu == heiNamae)
{
  hituyounaOkane =  aaa  * heiHiyou;
abc =  aaa + userHeisuu;
console.log(hituyounaOkane);
console.log(abc);
}
 if(userHeisyu != heiNamae){
   hituyounaOkane = ninzuu * heiHiyou;
   abc = ninzuu;
 }
if(aaa <= 0)
{
  aaa = 0 ;
}


      if (userKaikyuu >= heiKaikyuu && userSyozikin >= hituyounaOkane ) {
        console.log("雇えます");
console.log(aaa + "人数");
  

       connection.query(
  'UPDATE   user A , hei B SET A.syozikin = A.syozikin - ?  , A.heisuu = ? , A.heisyu= B.namae WHERE A.username=? AND  B.id=?',
   [hituyounaOkane,abc,res.locals.username,req.params.id],
  (error,results) =>{
    
    res.redirect('/game');
  }
       )   



      } 
      else if(userKaikyuu < heiKaikyuu ) {
        console.log("雇えない");
        res.send("階級が足りません");
      }
      else if (userSyozikin < hituyounaOkane){
        console.log("雇えない");
        res.send("所持金が足りません");
      }
    })

       

        });

       
        app.get('/buki', (req, res) => {
        
    
          
           connection.query(
            'SELECT *  FROM buki ',
            (error, results) => {
               console.log(results);
              res.render('buki.ejs',{buki: results});
            }
           );

          // 下記のコードを削除してください
          // 削除ここまで
        });
        

        app.post('/buki2/:id', (req, res) => { 
       connection.query(
  'UPDATE   user A , buki B SET A.syozikin = A.syozikin - B.nedan , A.bukinonamae= B.namae, A.buki= B.kougeki WHERE A.username=? AND  B.id=?',
   [res.locals.username,req.params.id],
  (error,results) =>{
    
    res.redirect('/game');
  }
       )   

        });

        app.get('/bougu', (req, res) => {
          
          connection.query(
           'SELECT *  FROM bougu ',
           (error, results) => {
              console.log(results);
             res.render('bougu.ejs',{bougu: results});
           }
          );

         // 下記のコードを削除してください
         // 削除ここまで
       });

       app.post('/bougu2/:id', (req, res) => { 
        connection.query(
   'UPDATE   user A , bougu B SET A.syozikin = A.syozikin - B.nedan , A.bougunonamae= B.namae, A.bougu= B.bougyo WHERE A.username=? AND  B.id=?',
    [res.locals.username,req.params.id],
   (error,results) =>{
     
     res.redirect('/game');
   }
        )   
 
         });

         app.get('/syomotu', (req, res) => {
          
          connection.query(
           'SELECT *  FROM syomotu ',
           (error, results) => {
              console.log(results);
             res.render('syomotu.ejs',{syomotu: results});
           }
          );

         // 下記のコードを削除してください
         // 削除ここまで
       });

       app.post('/syomotu2/:id', (req, res) => { 
        connection.query(
   'UPDATE   user A , syomotu B SET A.syozikin = A.syozikin - B.nedan , A.syomotunonamae= B.namae, A.syomotu= B.iryoku WHERE A.username=? AND  B.id=?',
    [res.locals.username,req.params.id],
   (error,results) =>{
     
     res.redirect('/game');
   }
        )   
 
         });
       
         app.get('/hata', (req, res) => {
          
          connection.query(
           'SELECT *  FROM hata ',
           (error, results) => {
              console.log(results);
             res.render('hata.ejs',{hata: results});
           }
          );

         // 下記のコードを削除してください
         // 削除ここまで
       });


       app.post('/hata2/:id', (req, res) => { 
        connection.query(
   'UPDATE   user A , hata B SET A.syozikin = A.syozikin - B.nedan , A.hatanonamae= B.namae, A.hata= B.iryoku WHERE A.username=? AND  B.id=?',
    [res.locals.username,req.params.id],
   (error,results) =>{
     
     res.redirect('/game');
   }
        )   
 
         })


         app.get('/teki', (req, res) => {
          connection.query(
           'SELECT *  FROM teki ',
           (error, results) => {
             res.render('teki.ejs',{teki: results});
           }
          );
       });


       app.post('/teki2/:id', (req, res,next) => { 
        connection.query(
          
  //  'UPDATE   user A , hata B SET A.syozikin = A.syozikin - B.nedan , A.hatanonamae= B.namae, A.hata= B.iryoku WHERE A.username=? AND  B.id=?',
  //   [res.locals.username,req.params.id],
  // 'SELECT * FROM teki WHERE id= ?, INNER JOIN user WHERE username=?',
//  [req.params.id,res.locals.username],
 'SELECT * FROM teki A , user B , hei C  WHERE A.id= ? AND B.username=? AND C.namae= B.heisyu',
 [req.params.id,res.locals.username],
   (error,results) =>{
    
    res.render('batoru.ejs',{batoru: results});
     next();
   },
        );
       

         },

         (req,res) =>{

          connection.query(
            'UPDATE  user SET user.sentou = 1 WHERE username= ? ',
            [res.locals.username],
              (error,results) =>{
                
               console.log(results);     
     //          res.render('batoru.ejs',{mikata: results});
              }

          )
          
        }  
        
       )
  /*
       app.post('/batorukekka/:heisuu', (req, res) => {
        console.log(req.params.heisuu);
        console.log(res.locals.username);
        connection.query(
          'UPDATE  user SET  heisuu=? , user.sentou = 0  WHERE username=?',
[req.params.heisuu,res.locals.username],
(error,results) =>{
  res.redirect('/game');
 }

)

       })
       */

       app.post('/updateData', (req, res) => {
    console.log(req.body.heisuu3);
    console.log("来てるきてる？");
     connection.query(
      'UPDATE  user SET  heisuu=?, kaikyuu = kaikyuu + ?  WHERE username=?',
      [req.body.heisuu3,req.body.keikenti,res.locals.username],
      (error,results) =>{
        res.redirect('/game');
       }

     )

    });



app.listen(7500);
