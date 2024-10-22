import 'package:flutter/material.dart';
import 'package:testapp/core/sizeUtil.dart';

Widget iconWidget(
    {required IconData icon,
      Color? iconColor,
      Color? color,
      double? size,
      double? padding,
    }
    ) {
  return Container(
    margin: EdgeInsets.only(left: MySize.size6),
    padding: EdgeInsets.all(padding ?? MySize.size12),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(MySize.size40)
    ),

    child:  Icon(icon, color: iconColor , size: size,),);
}
