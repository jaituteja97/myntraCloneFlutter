import 'package:flutter/material.dart';

List selectedItem = [false, false];

Map cartAmount({bool outerBoolSelected,List cartItem,})
{
  if(outerBoolSelected)
    {
      int totalAmount = 0;
      int totalMrp = 0;
      for(int i = 0;i<=cartItem.length -1;i++)
        {
            totalAmount = totalAmount + int.parse(cartItem[i]["discount_amount"]);
            totalMrp = totalMrp + int.parse(cartItem[i]["actual_amount"]);
        }
      return {"totalAmount" : totalAmount, "totalMrp" : totalMrp};
    }



  else
    {
      return {"totalAmount" : 0, "totalMrp" : 0};;
    }


}

