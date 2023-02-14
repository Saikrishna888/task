import 'package:flutter/material.dart';
import 'package:task_demo_app/home_screen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _password = TextEditingController();
  TextEditingController _userName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //checkLoggedInOrNot();
    super.initState();
  }

  // checkLoggedInOrNot() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.get("userName") != null) {
  //     Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (BuildContext context) => Home(selectedIndex: 0,)),
  //                     (Route<dynamic> route) => false);
  //   }
  // }
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("images/AppBG.png"), fit: BoxFit.cover),
          //     color: Colors.white),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.all(20),
                //   width: 200,
                //   child: Image.asset(
                //     'images/EVRidesLogo.png',
                //     width: MediaQuery.of(context).size.width / 2,
                //   ),
                // ),
                // Container(
                //   width: 200,
                //   child: Image.asset(
                //     'images/Hello.png',
                //     width: MediaQuery.of(context).size.width / 2,
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: TextFormField(
                    controller: _userName,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.length < 10) {
                        return "Username must be 10 Characters";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.indigo, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.indigo,
                      ),
                      // suffixIcon: IconButton(
                      //   onPressed:(){},
                      //   icon: Icon(Icons.arrow_circle_right_sharp,
                      //   size: 29,
                      //   color: secondaryColor,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: TextFormField(
                    controller: _password,
                    obscureText: isvisible,
                    validator: (value) {
                      print(value);
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else {
                        bool result = validatePassword(value);
                        if (result) {
                          if (value.length < 7) {
                            return "password must be 7 Characters";
                          }
                        } else {
                          return "Password should contain atleat one Uppercase, Number & Special Charecter";
                        }
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.indigo, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.security,
                        color: Colors.indigo,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isvisible ? isvisible = false : isvisible = true;
                          });
                        },
                        icon: Icon(
                          isvisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  colors: [Colors.indigo, Colors.blue])),
                          child: MaterialButton(
                            onPressed: () async {
                              _formKey.currentState!.validate();
                              //   var email = emailController.text.toString();
                              //   var password = passwordController.text.toString();
                              //   var body = {
                              //     "dealerLogin":{"email": email, "password": password}
                              // };
                              //   logIn(body);

                              if (_userName.text.toString() == "Fininfocom") {
                                if (_password.text.toString() == "Fin@123") {
                                  // final SharedPreferences prefs =
                                  //     await SharedPreferences.getInstance();
                                  // prefs.setString(
                                  //     "userName", _userName.text.toString());
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: const Text('Incorrect Password'),
                                    // action: SnackBarAction(
                                    //   label: 'Undo',
                                    //   onPressed: () {
                                    //     // Some code to undo the change.
                                    //   },
                                    // ),
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: const Text('Username Incorrect'),
                                  
                                  // action: SnackBarAction(
                                  //   label: 'Undo',
                                  //   onPressed: () {
                                  //     // Some code to undo the change.
                                  //   },
                                  // ),
                                ));
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              // Navigator.pushNamed(context, '/');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            elevation: 5.0,
                            child: Text(" Login "),
                            textColor: Colors.white,
                            hoverColor: Colors.indigoAccent,
                            focusColor: Colors.indigoAccent,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
