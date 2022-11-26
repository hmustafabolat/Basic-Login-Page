import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Row-Column-Stack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    //MediaQuery kullanarak tüm cihazlar için ekran bilgisini alıp ona göre ayarlama yapmasını sağladık.
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
        title: Text(widget.title),
      ),
      body: Center(
        //Ekran daralması durumunda kaydırma işlemi yapmak için kullanılır.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                //Burada MediaQuery kullanarak padding verdik ve ölçüsünü ekran yüksekliğinin 20'de 1'i olacak şekilde belirttik.
                padding: EdgeInsets.only(bottom: screenHeight / 50),
                child: SizedBox(
                    //Burada SizedBox kullanarak resim boyutunu ekran oranının yarısı olacak şekilde ayarladık.
                    width: screenWidth / 2,
                    height: screenHeight / 4,
                    child: Image.asset("images/enter-2.png")),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight / 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight / 40),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Şifre Giriniz",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight / 30),
                child: SizedBox(
                  width: screenWidth / 2,
                  height: screenHeight / 20,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Giriş Yapıldı");
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print("Yardım'a tıklandı");
                  },
                  child: Text(
                    "Yardım?",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight / 50),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
