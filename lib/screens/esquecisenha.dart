import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/custombutton.dart';
import 'package:provider/provider.dart';

import '../store/user_store.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({super.key});

  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  void _submitForm(BuildContext context) {
    if (!_form.currentState!.validate()) {
      return;
    }
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    String email = _emailController.text;

    UserService userService = UserService();

    userService.isEmailRegistered(email).then((isRegistered) {
      if (isRegistered) {
        userService.resetPassword(email).then((_) {
          // A redefinição de senha foi enviada com sucesso
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Redefinição de Senha Enviada'),
                content: Text(
                    'Foi enviado um e-mail para $email com instruções para redefinir a senha.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Email não registrado'),
              content: Text('O email $email não está registrado no sistema.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
    // if (_emailController.text == userStore.email) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: const Text('Recuperação de senha'),
    //           content: const Text(
    //               'Foi enviado um e-mail para o endereço informado.'),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //                 Navigator.pushReplacementNamed(context, '/');
    //                 //implementar enviar email
    //               },
    //               child: const Text('Ok'),
    //             ),
    //           ],
    //         );
    //       });
    // } else {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: const Text('Recuperação de senha'),
    //           content: const Text('O e-mail não está cadastrado.'),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //                 Navigator.pushReplacementNamed(context, '/');
    //               },
    //               child: const Text('Ok'),
    //             ),
    //           ],
    //         );
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redIdColor,
      body: Form(
          key: _form,
          child: Consumer<UserStore>(builder: (context, userStore, _) {
            return ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80,
                                  left: 40.0,
                                  right: 40.0,
                                  bottom: 80.0),
                              child: Image.asset(
                                'assets/images/vemjunto.png',
                                width: 280,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    'Esqueceu sua senha?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 40.0, right: 40.0),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 24.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextFormField(
                                          controller: _emailController,
                                          validator: _validateEmail,
                                          onChanged: (text) {
                                            setState(() {});
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'E-mail',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 40.0),
                                  child: CustomButton(
                                    text: 'Recuperar',
                                    onPressed: () {
                                      _submitForm(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
