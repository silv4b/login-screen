//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _lembraDeMim = false;

  //função que cria o widget de email
  Widget _labelEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 35.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  //função que cria o widget de senha
  Widget _labelSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 35.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  //função de text 'esqueceu a senha'
  Widget _textoEsqueceuSenha() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Botão de esqueceu a senha!'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu a senha?',
          //style: TextStyle(color: Colors.white),
          style: kLabelStyle,
        ),
      ),
    );
  }

  //Caixa de selecao p 'lembrar de mim?'
  Widget _caixaDeSelecao() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              checkColor: Colors.white,
              value: _lembraDeMim,
              onChanged: (value) {
                setState(() {
                  _lembraDeMim = value;
                  print("Estado da caixinha de seleção: ");
                  print(_lembraDeMim);
                });
              },
            ),
          ),
          Text(
            'Lembra de mim?',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Opensans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //! LABEL DE COLOCAR EMAIL
                  SizedBox(height: 20.0),
                  _labelEmail(),
                  //! LABEL DE COLOCAR EMAIL
                  SizedBox(height: 25.0),
                  _labelSenha(),
                  //! TEXTO DE ESQUECEU SENHA
                  SizedBox(height: 30.0),
                  _textoEsqueceuSenha(),
                  //! CAIXINHA DE MARCAR 'LEMBRA DE MIM'
                  _caixaDeSelecao(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
