import 'package:bci/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

class LoginPage extends StatelessWidget {

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("BCI"),
          backgroundColor: Colors.deepPurple[800]),
      body:Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/img/logo.png')),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (text){
                      username = text;
                  },
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple[900]),
                  decoration: InputDecoration(
                    labelText: "Usuário",
                    hintText: "Digite seu usuário",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (text){
                      password = text;
                  },
                  obscureText: true,
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple[900]),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    hintText: "Digite sua senha",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                
                  ElevatedButton(
                    onPressed: () {
                      if(username == 'lee' && password == '123'){
                        Navigator.of(context).pushReplacementNamed('/home');
                      }else if(username == '' && password == ''){
                          showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Erro"),
                            content: Text("Por favor, preencha usuário e senha"),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK')
                              )
                            ],
                          ),
                        );
                      }else if(password == ''){
                          showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Erro"),
                            content: Text("Por favor, preencha a senha"),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK')
                              )
                            ],
                          ),
                        );
                      }else if(username == ''){
                          showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Erro"),
                            content: Text("Por favor, preencha o campo usuário"),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK')
                              )
                            ],
                          ),
                        );
                      }else{
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Credenciais incorretas."),
                            content: Text("Por favor, verifique e tente novamente!"),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK')
                              )
                            ],
                          ),
                        );
                      }
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[900],
                        fixedSize: const Size(240, 46),
                        textStyle: const TextStyle(fontSize: 22)),
                    child: Text('Login'),
                  ),
                SizedBox(
                  height: 120,
                ),
                Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/img/mesquita_360.png')),
              ],
            )));
  }

 
  }

