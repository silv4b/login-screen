import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/utilities/constants.dart';
import 'package:login_page/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _lembraDeMim = true;

  var _controllerEmail = TextEditingController();
  var _controllerPass = TextEditingController();

  // pissibilidade de uso (causa Exception)
  void clearEmail() {
    setState(() {
      _controllerEmail.clear();
      // or _controllerEmail.text = "";
    });
  }

  // pissibilidade de uso (causa Exception)
  void clearPass() {
    setState(() {
      _controllerPass.text = "";
      // or _controllerPass.clear();
    });
  }

  // limpa ambos os campos
  void clearBoth() {
    setState(() {
      _controllerEmail.clear();
      _controllerPass.clear();
    });
  }

  // verifoca o estado dos campos de texto (email e senha), se estão vazios ou não
  bool validateFields() {
    if (_controllerEmail.text.isNotEmpty && _controllerPass.text.isNotEmpty){
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
              hintText: 'Digite seu Email',
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
  Widget _caixaDeSelecaoLembrarLembrar() {
    return Container(
      alignment: Alignment.centerLeft,
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
            'Lembrar de mim?',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  //botão de login
  Widget _botaoLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        onPressed: () {
          if (validateFields() == true) {
            // responsável por linkar e navegar entre as paginas
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
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
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 2.5,
            fontFamily: 'OpenSans',
            fontSize: 18.0,
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Opensans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // LABEL DE COLOCAR EMAIL
                  SizedBox(height: 20.0),
                  _labelEmail(),
                  // LABEL DE COLOCAR EMAIL
                  SizedBox(height: 25.0),
                  _labelSenha(),
                  // TEXTO DE ESQUECEU SENHA
                  SizedBox(height: 30.0),
                  _textoEsqueceuSenha(),
                  // CAIXINHA DE MARCAR 'LEMBRA DE MIM'
                  _caixaDeSelecaoLembrarLembrar(),
                  _botaoLogin(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
