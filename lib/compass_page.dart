import 'dart:math';

import 'package:compass_app/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';

class CompassPage extends StatefulWidget {
  const CompassPage({super.key});

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  bool _hasPermissions = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchPermissionStatus();
  }
  
  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status){
      if(mounted) {
        setState(() {
          _hasPermissions = (status == PermissionStatus.granted);
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: Builder(
        builder: (context) {
          if (_hasPermissions) {
            return _buildCompass();
          }
          else {
            return _buildPermissionSheet();
          }
        },
      ),
    );
    
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Builder(
    //       builder: (context) {
    //         if (_hasPermissions) {
    //           return _buildCompass();
    //         }
    //         else {
    //           return _buildPermissionSheet();
    //         }
    //       },
    //     ),
    //   ),
    // );
  }

  // compass widget
  Widget _buildCompass() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compass",
          style: TextStyle(fontSize: 30, 
          fontWeight: FontWeight.w800, 
          color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        leading: GestureDetector(
          onTap: () => {
            Navigator.maybePop(context, MaterialPageRoute(builder: (context) => const HomePage())),
            debugPrint("Navigate to Home Page"),
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          // error msg
          if (snapshot.hasError) {
            return Text("Error reading heading: ${snapshot.error}");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          double? direction = snapshot.data!.heading;

          // if direction is null, then device does not support this sensor
          if (direction == null) {
            return const Center(
              child: Text("Device does not have sensors"),
            );
          }

          // return compass
          return Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Transform.rotate(
                angle: direction * (pi / 180) * -1,
                child: Image.asset("assets/compass.png"),
              ),
            ),
          );
        },
      ),
    );
    
    
    
  }

  // permission sheet widget
  Widget _buildPermissionSheet() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compass",
          style: TextStyle(fontSize: 30, 
          fontWeight: FontWeight.w800, 
          color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        leading: GestureDetector(
          onTap: () => {
            Navigator.maybePop(context, MaterialPageRoute(builder: (context) => const HomePage())),
            debugPrint("Navigate to Home Page"),
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[500], //background color of button
            side: const BorderSide(width:3, color:Colors.black26), //border width and color
            elevation: 3, //elevation of button
            shape: RoundedRectangleBorder( //to set border radius to button
              borderRadius: BorderRadius.circular(30)
            ),
            padding: const EdgeInsets.all(20) //content padding inside button
          ),
          child: const Text("Request Permission", 
            style: TextStyle(fontSize: 20, 
            fontWeight: FontWeight.w800, 
            color: Colors.white),
          ),
          onPressed: () {
            Permission.locationWhenInUse.request().then((value) {
              _fetchPermissionStatus();
            });
          },
        )
      ),
    );
    
    
    
    

    // return Scaffold(
    //   backgroundColor: Colors.grey[900],
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         const Padding(padding: EdgeInsets.all(0),
    //           child: Text("Compass Page",
    //             style: TextStyle(fontSize: 30, 
    //             fontWeight: FontWeight.w800, 
    //             color: Colors.grey),
    //           ),
    //         ),
            
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(
    //               height: 70,
    //               width: 300,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Colors.grey[500], //background color of button
    //                   side: const BorderSide(width:3, color:Colors.black26), //border width and color
    //                   elevation: 3, //elevation of button
    //                   shape: RoundedRectangleBorder( //to set border radius to button
    //                     borderRadius: BorderRadius.circular(30)
    //                   ),
    //                   padding: const EdgeInsets.all(20) //content padding inside button
    //                 ),
    //                 onPressed: () {
    //                   // Add your onPressed code here!
    //                   Permission.locationWhenInUse.request().then((value) {
    //                    _fetchPermissionStatus();
    //                  });
    //                 },
    //                 child: const Text("Request Permission", 
    //                   style: TextStyle(fontSize: 20, 
    //                   fontWeight: FontWeight.w800, 
    //                   color: Colors.black87),
    //                 ),
    //               ),
    //             ),
                
    //           ],
    //         ),

    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(
    //               height: 70,
    //               width: 300,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Colors.grey[500], //background color of button
    //                   side: const BorderSide(width:3, color:Colors.black26), //border width and color
    //                   elevation: 3, //elevation of button
    //                   shape: RoundedRectangleBorder( //to set border radius to button
    //                     borderRadius: BorderRadius.circular(30)
    //                   ),
    //                   padding: const EdgeInsets.all(20) //content padding inside button
    //                 ),
    //                 onPressed: () {
    //                   // Add your onPressed code here!
    //                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    //                 },
    //                 child: const Text("Back to Home Page", 
    //                   style: TextStyle(fontSize: 20, 
    //                   fontWeight: FontWeight.w800, 
    //                   color: Colors.black87),
    //                 ),
    //               ),
    //             ),
                
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}