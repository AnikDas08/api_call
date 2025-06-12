import 'package:flutter/material.dart';
import 'package:flutterapioractice/Photo.dart';
import 'package:flutterapioractice/PhotoService.dart';
import 'package:flutterapioractice/Screen/UserModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var photo=PhotoFetch().fetchUrl();
    var user=PhotoFetch().fetchUser();
    print(photo);
    return Scaffold(
      appBar: AppBar(title: Text("lkdjfkd"),),
      body: FutureBuilder<List<Photo>>(
          future: photo,
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
              List<Photo> photos = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(photos[index].title.toString()),
                          leading: CircleAvatar(backgroundImage:
                          NetworkImage(photos[index].url.toString()),)
                      );
                    }),
              );
            }
          }),
    );
  }
}
