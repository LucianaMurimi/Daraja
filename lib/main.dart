import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/checkout.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_config/flutter_config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){

          //----------------------------------------------------------------------
          if(snapshot.hasError){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Colors.white,),
              home: Scaffold(body: Center(child: Text('${snapshot.error}'))),
            );
          }

          //----------------------------------------------------------------------
          if(snapshot.connectionState == ConnectionState.done){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: new ThemeData(primaryColor: Colors.white),
              home: CheckOut(),
            );
          }

          //----------------------------------------------------------------------
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: new ThemeData(primaryColor: Colors.white),
            home: Scaffold(body: Center(child: SpinKitCircle(color: Color(0xFF00c853), size: 70.0))),
          );

        },
    );
  }
}
