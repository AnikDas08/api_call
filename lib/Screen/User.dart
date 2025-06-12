import 'package:flutter/material.dart';
import 'package:flutterapioractice/PhotoService.dart';
import 'package:flutterapioractice/Screen/UserModel.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    var user=PhotoFetch().fetchUser();
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
          future: user,
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());  // লোডিং স্টেট
            }
            else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));  // এ্যারর হ্যান্ডলিং
            }
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No photos available"));  // ডাটা না থাকলে
            }
            else {
              List<UserModel> data = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RowUser(name: "Name :", value: data[index].name.toString()),
                              RowUser(name: "address :", value: data[index].address!.city.toString()),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
class RowUser extends StatelessWidget {
  String name,value;
  RowUser({super.key,required this.name,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children: [
            Text(name),
            Text(value)
          ],

      ),
    );
  }
}

