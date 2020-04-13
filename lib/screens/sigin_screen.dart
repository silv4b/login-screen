import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/utilities/constants.dart';
//import 'package:login_page/screens/home_screen.dart';
//import 'package:login_page/screens/sigin_screen.dart';

class SigInScreen extends StatefulWidget {
  @override
  _SigInScreenState createState() => _SigInScreenState();
}

class _SigInScreenState extends State<SigInScreen> {
  bool _lembraDeMim = true;

  var _controllerEmail = TextEditingController();
  var _controllerPass = TextEditingController();
  var _controllerNome = TextEditingController();
  var _controllerSobrenome = TextEditingController();

  // pissibilidade de uso (causa Exception)
  void clearEmail() {
    setState(() {
      _controllerEmail.clear();
    });
  }

  void clearPass() {
    setState(() {
      _controllerPass.clear();
    });
  }

  // limpa todos os campos
  void clearBoth() {
    setState(() {
      _controllerNome.clear();
      _controllerSobrenome.clear();
      _controllerEmail.clear();
      _controllerPass.clear();
    });
  }

  // verifoca o estado dos campos de texto (email e senha), se estão vazios ou não
  bool validateFields() {
    if (_controllerEmail.text.isNotEmpty && _controllerPass.text.isNotEmpty) {
      clearBoth();
      return true;
    }
    return false;
  }

  // exibe alerta caso a condição de validateField() seja verdadeira (true)
  void _exibirDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text(
            "Alerta",
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 0.5,
              fontFamily: 'OpenSans',
              fontSize: 20.0,
            ),
          ),
          content: Text(
            "Campos de senha ou email estão vazios!",
            style: TextStyle(
              color: Color(0xFF478DE0),
              fontFamily: 'OpenSans',
              fontSize: 18.0,
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: Text(
                "OK ",
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 0.5,
                  fontFamily: 'OpenSans',
                  fontSize: 15.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _labelNome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 35.0,
          child: TextField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Digite seu nome',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      _controllerEmail
                          .clear()); // correção do Exception caused by gesture!
                },
                icon: Icon(Icons.clear, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _labelSobrenome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Sobrenome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 35.0,
          child: TextField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Digite seu sobrenome',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      _controllerEmail
                          .clear()); // correção do Exception caused by gesture!
                },
                icon: Icon(Icons.clear, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Digite seu e-mail',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      _controllerEmail
                          .clear()); // correção do Exception caused by gesture!
                },
                icon: Icon(Icons.clear, color: Colors.white),
              ),
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
            controller: _controllerPass,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 2.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Digite sua senha',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => _controllerPass.clear());
                },
                icon: Icon(Icons.clear, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _botaoCadastrar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        onPressed: () {
          if (validateFields() == true) {
          } else {
            // exive um popup de alerta para caso o Navigator não execute
            _exibirDialogo();
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CADASTAR',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 2.5,
            fontFamily: 'OpenSans',
            fontSize: 17.0,
          ),
        ),
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
                    'Sign In Screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Opensans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // LABEL DE COLOCAR EMAIL
                  SizedBox(height: 20.0),
                  _labelNome(),
                  SizedBox(height: 20.0),
                  _labelSobrenome(),
                  SizedBox(height: 20.0),
                  _labelEmail(),
                  SizedBox(height: 20.0),
                  _labelSenha(),
                  SizedBox(height: 30.0),
                  _botaoCadastrar(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
