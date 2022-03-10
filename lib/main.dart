import 'package:chatapp/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'ruWGSWaBfRZEMGJ5M45CPj2h1iOfamTLRMW6MIaQ';
  final keyClientKey = 'bmLfGWJuwmHrFCeKMTwfuvIZL2dpaAnfZ6LQqmRF';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const LoginPage(),
    );
  }
}
