import 'package:flutter/material.dart';
//import 'package:login_page/screens/login_screen.dart';
//import 'package:flutter/services.dart';
//import 'package:login_page/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            child: Center(
              child: RaisedButton(
                elevation: 5.0,
                color: Colors.white,
                child: Text(
                  "APERTE",
                  style: TextStyle(
                    color: Color(0xFF527DAA),
                    letterSpacing: 1.5,
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  print("Botão da segunda tela!");
                  Navigator.pop(context);
                  // - Obs.: Nesse caso se encaixa o pop por ser uma especie de fila, caso fosse aplicado um Push, em dado momento, iria haver uma sobrecarga na memória, pois as outras instâncias não seriam destruídas, como ocorre com o Navigator.pop(). -
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  */
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
