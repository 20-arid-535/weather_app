
import 'dart:ui';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/const/api_const.dart';
import 'package:weather_app/model/api_model.dart';

import '../model/api_model.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
String? currentCity;
var searchcontroller=TextEditingController();
@override
  initState(){
  super.initState();
  _requestPermission();
  
}
 Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      currentCity = placemarks[0].locality;
    });
  }

  Future<void> _requestPermission() async {
  if (await Permission.location.isGranted) {
    // Permission already granted
     _getCurrentLocation();
    return;
  }

  var status = await Permission.location.request();
  if (status.isGranted) {
    // Permission granted
     _getCurrentLocation();
  } else {
    // Permission denied
    _requestPermission();
  }
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
backgroundColor: Colors.black,
      body:  FutureBuilder<ApiModel?>(
        future: ApiService.getData(city: currentCity), builder: (context,snapshot){
         if(!snapshot.hasData){
         return  Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
           var data=snapshot.data;
        print("rr" + data!.current.toString());
            return Padding(
        padding: const EdgeInsets.fromLTRB(30, 24, 20, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(11,-0.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle
                  ),
                ),
              )
              ,
               Align(
                alignment: AlignmentDirectional(-11,-0.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle
                  ),
                ),
              ),
               Align(
                alignment: AlignmentDirectional(0,-1.1),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 116, 4),
                    
                  ),
                ),
              ),
              
             BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0,sigmaY: 100.0),
             child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
             ),
             ),
             SizedBox(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 40,),
    Text("Good Morning", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
    ),
    Text("${currentCity}", style: TextStyle(fontSize: 14,color: Colors.white),
    ),
    SizedBox(height: 2,),
    TextField(
      controller: searchcontroller,
      onSubmitted: (value) {
        setState(() {
          currentCity=value;
        });
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,),
        hintText: "Search",
        focusedBorder: OutlineInputBorder(borderSide :BorderSide(color: Colors.grey.shade600)),
        enabledBorder:  OutlineInputBorder(borderSide :BorderSide(color: Colors.grey.shade600)),
      ),
    ),
    Image.asset("assets/cloud.png",width:350,height: 270,),
    Center(
      child: Column(
        children: [
          Text("${data!.current.tempC}°C", style: TextStyle(fontSize: 46,fontWeight: FontWeight.w500 ,color: Colors.white),
          ),
          Text("${data!.current.condition.text}", style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.grey.shade300),
          ),
           Text("${data!.location.localtime}", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),
          ),
          SizedBox(height: 30,)
        ],
        
      ),
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  
  Image.asset("assets/sun.png",width: 60,),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Text("Sunrise",style: TextStyle(color: Colors.grey.shade400,fontSize: 16),),
      ),
      Padding(
       padding: const EdgeInsets.only(left: 10),
        child: Text("6:43 am",style: TextStyle(color: Colors.white,fontSize: 16),),
      )
    ],
  ),
  SizedBox(width: 43,),
 Padding(
   padding: const EdgeInsets.only(top: 7),
   child: Image.asset("assets/moon.png",width: 60,height: 50,),
 ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Text("Sunset",style: TextStyle(color: Colors.grey.shade400,fontSize: 16),),
      ),
      Padding(
       padding: const EdgeInsets.only(left: 10),
        child: Text("7:43 pm",style: TextStyle(color: Colors.white,fontSize: 16),),
      )
    ],
  ),
],

    ),
    SizedBox(height: 25,),
     Row(
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  
  Padding(
   padding: const EdgeInsets.only(top: 7),
    child: Image.asset("assets/high.png",width: 60,height: 50,),
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Text("Temp Max",style: TextStyle(color: Colors.grey.shade400,fontSize: 16),),
      ),
      Padding(
       padding: const EdgeInsets.only(left: 10),
        child: Text("31°C",style: TextStyle(color: Colors.white,fontSize: 16),),
      )
    ],
  ),
  SizedBox(width: 19,),
 Padding(
   padding: const EdgeInsets.only(top: 7),
   child: Image.asset("assets/low.png",width: 60,height: 50,),
 ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Text("Temp Min",style: TextStyle(color: Colors.grey.shade400,fontSize: 16),),
      ),
      Padding(
       padding: const EdgeInsets.only(left: 10),
        child: Text("11°C" ,style: TextStyle( color: Colors.white,fontSize: 16),),
      )
    ],
  ),
],

    )
  ],
),
             )
            ],
          ),
        ),
      );
          }
          
        }),
          
      
    );
  }
}