import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testapp/core/sizeUtil.dart';
import 'package:testapp/custom/iconWidget.dart';
import 'package:testapp/views/dashboardView.dart';



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AnimatedGlassWidget extends StatefulWidget {
  const AnimatedGlassWidget({Key? key}) : super(key: key);

  @override
  _AnimatedGlassWidgetState createState() => _AnimatedGlassWidgetState();
}

class _AnimatedGlassWidgetState extends
State<AnimatedGlassWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconSlideAnimation;
  late Animation<double> _widgetGrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),

      vsync: this,
    );

    _iconSlideAnimation = Tween<double>(begin: 0.0, end: .6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _widgetGrowAnimation = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 3000), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: _widgetGrowAnimation.value,
          child: GlassWidget(

            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        bottom: 14.0,
                      ),
                      child: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        // delay: const Duration(milliseconds: 3000),
                        child: const Text(
                          "Gladkova St.25",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(0.5, 0),
                    ).animate(_iconSlideAnimation),
                    child: Padding(
                      padding:  EdgeInsets.only(right: MySize.size22),
                      child: iconWidget(
                        icon: Iconsax.arrow_right_3,
                        color: Colors.white,
                        size: MySize.size12,
                        padding: MySize.size15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
