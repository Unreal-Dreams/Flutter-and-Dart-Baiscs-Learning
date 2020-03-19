import 'package:addingdatabase/discovermodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:headstrt_app/models/current_user.dart';
//import 'package:headstrt_app/models/feed_model.dart';
//import 'package:headstrt_app/models/insight_model.dart';
//import 'package:headstrt_app/utils/colors.dart';
//import 'package:headstrt_app/utils/constants.dart';
//import 'package:headstrt_app/views/expertise_search.dart';
//import 'package:headstrt_app/widgets/event_Card.dart';
//import 'package:headstrt_app/widgets/insight_card.dart';
//import 'package:headstrt_app/widgets/news_feed_card.dart';
//import 'package:headstrt_app/widgets/search_field.dart';
import 'package:addingdatabase/UserModel.dart';

void main() => runApp(MaterialApp(
  home: FeedsPage(),
));


class FeedsPage extends StatefulWidget {
  //final InsightsModel insightsModel;
  final DiscoverModel discoverModel;
  FeedsPage({
    //@required this.insightsModel
    @required this.discoverModel
  });

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
//  ScreenUtil _screeUtil;
  Size _currentScreenSize;


//  List<InsightsModel> _myInsightsList = [];
//  void updateInsights() async {
//    getAllInsights().then((res) {
//      setState(() {
//        _myInsightsList = res;
//      });
//      print(_myInsightsList[0].likes[0]);
//      print(_myInsightsList[0].comments['KfG5CZpZxUwZLgnDnPk5']);
//    });
//  }

  //Map<String,String>  map_mentors = {};
  //List<String> _myExpertise=["cooking","DatabseManagement","eating"];

  @override
  void initState() {
    super.initState();
    updateDiscover();
    print(_myDiscoverList.length);
  }



  List<DiscoverModel> _myDiscoverList = [];
  void updateDiscover() async {
    getAllmentors().then((res) {
      setState(() {
        _myDiscoverList = res;
        print(_myDiscoverList.length);
      });
    });


  }



  @override
  Widget build(BuildContext context) {
    _currentScreenSize = MediaQuery.of(context).size;
  //  _screeUtil = ScreenUtil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(

          child: Text("This is my name")
      ),
    );
  }
}
