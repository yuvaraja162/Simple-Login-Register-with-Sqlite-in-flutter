import 'package:cap/Dashboard.dart';
import 'package:cap/DatabaseHandler.dart';
import 'package:cap/db.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'RegisterPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Login page code
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String routename = "/LoginPage";
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final TextEditingController password=TextEditingController();
  final TextEditingController username=TextEditingController();

  @override
  void initState()
  {
    super.initState();
    setState(() {
      username.text="";
      password.text="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
                    child:Image.asset(
                      'images/profile.png',
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),
                  TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'Enter your UserName',
                      labelText: 'UserName',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: password,
                    decoration: const InputDecoration(
                        filled: true,
                        icon: Icon(Icons.key),
                        hintText: 'Enter your Password',
                        labelText: 'Password'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterPage.routeName);
                        },
                        child: Text('Forgot Password?')),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      height: 50.0,
                      width: 150.0,
                      child:  FloatingActionButton.extended(
                        label: Text('Login'),
                        heroTag: 'login',
                        onPressed: loginfunction,
                      )),
                  const SizedBox(height: 20),
                  Container(
                      height: 50.0,
                      width: 150.0,
                      child: FloatingActionButton.extended(
                        heroTag: 'register',
                        label: Text('Register'),
                        onPressed: () {
                          //Navigator.pushNamed(context, RegisterPage.routeName);
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterPage(name: "LoginPage")));
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
void loginfunction() async{
   // print(username.text);
    //print(password.text);
   var  data=await DatabaseHandler.getItem(username.text, password.text);
   if(data.length>0)
     {
       Fluttertoast.showToast(msg: 'Login Successfully..',toastLength:Toast.LENGTH_SHORT);
     Navigator.pushNamed(context, Dashboard.routeName);

     }

   else
  {
    Fluttertoast.showToast(msg: "Login failed.. please check username or password..",toastLength: Toast.LENGTH_LONG);
  }
  username.text="";
  password.text="";


}
}
