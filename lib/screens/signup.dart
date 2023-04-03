import 'package:flutter/material.dart';
import 'package:basic_connections/mongodb.dart';

import 'login.dart';


var id=TextEditingController();
var name=TextEditingController();
var phone=TextEditingController();
var pass=TextEditingController();
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF7F29B) ),
            ), 
            Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                       child: FittedBox(
                         child: Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.15,
                              fontFamily: 'Schyler'
                            ),
                          
                          ),
                       )
                      ),
                    ],
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height/15 ,),
                  Container(
                   child: FittedBox(
                     child: Text(
                        "SignIn",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.1,
                          fontFamily: 'Schyler'
                        ),
                      
                      ),
                   )
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height/18 ,),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        
                        labelText: "Name",
                        border:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10))) ),
                    SizedBox(height:15 ,),
                    TextFormField(
                      controller: id,
                      decoration: InputDecoration(
                        labelText: "userId",
                        border:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10))) ),
                    SizedBox(height:15 ,),
                    TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: "Mobile",
                        border:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10))) ),
                    SizedBox(height:15 ,),
                    TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: "password",
                        border:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10))) ),
                    SizedBox(height:15 ,),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/18,
                          width: MediaQuery.of(context).size.width/3,
                          child: ElevatedButton(
                            onPressed: (){
                              mongodb.insert(name.text, id.text, phone.text, pass.text);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            Login()), (Route<dynamic> route) => false);

                            }, 
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shadowColor: Colors.transparent
                            ),
                            child: Text("Go -->")),
                        ),
                      ],
                    )
                    
                ],),
            ),
          ),
        ])
      ));
  }
}