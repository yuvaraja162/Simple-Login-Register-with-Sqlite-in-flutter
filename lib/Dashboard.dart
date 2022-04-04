import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DatabaseHandler.dart';
import 'LoginPage.dart';
import 'main.dart';
import 'RegisterPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static String routeName = "/Dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();

  //void roload() {}
}

class _DashboardState extends State<Dashboard>{
  late AnimationController _controller;
  var isloading=true;

  var data=[];
  void _reload() async{
    final a=await DatabaseHandler.getItems();
    setState(() {
      data=a;
    });
//print (data);
    isloading=false;
  }

  @override
  void initState() {
    super.initState();
    _reload();
    //  print('hi');

  }


  @override
  Widget build(BuildContext context) {
_reload();
    //final List<String> data = <String>['A1', 'B', 'C'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body:
        ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: data.length,

            itemBuilder: (BuildContext context, int index) {



              return Card(
                color: Colors.black12,

                  child:Container(
                height: 80,

                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('User ID: ${data[index]['id']}',style: TextStyle(color: Colors.white,fontSize: 20.0,fontStyle:FontStyle.italic)),
                    SizedBox(height: 5.0),
                    Text('Email ID: ${data[index]['email']}',style: TextStyle(fontSize: 15.0,fontStyle:FontStyle.italic)),
                    SizedBox(height: 5.0),
                    Text('Phone No: ${data[index]['phoneno']}',style: TextStyle(fontSize: 15.0,fontStyle:FontStyle.italic)),
               ] ),






              ));
            }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: ()
        {
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>RegisterPage(name:"Dashboard")));
         // Navigator.pushNamed(context, RegisterPage.routeName);
        },
        backgroundColor: Colors.black,
      ),


        );

  }

}
