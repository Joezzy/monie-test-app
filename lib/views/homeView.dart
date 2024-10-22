

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testapp/core/appColor.dart';
import 'package:testapp/core/sizeUtil.dart';
import 'package:testapp/views/dashboardView.dart';
import 'package:testapp/views/mapView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

List<IconData> navIcon=[
  Iconsax.search_normal_15,
  Iconsax.message5,
  Iconsax.home5,
  Iconsax.heart5,
  Iconsax.profile_tick5,
];

int selectedIndex=2;

class _HomeViewState extends State<HomeView> {


  List<Marker> liveMarker = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return  Scaffold(
      body: Stack(
        children: [
          selectedIndex==0?
          const Mapview():
          selectedIndex==1?
           Container():
          selectedIndex==2?
          const DashboardView():
          selectedIndex==3?
          Container():
          selectedIndex==4?
       Container():
    Container(),


          //Navbar
          Positioned(
              bottom: MySize.size40,
              left: MySize.size38,
              right: MySize.size38,
              child:
              SlideInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 4000),
                  from: 200,
                  child: _navBar())),

        ],
      ),
    );
  }





  Widget _navBar(){
    return Container(
      height: 65,

      padding:  EdgeInsets.symmetric(horizontal: MySize.size10),
      decoration: BoxDecoration(
          color: AppColor.lightBlack,
          borderRadius: BorderRadius.circular(40)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navIcon.map((icon){
          int index=navIcon.indexOf(icon);
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                left: index==0?0:12,
                top: 12,
                bottom: 12,
                right: index==0?22:12,),
              decoration: BoxDecoration(
                  color: isSelected? AppColor.highlight: AppColor.black,
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Icon(icon, color: Colors.white,),
            ),
          );
        }).toList() ,
      ),
    );
  }

}



/////


