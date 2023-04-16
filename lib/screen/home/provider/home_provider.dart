import 'package:flutter/material.dart';
import 'package:product_api/screen/home/modal/home_model.dart';
import 'package:product_api/utils/api_helper.dart';

class Homeprovider extends ChangeNotifier
{
  List<dynamic> product=[];
  Future<List> productapicall()
  async {
    Apihelper apihelper=Apihelper();
    List<dynamic> pmodal=await apihelper.productapi();
    product=pmodal;
    return product;
  }
  Future<void> postapicall(p_name,p_rate,p_offer,p_desc,p_cate,p_price)
  async {
    Apihelper apihelper=Apihelper();
    bool data=await apihelper.create(p_name,p_rate,p_offer,p_desc,p_cate,p_price);
    notifyListeners();
    if(data==true)
      {
        print("success");
      }
    else
      {
        print("fail");
      }
  }

}