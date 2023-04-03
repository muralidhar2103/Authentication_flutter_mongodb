// import 'dart:html';

import 'package:basic_connections/document.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'constants.dart';
 var usercollection;
class mongodb{
  

  static connect () async{
    var db=await Db.create(URL);
    await db.open();
  usercollection=db.collection(Collection);
  
  }
  static insert(String name,String userid,String phone,String pass ) async{
    var _id=ObjectId();
    final data=Model(id: _id,name: name,pass: pass,phone: phone,userid: userid);
    var response= await  usercollection.insertOne(data.tojson());
   
  }
  static Future<List<Map<String, dynamic>>> getDocuments() async {
   
      final users = await usercollection.find().toList();
      print(users);
      return users;
    
  }
 static Future<bool>search(String id,String pass) async{
  final response= await usercollection.find({
    'userid':id,
      'password':pass
  }).toList();
  print(response);
  return response.length==0?false:true;
 }
}