import 'dart:convert';

import 'package:flutterapioractice/Photo.dart';
import 'package:flutterapioractice/Screen/UserModel.dart';
import 'package:http/http.dart' as http;

class PhotoFetch{
  Future<List<Photo>> fetchUrl() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    List<Photo> photoList=[];
    if(response.statusCode==200){
      var list=jsonDecode(response.body.toString());
      for(Map i in list){
        Photo photo=Photo(title: i["title"], url: i["url"]);
        photoList.add(photo);
      }
      return photoList;
    }
    else{
      return photoList;
    }
  }
  Future<List<UserModel>> fetchUser() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    List<UserModel> userList=[];
    if(response.statusCode==200){
      var list=jsonDecode(response.body.toString());
      for(Map i in list){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }
    else{
      return userList;
    }
  }
}