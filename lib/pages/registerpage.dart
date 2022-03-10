import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
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
              const SizedBox(height: 90,),
              IconButton(onPressed: () {
                Navigator.pop(context);
              },
                  icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFEA80FC),size: 24,)),

              const SizedBox(height: 70,),

              const  Text('Sign Up', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0XFFD500F9)),),

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
                  controller: controllerEmail,
                  enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration:const  InputDecoration(
                    labelText:  'Email',
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
                    labelText: 'Confirm Password',
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
                    child: const  Center(child: Text('SIGN UP', style: TextStyle(color: Color(0XFFF3E5F5), fontWeight: FontWeight.bold),)),
                  ),
                ),
                onTap: () => doUserRegistration(),
              ),


              const SizedBox(height: 40,),

              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                      child:  Text(
                        'Already have an account? Sign in', style: TextStyle(fontSize: 14, color: Color(0XFFD500F9)),))),


            ],
          ),
        ),
      ),
    );
  }
  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
             FlatButton(
              child: const Text("OK"),
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
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
             FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }

}
