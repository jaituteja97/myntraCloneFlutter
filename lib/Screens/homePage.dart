import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/Theme/pallets.dart';
import 'package:interview/const.dart';
import 'package:interview/db/cartAmount.dart';
import 'package:interview/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SHOPPING BAG",
                style: TextStyle(
                  color: Color(0xFF424553),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "STEP 1/2",
                style: TextStyle(
                  color: Color(0xFF424553),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),

            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 5.h),
                  Container(
                    
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.w),
                    child: Row(
                      children: [
                        Text("Check delivery time & services",style: TextStyle(fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text("ENTER PIN CODE",style: TextStyle(color: appThemeColor,fontWeight: FontWeight.w600),),

                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),


                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.pink,
                          value: isSelected,
                          onChanged: (val) {
                            isSelected = !isSelected;

                            setState(() {});
                          }),
                      Wrap(
                        children: [
                          const Text(
                            "2/2 ITEMS SELECTED",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                           Text("($rupee ${((cartAmount(outerBoolSelected: isSelected,cartItem: cartItem)["totalAmount"]))})",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                      SizedBox(width: 5.w),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite, color: Colors.pink,),
                      )
                    ],
                  ),


                  // ========================= product list   ================================ //
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItem.length,
                    itemBuilder: (ctx, i) {
                      return productCard(
                           index: i,
                          context: context,
                          image: cartItem[i]["image"],
                          title: cartItem[i]["title"],
                          size: cartItem[i]["size"],
                          subtitle: cartItem[i]["subtitle"],
                          actual_amount: cartItem[i]["actual_amount"],
                          discount_amount: cartItem[i]["discount_amount"],
                          discount_percent: cartItem[i]["discount_percent"],
                          qty: cartItem[i]["qty"],
                          sold_by: cartItem[i]["sold_by"],
                        updateState: updateState
                      );
                    },
                  ),

                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network("https://constant.myntassets.com/checkout/assets/img/products-blurred.webp",height: 30.h,),
                        SizedBox(width: 10.w,),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Login to see items from your existing bag and wishlist.",style: TextStyle(fontSize: 12.sp),),
                             SizedBox(height: 5.h,),
                             Text("LOGIN NOW",style: TextStyle(fontSize:12.sp,color: appThemeColor,fontWeight: FontWeight.w600,),)
                           ],
                         ),
                       )

                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // ========================= horizontal product list   ================================ //
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: suggestionItems.length,
                      itemBuilder: (ctx, i) {
                        return suggestedCard(
                            context: context,
                            image: suggestionItems[i]["image"],
                            title: suggestionItems[i]["title"],
                            size: suggestionItems[i]["size"],
                            subtitle: suggestionItems[i]["subtitle"],
                            actual_amount: suggestionItems[i]["actual_amount"],
                            discount_amount: suggestionItems[i]["discount_amount"],
                            discount_percent: suggestionItems[i]["discount_percent"],
                            qty: suggestionItems[i]["qty"],
                            sold_by: suggestionItems[i]["sold_by"]);
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // =====================        Donate           ================== //

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(padding: EdgeInsets.symmetric(horizontal: 10.w),child: Text("DONATE FOR COVID-19 RELIEF",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFF535766)),)),
                      SizedBox(height: 10.h,),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(activeColor: appThemeColor,value: true, onChanged: (val)
                                    {

                                    },),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text("Help India fight COVID-19",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  Text("Know More",style: TextStyle(color: appThemeColor,fontWeight: FontWeight.w600),)
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Wrap(
                                children: [
                                  donationAmountCard(text: "${rupee}10"),
                                  donationAmountCard(text: "${rupee}50"),
                                  donationAmountCard(text: "${rupee}100"),
                                  donationAmountCard(text: "Enter Amount"),
                                ],
                              ),
                            ],
                          )
                      ),

                    ],
                  ),

                  SizedBox(height: 15.h,),
                  

                  // =====================      Price Details           ================== //

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            children:  [
                              Text("PRICE DETAILS (0 item)",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(bottom: 8.h,top: 8.h),
                          child: Row(
                            children: [
                              Text("Total MRP"),
                              Spacer(),
                              Text("${rupee}${cartAmount(cartItem: cartItem,outerBoolSelected: isSelected)['totalMrp']}")
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(bottom: 8.h,top: 8.h),
                          child: Row(
                            children: [
                              Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w600),),
                              Spacer(),
                              Text("${rupee}${cartAmount(cartItem: cartItem,outerBoolSelected: isSelected)['totalAmount']}",style: TextStyle(fontWeight: FontWeight.w600),)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // =====================        bottom Tabs            ================== //
                  Image.network("https://assets.myntassets.com/f_webp,dpr_2,q_auto,c_limit,fl_progressive/assets/images/retaillabs/2020/6/24/11940eed-9b55-4171-9e59-dfb273b3f5961592993834502-1--1-.png"),
                  SizedBox(height: 15.h,),
                ],
              ),
            ),


            // =====================        App ThemeButton            ================== //
            placeOrderButton(onTap: () {}),
          ],
        ));
  }
  void updateState()
  {
    setState(() {});
  }

}
