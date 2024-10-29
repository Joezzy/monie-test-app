

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:testapp/core/appColor.dart';
import 'package:testapp/core/sizeUtil.dart';
import 'package:testapp/custom/iconWidget.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class Mapview extends StatefulWidget {
  const Mapview({super.key});

  @override
  State<Mapview> createState() => _MapviewState();
}

List<IconData> navIcon=[
  Iconsax.search_normal_15,
  Iconsax.message5,
  Iconsax.home5,
  Iconsax.heart5,
  Iconsax.profile_tick5,
];

int selectedIndex=0;

class _MapviewState extends State<Mapview> {
  late  CameraPosition mainAddress ;
  late GoogleMapController mapController;

  Set<Marker> markers = {};


  initMarkers2() async {
    // Set<Marker>
    //Replacing technique
    markers = {};
    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: const LatLng(59.93129021307281, 30.36082212343487),
      icon: await const Text2Marker(text: "").toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));
    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: const LatLng(59.9363425512704, 30.368032032840528),
      icon: await const Text2Marker(text: "").toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));

    markers.add(Marker(
      markerId: const MarkerId("3"),
      position: const LatLng(59.942723754562415, 30.368109239671522),
      icon: await const Text2Marker(
        text: "",
      ).toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));

    markers.add(Marker(
      markerId: const MarkerId("4"),
      position: const LatLng(59.93429257084871, 30.351586977839215),
      icon: await const Text2Marker(
        text: "",
      ).toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));
    markers.add(Marker(
      markerId: const MarkerId("5"),
      position: const LatLng(59.939707338771996, 30.350197254881355),
      icon: await const Text2Marker(
        text: "",
      ).toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));
    markers.add(Marker(
      markerId: const MarkerId("6"),
      position: const LatLng(59.94519855744914, 30.348653118261517),
      icon: await const Text2Marker(
        text: "",
      ).toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(300, 400)),
    ));
    // liveMarker=markers;
    setState(() {});
    print("Done${markers.length}");
  }

  @override
  void initState() {
    // TODO: implement initState
    //
    super.initState();
    // initMarkers();
    mainAddress = const CameraPosition(
      target: LatLng(59.93129021307281, 30.36082212343487),
      zoom: 13.5
    );
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return  Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // compassEnabled: true,
            mapToolbarEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            markers: markers,
            // liteModeEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            initialCameraPosition: mainAddress,
            onMapCreated: (GoogleMapController controller) {
              // _controller.complete(controller);


              mapController = controller;
              mapController.setMapStyle(darkMapStyle);
             initMarkers2();
            },
          ),

          //search
          Positioned(
              top: 70,
              left: 20,
              right: 20,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZoomIn(
                    duration: const Duration(milliseconds: 2000),
                    delay: const Duration(milliseconds: 1000),
                    child: SizedBox(
                      width: MySize.screenWidth/1.4,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Saint Petersburg",
                            hintStyle: TextStyle(fontSize: MySize.size14),
                            // errorStyle: const TextStyle(color: AppTheme.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color:Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(MySize.size30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color:Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(MySize.size30),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color:Colors.white,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(MySize.size30),
                            ),

                            filled: true,
                            fillColor:Colors.white,
                            contentPadding: EdgeInsets.only(
                                top: MySize.size10
                            ),
                            prefixIcon: const Icon(Iconsax.search_normal_1,
                              size: 20,
                            )


                        ),







                      ),
                    ),
                  ),


                  ZoomIn(
                    duration: const Duration(milliseconds: 2000),
                    delay: const Duration(milliseconds: 1000),
                    child: filterIconWidget(
                        icon: Icons.adjust,
                        color: Colors.white

                    ),
                  )

                ],
              )
          ),

          //Icon
          Positioned(
              bottom: 120,
              left: 20,
              right: 0,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZoomIn(
                    duration: const Duration(milliseconds: 2000),
                    delay: const Duration(milliseconds: 1000),
                    child: PopupMenuButton(
                      padding:  EdgeInsets.zero,
                      menuPadding: EdgeInsets.zero,
                      offset: const Offset(0, -150), //
                      // Adjust offset as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Adjust this value as needed
                      ),
                      icon:  Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: iconWidget(
                            icon: Iconsax.wallet,
                            iconColor: Colors.white,
                            color: Colors.white.withOpacity(.4)

                        ),
                      ),
                      itemBuilder: (context) => [

                        const PopupMenuItem<String>(

                          value: "layer", child: Row(children: [
                          Icon(Iconsax.shield_tick, size: 20,),
                          Text("  Cosy area any"),
                        ],),

                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(20),

                        ),

                        PopupMenuItem<String>(value: "layer", child: Row(children: [
                          Icon(Iconsax.wallet, size: 20,
                              color: AppColor.highlight
                          ),
                          Text("  Price", style: TextStyle(
                              color: AppColor.highlight
                          ),),
                        ],)),

                        const PopupMenuItem<String>(value: "layer", child: Row(children: [
                          Icon(Iconsax.shopping_bag, size: 20,),
                          Text("  Infrastructure"),
                        ],)),

                        const PopupMenuItem<String>(value: "layer", child: Row(children: [
                          Icon(Iconsax.layer, size: 20,),
                          Text("  Without any layer"),
                        ],)),


                      ],
                      onSelected: (item) async {

                      },
                    ),
                  ),
                  // GestureDetector(
                  //   onTap:(){
                  //  },
                  //   child: iconWidget(
                  //       icon: Iconsax.layer,
                  //       iconColor: Colors.white,
                  //       color: Colors.white.withOpacity(.4)
                  //
                  //   ),
                  // ),
                  const SizedBox(height: 5,),


                  ZoomIn(
                    duration: const Duration(milliseconds: 2000),
                    delay: const Duration(milliseconds: 1000),

                    child: iconWidget(
                        icon: Iconsax.direct_right4,
                        iconColor: Colors.white,
                        color: Colors.white.withOpacity(.34)

                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 120,
              right: 30,
              left: 0,
              child:

              ZoomIn(
                duration: const Duration(milliseconds: 2000),
                delay: const Duration(milliseconds: 1000),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MySize.size155,
                    padding: EdgeInsets.all(MySize.size12),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        borderRadius:BorderRadius.circular(30),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(Iconsax.menu_1, color: Colors.white,),
                        Image.asset("assets/images/list.png",
                          height: MySize.size15,
                        ),
                        const Text("  List of variants",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
              )),


        ],
      ),
    );
  }

  Widget filterIconWidget({required IconData icon, Color? color}) {
    return Container(
        margin: EdgeInsets.only(left: MySize.size6),
        padding: EdgeInsets.all(MySize.size15),
        decoration: BoxDecoration(
            color: color!,
            borderRadius: BorderRadius.circular(MySize.size40)
        ),

        child:  Image.asset(
          "assets/images/slider.png",

          height: MySize.size15,
          width: MySize.size15,

        ));
  }

}



class Text2Marker extends StatelessWidget {
  const Text2Marker({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: AppColor.highlight
      ),
      child:
      text==""?
      Icon(MdiIcons.officeBuilding, color: Colors.white,):
    Row(
        children: [
           Icon(MdiIcons.officeBuilding, color: Colors.white,),
          Text(
            " $text",
            style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
/////

const String darkMapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "featureType": "landscape",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#121212"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    }
  ]''';




