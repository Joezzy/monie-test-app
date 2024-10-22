

import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:testapp/core/appColor.dart';
import 'package:testapp/core/sizeUtil.dart';
import 'package:testapp/custom/animatedCounter.dart';
import 'package:testapp/custom/iconWidget.dart';
import 'package:testapp/main.dart';
import 'package:testapp/views/test.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // tileMode: TileMode.repeated,
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.highlight.withOpacity(.01),
              AppColor.highlight.withOpacity(.7),
              // AppColor.highlight,
              AppColor.highlight,
            ],
          stops: const [
            0.1,   // Position of the third color
            0.99,   // Position of the third color
            0.99,   // Position of the third color
          ],
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size20,),
              Padding(
                padding:  EdgeInsets.all(MySize.size20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    FadeIn(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            // Icon(Icons.switch_access_shortcut_add_rounded, color: AppColor.secFont),
                            Icon(Iconsax.location5, color: AppColor.secFont, size: MySize.size16,),
                            Text(" Saint. Petersburg", style: TextStyle(color: AppColor.secFont),)
                          ],
                        ),
                      ),
                    ),

                    ZoomIn(
                      duration: const Duration(milliseconds: 2000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/images/avatar1.jpg",
                        // child: Image.asset("assets/images/slider.png",
                          fit: BoxFit.cover,
                          height: MySize.size40,
                          width: MySize.size40
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Padding(
              padding:  EdgeInsets.only(
                //////
                top: MySize.size20,
                left: MySize.size20,
                right: MySize.size20,
                // bottom: MySize.size10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeIn(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 1000),


                    child: Text("Hi, Marina",
                      style: TextStyle(fontSize: MySize.size20, color: AppColor.secFont),),
                  ),
                  SlideInUp(
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 1000),

                    from: 50,
                    child:
                    FadeIn(
                      duration: const Duration(milliseconds: 100),
                      delay: const Duration(milliseconds: 1000),

                      child: Text("Let's select your \nperfect place",
                        style: TextStyle(fontSize: MySize.size30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  // SlideInUp(
                  //   duration: const Duration(milliseconds: 1000),
                  //   delay: const Duration(milliseconds: 1000),
                  //   from: 50,
                  //   child:
                  //   Text("perfect place",
                  //     style: TextStyle(fontSize: MySize.size30, fontWeight: FontWeight.w500),
                  //   ),
                  // ),


                ],
              ),
            ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:MySize.size20,
                vertical: MySize.size30),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    sm: 6,
                    xs: 6,
                    md: 6,
                    lg: 6,
                    child:
                    ZoomIn(
                      duration: const Duration(milliseconds: 3000),
                      delay: const Duration(milliseconds: 1500),

                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: MySize.size30,
                            horizontal: MySize.size40
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.highlight,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: MySize.size20),
                              child: const Text("BUY",
                                style: TextStyle(color: Colors.white),),
                            ),
                            AnimatedCounter(
                              end: 1034,
                              duration: const Duration(seconds: 3),
                              textStyle: TextStyle(fontSize: MySize.size34,color: Colors.white, fontWeight: FontWeight.bold),
                            ),

                            const Text("Offers",
                              style: TextStyle(color: Colors.white),),

                          ],
                        ),
                      ),
                    ),),
                  ResponsiveGridCol(
                    sm: 6,
                    xs: 6,
                    md: 6,
                    lg: 6,
                    child:
                    ZoomIn(
                      duration: const Duration(milliseconds: 3000),
                      delay: const Duration(milliseconds: 1500),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: MySize.size30,
                            horizontal: MySize.size40
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: MySize.size20),
                              child: Text("RENT",
                                style: TextStyle(color: AppColor.secFont),),
                            ),

                            AnimatedCounter(
                              end: 2120,
                              duration: const Duration(seconds: 3),
                              textStyle: TextStyle(fontSize: MySize.size34,color: AppColor.secFont, fontWeight: FontWeight.bold),
                            ),

                            Text("Offers",
                              style: TextStyle(color: AppColor.secFont),),

                          ],
                        ),
                      ),
                    ),)
                ]),
              ),

           SlideInUp(
             duration: const Duration(milliseconds: 600),
             delay: const Duration(milliseconds: 2500),
             from: 400,

             child: Container(
               padding: const EdgeInsets.all(10.0),
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(30),
                   topLeft: Radius.circular(30),
                 )
               ),
               child: Column(
                 children: [
                   cardWidget(height:MySize.size200),
             
                   Padding(
                     padding: const EdgeInsets.only(top: 10.0),
                     child: ResponsiveGridRow(children: [
                       ResponsiveGridCol(
                           sm: 6,
                           xs: 6,
                           md: 6,
                           lg: 6,
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: cardWidget(
                                 height: MySize.size370,
                                 iconPadding: MySize.size10
                             ),
                           )
                       ),
                       ResponsiveGridCol(
                           sm: 6,
                           xs: 6,
                           md: 6,
                           lg: 6,
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Column(
                               children: [
                                 cardWidget(height: MySize.size180,
                                     iconPadding: MySize.size10
                                 ),
                                 SizedBox(height: 10,),
                                 cardWidget(height: MySize.size180,
                                     iconPadding: MySize.size10
                                 ),
                               ],
                             ),
                           )
                       ),
             
             
                     ]),
                   )
                 ],
               ),
             ),
           )







            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget({
    required double height,
     double? iconPadding,
  }) {
    return Stack(
          children: [
            Container(
                height:height  ,
              width: MySize.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/img2.jpg",
                fit: BoxFit.cover,
                height: MySize.size300,
                ))),
            const Positioned(
              bottom: 10,
                left: 18,
                right: 18,
                child:
                AnimatedGlassWidget(
                 // Set this to your desired ending width
                )                // GlassWidget(child: Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             top: 14.0,
                //             bottom: 14.0,
                //             // left: 5.0,
                //           ),
                //           child: Text(
                //             "Gladkova St.25",
                //             textAlign: TextAlign.center, // Center align the text
                //             style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //       ),
                //       iconWidget(
                //           icon: Iconsax.arrow_right_3,
                //           color: Colors.white,
                //         size: MySize.size12,
                //         padding:iconPadding?? MySize.size15
                //       )
                //     ],
                //
                //   ),
                // ),),

            )
          ],
        );
  }
}




class GlassWidget extends StatelessWidget {
  final Widget child;

  const GlassWidget({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // width: 300,
        height: MySize.size50,
        decoration: BoxDecoration(
          color: AppColor.highlight.withOpacity(0.15),
          // color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: child
        ),
      ),
    );
  }
}



