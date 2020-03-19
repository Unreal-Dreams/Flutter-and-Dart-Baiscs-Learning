import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class InsightsModel {
  String imageurl;
  String id;
  String timeupload;
  String post;
  List<String> likes;
  Map<String, dynamic> comments;



  InsightsModel({
    this.id = '',
    this.post = '',
    this.imageurl = '',
    this.comments = const {},
    this.likes =  const <String>[],
    this.timeupload = '',
  });

  factory InsightsModel.fromJson(
      Map<String, dynamic> json, String insightId) {
    return InsightsModel(
      imageurl: json['imageurl'],
      id: json['id'],
      comments: json['comments'],
      likes: json['likes'].cast<String>(),
      post: json['post'],
    );
  }
}

Future<List<InsightsModel>> getAllInsights() async {
  try {
 //   final user = await FirebaseAuth.instance.currentUser();
    final insights = await Firestore.instance
        .collection('Insights')
        .getDocuments();
    List<InsightsModel> myinsightList = [];

    insights.documents.forEach((insights) {
      if (insights.data.isNotEmpty)
        myinsightList.add(InsightsModel.fromJson(
            new Map<String, dynamic>.from(insights.data), insights.documentID));
    });

    return myinsightList;
  } catch (ex) {
    print("Problem in fetching sessions from Database.");
    print(ex);
    return [];
  }
}

int length(List list){
  return list.length;

}



