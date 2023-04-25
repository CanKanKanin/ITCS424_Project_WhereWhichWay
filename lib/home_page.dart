import 'package:compass_app/compass_page.dart';
import 'package:compass_app/main.dart';
import 'package:compass_app/map_page.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'instruction_page.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final log = Logger('Home Page');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(0),
              child: Text("Home",
                style: TextStyle(fontSize: 30, 
                fontWeight: FontWeight.w800, 
                color: Colors.white),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 300,
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
                    onPressed: () => {
                      // Add your onPressed code here!
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CompassPage())),
                      debugPrint("Navigate to Compass Page"),
                      // log.info("Navigate to Compass Page"),
                    },
                    child: const Text("Compass", 
                      style: TextStyle(fontSize: 20, 
                      fontWeight: FontWeight.w800, 
                      color: Colors.white),
                    ),
                  ),
                ),
                
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 300,
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
                    onPressed: () => {
                      // Add your onPressed code here!
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MapPage())),
                      debugPrint("Navigate to Map Page"),
                      // log.info("Navigate to Map Page"),
                    },
                    child: const Text("Map", 
                      style: TextStyle(fontSize: 20, 
                      fontWeight: FontWeight.w800, 
                      color: Colors.white),
                    ),
                  ),
                ),
                
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 300,
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
                    onPressed: () => {
                      // Add your onPressed code here!
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionPage())),
                      debugPrint("Navigate to Instruction Page"),
                      // log.info("Navigate to Instruction Page"),
                    },
                    child: const Text("Instruction", 
                      style: TextStyle(fontSize: 20, 
                      fontWeight: FontWeight.w800, 
                      color: Colors.white),
                    ),
                  ),
                ),
                
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SizedBox(
            //       height: 70,
            //       width: 300,
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.grey[500], //background color of button
            //           side: const BorderSide(width:3, color:Colors.black26), //border width and color
            //           elevation: 3, //elevation of button
            //           shape: RoundedRectangleBorder( //to set border radius to button
            //             borderRadius: BorderRadius.circular(30)
            //           ),
            //           padding: const EdgeInsets.all(20) //content padding inside button
            //         ),
            //         onPressed: () {
            //           // Add your onPressed code here!
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
            //         },
            //         child: const Text("Note", 
            //           style: TextStyle(fontSize: 20, 
            //           fontWeight: FontWeight.w800, 
            //           color: Colors.black87),
            //         ),
            //       ),
            //     ),
                
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 300,
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
                    onPressed: () => {
                      // Add your onPressed code here!
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen())),
                      debugPrint("Navigate to First Page"),
                      // log.info("Navigate to First Page"),
                    },
                    child: const Text("Back to Welcome Page", 
                      style: TextStyle(fontSize: 20, 
                      fontWeight: FontWeight.w800, 
                      color: Colors.white),
                    ),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );

    
  }
}