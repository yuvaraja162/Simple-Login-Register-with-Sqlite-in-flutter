import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'db.dart';
import 'main.dart';
import 'DatabaseHandler.dart';
import 'package:fluttertoast/fluttertoast.dart';

//This is for Register Page
class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key, required this.name}) : super(key: key);
  final String name;
  static String routeName = "/RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String Username = "";
  String Email = "";
  String PhoneNo = "";
  String Password = "";
  var user_id;
  bool widvisible=true;


  // String? username, password;
  // TextEditingController username,email, phoneno, password;

  @override
  void initState()
  {
    super.initState();
    showhide();
  }
  void showhide()
  {
    print(widget.name);
    if(widget.name=="Dashboard")
      {
          setState(() {
            widvisible=false;
          });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 30.0, top: 100.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        'images/profile.png',
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        icon: Icon(Icons.person),
                        hintText: ' Enter your UserName',
                        labelText: 'UserName',
                      ),
                      onChanged: (value) {
                        setState(() {
                          Username = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Email Address',
                        labelText: 'Email',
                      ),
                      onChanged: (value) {
                        setState(() {
                          Email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(

                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: 'Enter Your Phone Number',
                        labelText: 'Phone No',
                      ),
                      onChanged: (value) {
                        setState(() {
                          PhoneNo = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                      decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.key),
                          hintText: 'Enter your Password',
                          labelText: 'Password'),
                      onChanged: (value) {
                        setState(() {
                          Password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 35),
                    Container(
                        height: 50.0,
                        width: 150.0,
                        child: FloatingActionButton.extended(
                          label: Text('Register'),
                          heroTag: 'Register',
                          onPressed: () {
                            register();
                          },
                        )),
                    const SizedBox(height: 20),
                    Visibility(
                      visible:widvisible,
                      child:Container(
                        height: 50.0,
                        width: 180.0,
                        child: FloatingActionButton.extended(
                          label: Text('Back to Login'),

                          heroTag: 'backtologin',
                          onPressed: () {
                            //Navigator.pushNamed(context, LoginPage.routename);
                            Navigator.pop(context); // for back redirection....
                          },
                        )),),

                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Future<void> RegisterData() async {
  //   user_id = await SQLHelper.createItem(Username, Password, Email, PhoneNo);
  //   if (user_id > 0) {
  //     print(user_id);
  //
  //
  //     Navigator.pop(context, LoginPage.routename);
  //   }
  // }
  Future<void> register() async {
    user_id = await DatabaseHandler.createUser(Username, Password, Email, PhoneNo);
    if (user_id > 0) {
      print(user_id);
      Fluttertoast.showToast(msg: 'Register Successflly',
          toastLength: Toast.LENGTH_SHORT);
      Navigator.pop(context, LoginPage.routename);

    }
  }
}
