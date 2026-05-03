import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/theme/colors.dart';

Widget BuildOutlinedIconButton(
    double width,
    double height,
    String title,
    void Function()? fun,
    {bool fromDelivery=false}


    ) {
  bool isPhotoButton=title.toLowerCase().contains('upload')||title.toLowerCase().contains('take');
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: height*.01,horizontal: width * .01),

    child: InkWell(
      onTap: fun,
      child: Container(
        //  width:  widget.width * .38,
        height:     height * .05,
        decoration: BoxDecoration(
          border: Border.all( // هنا أضفنا البوردر
            color:fromDelivery?AppColors.secondary:isPhotoButton?AppColors.secondary: AppColors.blueBorder, // لون البوردر
            width: .5,               // سمك البوردر
          ),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            title=='Mark As Delivered'?SvgPicture.asset("assets/images/delivery_man/orders/package-delivered.svg",
                width: width * .042,color: AppColors.secondary):
            title=='Upload Photo'?
            Iconify(
              MaterialSymbols.upload_rounded, // 👈 اسم الأيقونة من Material Symbols
              size: width*.052,
              color: AppColors.secondary,
            ):title=='Take Photo'?
            Icon(  CupertinoIcons.photo_camera,
              size: width*.052,
              color: AppColors.secondary,
            )
                :Iconify(
              IconParkSolid.history_query,  // This uses the Material Symbols "star" icon
              size:width*.052,
              color: AppColors.primary,
            ),
            SizedBox(width: fromDelivery?width*.01:width*.02,),
            Text(
              title,
              style: TextStyle(
                color:fromDelivery?AppColors.secondary:isPhotoButton?AppColors.secondary: AppColors.primary,
                fontSize:fromDelivery?  width * .029: width*.034,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}