import 'package:flutter/material.dart';
import 'package:login_page/screens/login_screen.dart';

//void main() => runApp(MyApp());

// forma de iniciar o aplicativo como forma de rotas
void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: 'Navegação Básica',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      //home: LoginScreen(),
      home: LoginScreen(),
    );
  }
}
