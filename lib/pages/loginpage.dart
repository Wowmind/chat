import 'package:chatapp/pages/home.dart';
import 'package:chatapp/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color(0XFFF3E5F5),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 280,),

             const  Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0XFFD500F9)),),

              const SizedBox(height: 10,),

              const  Text('Please login to continue.', style: TextStyle(fontSize: 14, color: Color(0XFFD500F9)),),

              const SizedBox(height: 30,),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  color:const  Color(0xFFEA80FC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: controllerUsername,
                  enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration:const  InputDecoration(
                    labelText:  'Username',
                    labelStyle: TextStyle(color: Color(0XFFF3E5F5), fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.email_outlined, color: Color(0XFFF3E5F5)),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 30,),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  color:const  Color(0xFFEA80FC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:TextField(
                  controller: controllerPassword,
                  enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0XFFF3E5F5), fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.lock, color: Color(0XFFF3E5F5)),
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                ),
              ),

              const SizedBox(height: 50,),
              GestureDetector(
                child: Center(
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color(0xFFEA80FC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const  Center(child: Text('Login', style: TextStyle(color: Color(0XFFF3E5F5), fontWeight: FontWeight.bold),)),
                  ),
                ),
                onTap: isLoggedIn ? null : () {
                  return doUserLogin();



                }
              ),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: () {},
                  child: const Center(
                      child:  Text(
                    'Forgot Password', style: TextStyle(fontSize: 12, color: Color(0XFFD500F9)),))),

              const SizedBox(height: 60,),

              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                  },
                  child: const Center(
                      child:  Text(
                        'Don''t have an account? Sign up', style: TextStyle(fontSize: 14, color: Color(0XFFD500F9)),))),


            ],
          ),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const  Color(0XFFF3E5F5),
          title: const Text("Success!", style: TextStyle( color: Color(0xFFEA80FC),),),
          content: Text(message),
          actions: <Widget>[
             TextButton(
              child: const Text("OK", style: TextStyle( color: Color(0xFFEA80FC),),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const  Color(0XFFF3E5F5),
          title: const Text("Error!", style: TextStyle( color: Color(0xFFEA80FC),),),
          content: Text(errorMessage),
          actions: <Widget>[
              TextButton(
              child: const Text("OK", style: TextStyle( color: Color(0xFFEA80FC),),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!");
      setState(() {
        isLoggedIn = true;
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
        });
      });
    } else {
      showError(response.error!.message);
    }

  }

}
