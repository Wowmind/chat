import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color(0XFFF3E5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80,),
              const Text('Settings',
              style: TextStyle(
                color: Color(0xFFEA80FC), fontSize: 24, fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),

              Container(
                height: 90,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    const CircleAvatar(radius: 40.0,backgroundColor: Color(0XFFF3E5F5),),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        SizedBox(height:20 ,),
                         Text('Name',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                         Text('What is on your mind..',
                          style: TextStyle(
                            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
             const Divider(
                height: 2,
                thickness: 0.5,
                color: Colors.black38,
              ),
              Container(
                height: 278,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children:   [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEA80FC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/key.png', color: Colors.white,),
                        ),

                        const SizedBox(width: 10,),
                       const Text('Account',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 50.0),
                      child: Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children:   [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.star, color: Colors.white,
                          )
                        ),

                        const SizedBox(width: 10,),
                        const Text('Starred',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 50.0),
                      child: Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      children:   [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.messenger, color: Colors.white,
                            )
                        ),

                        const SizedBox(width: 10,),
                        const Text('Chats',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 50.0),
                      child: Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      children:   [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.notification_important, color: Colors.white,
                            )
                        ),

                        const SizedBox(width: 10,),
                        const Text('Notifications',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),


                  ],
                ),

              ),
              const SizedBox(height: 40,),

              Container(
                height: 135,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children:   [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: const Icon(
                              Icons.help, color: Colors.white,
                            )
                        ),

                        const SizedBox(width: 10,),
                        const Text('Help',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 50.0),
                      child: Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children:   [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.favorite, color: Colors.white,
                            )
                        ),

                        const SizedBox(width: 10,),
                        const Text('Tell a friend',
                          style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10,),

                      const Divider(
                        height: 2,
                        thickness: 0.5,
                        color: Colors.black38,
                      ),


                  ],
                ),

              ),
              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(left: 100,right: 100),
                child: TextButton(onPressed: !isLoggedIn ? null : () => doUserLogout(),
                child: const Center(
                  child: Text('Sign out'),
                ),
                ),
              )


            ],
          ),
        ),
      )
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
             TextButton(
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
             TextButton(
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
  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      showSuccess("User was successfully logout!");
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }

}
