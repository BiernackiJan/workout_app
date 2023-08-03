import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key :key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoInfo = [];

  bool _playArea=false;

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {//TODO Reads the json file
      setState(() {//TODO function that updates when there is new information (doesnt run only once)
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: _playArea==false?BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond.withOpacity(0.9)
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
          ):BoxDecoration(//TODO bool _playArea helps change color of the background here+Container below doesnt show
            color: color.AppColor.gradientSecond,
          ),
          child: Column(
            children: [
              _playArea==false?Container(
                padding: EdgeInsets.only(top: 70, right: 30, left: 30),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            Get.back();//TODO goes back to the previous page
                          },
                          child: Icon(Icons.arrow_back_ios, size: 20,
                          color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline, size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  color.AppColor.secondPageContainerGradient1stColor,
                                  color.AppColor.secondPageContainerGradient2ndColor
                                ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "68 mins",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 230,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColor.secondPageContainerGradient1stColor,
                                  color.AppColor.secondPageContainerGradient2ndColor
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handyman_outlined,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Resistant band, kettle-bell",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ):Container(//TODO if the _playArea is false the default container shows at top else it will show the video
                width: 300,
                height: 300,
                color: Colors.redAccent,
              ),
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(70))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Text(
                          "Circuit 1: Legs Toning",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop, size: 30, color: color.AppColor.loopColor),
                            SizedBox(width: 10,),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 10,
                                color: color.AppColor.setsColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Expanded(child: _listView())
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  _listView(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),//TODO makes equal distance between each side
        itemCount: videoInfo.length,
        itemBuilder: (_,int index){

          return GestureDetector(//TODO allows to click on item or widget
            onTap: (){
              debugPrint(index.toString());
              setState(() {//TODO This will redraw the top of the video page to hide top bar and play a video
                if(_playArea==false){
                  _playArea=true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index){
    return Container(
      height: 135,
      // color: Colors.redAccent,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          videoInfo[index]['thumbnail']
                      ),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                        color: Color(0xFF839fed)
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i = 0; i<70; i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          color: Color(0xFF839fed),
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
