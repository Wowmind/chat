import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();


    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const  Color(0XFFF3E5F5),
      body: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SizedBox(height: 80,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEA80FC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  TextField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Color(0XFFF3E5F5),),
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Color(0XFFF3E5F5), fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding:  EdgeInsets.only(top: 15),
                      ),
                    ),
                  ),
                ),

                 GestureDetector(
                   child: Container(
                     height: 50,
                      width: 35,
                    decoration: BoxDecoration(
                      color: const Color(0XFFF3E5F5),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Center(
                      child:  Text('Go',
                      style: TextStyle(color: Color(0xFFEA80FC),fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                    ),
                    ),
                     onTap: () {},
                 ),
              ],
            ),

            Expanded(child: FutureBuilder<List<ParseObject>>(
                future: doUserQuery(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                            width: 100,
                            height: 100,
                            child: const CircularProgressIndicator()),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error...: ${snapshot.error.toString()}"),
                        );
                      } else {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('None user found'),
                          );
                        }

                        return ListView.builder(
                            padding: const EdgeInsets.only(top: 10.0),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final user = snapshot.data![index] as ParseUser;
                              return ListTile(
                                title: Text(
                                    ' ${user.username} '),
                                subtitle: Text(user.createdAt.toString()),
                              );
                            });
                      }
                  }
                }))
          ],
        ),
      )
    );
  }
  Future<List<ParseObject>> doUserQuery() async {
    QueryBuilder<ParseUser> queryUsers =
    QueryBuilder<ParseUser>(ParseUser.forQuery());
    final ParseResponse apiResponse = await queryUsers.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
