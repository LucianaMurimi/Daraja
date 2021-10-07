import 'package:flutter/material.dart';
import '../services/daraja.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String email = '';
  String phoneNumber = '';
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CHECK OUT SCREEN
      //    1. logo
      //    2. email TextFormField
      //    3. phone TextFormField
      //    4. checkout Button
      backgroundColor: Color(0xFFffffff),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

            child: Form(
              child: Column(

                children: [
                  // 1. logo
                  //------------------------------------------------------------
                  SizedBox(height: 28,),
                  Text("LIPA NA M-PESA ONLINE",
                  style: TextStyle(color: Color(0xFF00953e), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.w900, letterSpacing: 2, wordSpacing: 2)),
                  SizedBox(height: 8.0),
                  Image.asset("assets/images/money.png", width: 212, height: 160),
                  SizedBox(height: 8.0),
                  RichText(
                      text: TextSpan( style: TextStyle(fontSize: 14, wordSpacing: 1.6, height: 1.8, color: Colors.black),
                        children: [
                          TextSpan(text: "LIPA NA M-PESA ONLINE API ", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xBF000000))),
                          TextSpan(text: "is a Merchant | Business initiated C2B (Customer to Business) Payment."),
                        ],
                      ),
                      textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  //------------------------------------------------------------
                  // 2. email TextFormField
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Color(0xFFd3d3d3), width: 1,),
                    ),

                    child: TextFormField(
                      onChanged: (val) {setState(() => email = val);},

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'email', labelStyle: TextStyle(fontSize: 10.0),
                        hintText: 'example@gmail.com', hintStyle: TextStyle(fontSize: 10.0),
                        icon: Icon(Icons.email, size: 16, color: Color(0xB3000000)),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  //------------------------------------------------------------
                  // 3. email TextFormField
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Color(0xFFd3d3d3), width: 1,),
                    ),

                    child: TextFormField(
                      onChanged: (val) {setState(() => phoneNumber = val);},

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'phone no.', labelStyle: TextStyle(fontSize: 10.0),
                        hintText: '254xxxxxxxxx', hintStyle: TextStyle(fontSize: 10.0),
                        icon: Icon(Icons.phone, size: 16, color: Color(0xB3000000)),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 28.0),
                  //------------------------------------------------------------
                  // 4. checkout Button
                  Container(
                    padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                    width: double.infinity,

                    decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0),),

                    child: TextButton(
                      child: Text('CHECK OUT',
                          style: TextStyle(color: Color(0xFFffffff), fontFamily: 'MonospaceBold', fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 2, wordSpacing: 3.6)),
                      onPressed: (){
                        print(email);
                        print(phoneNumber);
                        processRequest(amount, int.parse(phoneNumber));
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
