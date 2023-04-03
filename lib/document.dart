import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

Model jsontomodel(String data)=>Model.fromjson(json.decode(data)); 

String modeltojson(Model data)=> json.encode(data.tojson());
class Model {
  final ObjectId id;
  final String name;
  final String userid;
  final String phone;
  final String pass ;

  // User( this.id,this.name,this.userid,this.phone,this.pass);
   Model( { required this.id, required this.name, 
            required,required this.userid,
             required this.phone, required this.pass});
  
  Map<String,dynamic> tojson()
  {
    return {
      "_id":id,
      'name':name,
      'userid':userid,
      'phone':phone,
      'password':pass

    };
  }
  factory Model.fromjson(Map<String,dynamic> json)
  {
      return Model(
        id: json["_id"],
         name:json["name"],
      userid:json["userid"],
      phone:json["phone"],
      pass:json["password"],

      );
  }


}