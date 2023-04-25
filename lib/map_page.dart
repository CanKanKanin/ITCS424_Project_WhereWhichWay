// import 'dart:async';

import 'package:compass_app/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  // const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  final Set<Marker> _markers = {};

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(loc.latitude ?? 0.0, loc.longitude?? 0.0),
          zoom: 12.0,
          )
      ));
      //print(loc.latitude);
      //print(loc.longitude);

      setState(() {
        _markers.add(Marker(markerId: const MarkerId("Home"),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
     });
  }
  // final Completer<GoogleMapController> _controller = Completer();

  // static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  // static const LatLng destination = LatLng(37.33429383, -122.06600055);

  // List<LatLng> polylineCoordinates = [];

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyAbtuPbEiJ00gJdN8uaJhXKPYAfgy3KrnA", // api key
  //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     PointLatLng(destination.latitude, destination.longitude),
  //   );

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    // getPolyPoints();
    super.initState();
    setState(() {
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          // zoomControlsEnabled: false,
          initialCameraPosition: const CameraPosition(
            target: LatLng(13.7944, 100.3256),
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          markers: _markers,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.location_searching,color: Colors.white),
      //   onPressed: () {
      //     getLocation();
      //   }),
    );
  }
}