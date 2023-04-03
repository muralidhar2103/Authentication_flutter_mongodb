import 'package:basic_connections/mongodb.dart';
import 'package:flutter/material.dart';

void showOverlay(BuildContext context,String text) async {
   OverlayState? overlayState = Overlay.of(context);
   OverlayEntry overlayEntry;
   overlayEntry = OverlayEntry(builder: (context) {
     return Positioned(
        left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.05,
       child: ClipRRect(
         borderRadius: BorderRadius.circular(15),
         child: Material(
          
             child: Container(
               alignment: Alignment.center,
               color: Color.fromRGBO(72, 72, 72, 0.9),
               padding:
                   EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
               width: MediaQuery.of(context).size.width * 0.8,
               height: MediaQuery.of(context).size.height * 0.06,
               child: Text(
                 text,
                 style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
               ),
             ),
           
         ),
       ),
     );
   });
      // Inserting the OverlayEntry into the Overlay
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 3));

    overlayEntry.remove();
   
 }
var id=TextEditingController();
var pass=TextEditingController();
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xff85C9E8) ,
        body: SingleChildScrollView(
          child: 
              Container(
                margin: EdgeInsets.only(left: 8,right: 8,top:MediaQuery.of(context).size.height/3)
                ,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
                ),
                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        
                        children: [
                           Container(
                         child: FittedBox(
                           child: Text(

                              "Login",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.1,
                                fontFamily: 'Schyler'
                              ),
                            
                            ),
                         )
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height/18 ,),
                          TextFormField(
                            controller: id,
                            decoration: InputDecoration(
                              labelText: "userId",
                              border:OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10))) ),
                          SizedBox(height:15 ,),
                          TextFormField(
                            controller: pass,
                            decoration: InputDecoration(
                              labelText: "password",
                              border:OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10))) ),
                   SizedBox(height:15,),
                    Container(
                          height: MediaQuery.of(context).size.height/18,
                          width: MediaQuery.of(context).size.width/3,
                          child: ElevatedButton(
                            onPressed: () async{
                              bool res= await mongodb.search(id.text, pass.text);
                              res? showOverlay(context,"Success"):showOverlay(context,"Fail");

                            }, 
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shadowColor: Colors.transparent
                            ),
                            child: Text("Go -->")),
                        ),
                        ]
                        ),
                    ),
                  ),),
              )
            ,
          ),
        ),
      );
  }
}