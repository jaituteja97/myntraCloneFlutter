import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/Theme/pallets.dart';
import 'package:interview/const.dart';

import 'db/cartAmount.dart';

Widget productCard(
    {String image,
    String title,
    String subtitle,
    String sold_by,
    String size,
    String qty,
    String discount_amount,
    String actual_amount,
    BuildContext context,
     int index,
     Function updateState,
    String discount_percent}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.network(image),
                  SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                          activeColor: appThemeColor,
                          value: selectedItem[index],
                          onChanged: (val) {
                            selectedItem[index] = !selectedItem[index];
                            updateState();
                            print(selectedItem);
                          })),
                ],
              )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyText1),
                    Spacer(),
                    Icon(
                      Icons.clear,
                      size: 16,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: appTextColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  sold_by,
                  style: TextStyle(
                      color: Color(0xFF94969f),
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Wrap(
                  children: [
                    colorCard(
                      text: "Size: ${size}",
                    ),
                    SizedBox(width: 10.w),
                    colorCard(text: "Qty: ${qty}"),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text("${rupee} ${discount_amount}"),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget colorCard({String text}) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: const BoxDecoration(
        color: Color(0xFFf5f5f6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: appTextColor,
          fontWeight: FontWeight.w600,
        ),
      ));
}

Widget placeOrderButton({Function onTap}) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 2.0, offset: Offset(0.0, 0.75))
      ],
    ),
    child: Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            color: buttonStripColor,
            child: Text(
              "No Item selected, select at least one item to place order.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
          child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: MaterialButton(
                  color: appThemeColor,
                  textColor: Colors.white,
                  onPressed: onTap,
                  child: Text(
                    "PLACE ORDER",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ))),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    ),
  );
}

Widget suggestedCard(
    {String image,
    String title,
    String subtitle,
    String sold_by,
    String size,
    String qty,
    String discount_amount,
    String actual_amount,
    BuildContext context,
    String discount_percent

    }) {
  return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      child: Container(
        width: 140.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0Xffeaeaec), width: 1.0)),
        child: Column(
          children: [
            SizedBox(
                height: 160.h,
                child: Image.network(image, fit: BoxFit.fitHeight)),
            SizedBox(height: 5.h),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start),
                  Text(
                    sold_by,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF94969f),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${rupee + discount_amount}",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      SizedBox(width: 2.w),
                      Text("${rupee + actual_amount}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10.sp),
                          textAlign: TextAlign.end),
                      SizedBox(width: 2.w),
                      Text(
                        "($discount_percent )",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      const Border(top: BorderSide(color: Color(0xFFeaeaec)))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: const Text("ADD TO BAG",
                    style: TextStyle(
                        color: appThemeColor, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ));
}

Widget donationAmountCard({String text}) {
  return Padding(
    padding: EdgeInsets.only(right: 10.w),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFd4d5d9)),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.r), right: Radius.circular(20.r))),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
