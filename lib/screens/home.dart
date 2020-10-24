import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String qr_text = "Hamilton Darryl";
  final _keyForm = GlobalKey<FormState>();
  TextEditingController inputQr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Votre Qr code"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QrImage(data : qr_text, size: 310.0,),
              SizedBox(height: 20),
              Text("le Qr code corespond à : $qr_text", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Form(
                key: _keyForm,
                child: Column(
                    children: [
                      TextFormField(
                        controller: inputQr,
                        validator: ( value){
                          
                          if (value.isEmpty) {
                            return "Vous n'avez rien enter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Veuillez entrer votre expression",
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[400])
                          ),
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[400])
                        ),
                        ),
                      ),
                      SizedBox(height: 20),
                       MaterialButton(
                         minWidth: double.infinity,
                         height: 60,
                         onPressed: () {
                           
                           if (_keyForm.currentState.validate()) {
                                  
                              setState(() {
                                qr_text = inputQr.text;
                                  
                                });

                              inputQr.clear();  
                            }
                         },
                         color: Colors.green,
                         elevation: 0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50)
                         ),
                         child: Text("Sign up", style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600, 
                           fontSize: 18
                         ),),
                       )
                    ],
                  )
                ),
                 SizedBox(height: 20),
              Text("Copyright by Hamilton Darryl")
            ],
          ),
        ),
      ),
    );
  }
}