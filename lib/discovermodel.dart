import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class DiscoverModel{
  String skill;
  List<String> mentors;



  DiscoverModel({
    this.skill = '',
    this.mentors =  const <String>[],
  });

  factory DiscoverModel.fromJson(
      Map<String, dynamic> json, String insightId) {
    return DiscoverModel(
      skill: json['skill'],
      mentors: json['mentors'].cast<String>(),
    );
  }
}

Future<List<DiscoverModel>> getAllmentors() async {
  try {
  //  final user = await FirebaseAuth.instance.currentUser();
    final discover = await Firestore.instance
        .collection('Skills')
        .getDocuments();
    List<DiscoverModel> myinsightList = [];

    discover.documents.forEach((discover) {
      if (discover.data.isNotEmpty)
        myinsightList.add(DiscoverModel.fromJson(
            new Map<String, dynamic>.from(discover.data), discover.documentID));
      print(myinsightList.length);
    });

    return myinsightList;
  } catch (ex) {
    print("Problem in fetching mentors from Database.");
    print(ex);
    return [];
  }
}
