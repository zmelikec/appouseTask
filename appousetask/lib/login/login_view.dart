import 'package:flutter/material.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel {
  final EdgeInsets paddingLow = EdgeInsets.all(0.8);
  final BorderRadius borderRadius = BorderRadius.circular(10);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(242, 227, 223, 1),
        body: SingleChildScrollView(
          child: Center(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    children: [
                      //logo
                      Image(image: AssetImage("assets/logo.png")),
                      //hoşgeldiniz
                      Text("Hoş geldiniz...",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      //bilgilendirme
                      Text(
                          "Uygulamamıza giriş yapmak için bilgilerinizi doldurunuz.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                      SizedBox(height: 10),

                      //e-mail textfield

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              border: Border.all(color: Colors.black12),
                              borderRadius: borderRadius),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                                controller: controllerEmail,
                                decoration: InputDecoration(
                                    border: InputBorder.none, // öğren
                                    hintText: 'E-mail')),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //password tectfield + görünürlük
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              border: Border.all(color: Colors.black12),
                              borderRadius: borderRadius),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                                controller: controllerPassword,
                                decoration: InputDecoration(
                                  border: InputBorder.none, // öğren
                                  hintText: 'Şifre',
                                  suffixIcon: Icon(Icons.visibility),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      //signup button,

                      TextButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            fetchUserLogin(
                                controllerEmail.text, controllerPassword.text);
                          }
                          ;
                        },
                        child: Container(
                          height: 50,
                          width: 350,
                          padding: paddingLow,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(29, 32, 36, 1),
                              borderRadius: borderRadius),
                          child: Center(
                              child: Text(
                            "Giriş Yap",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ),

                      //i yazı
                      SizedBox(height: 10),
                      //bilgilendirme
                      Text("Sorun yaşıyor iseniz IT birimi ile görüşünüz.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ],
                  ))),
        ));
  }
}
