import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/screen/home/modal/home_model.dart';
class Apihelper
{
  Future<List> productapi()
  async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/products.php";
    Uri uri=Uri.parse(link);
    var response=await http.get(uri);
    var json=jsonDecode(response.body);
    List<dynamic> productModel =
    json.map((e) => ProductModel().ProductFromJson(e)).toList();

    return productModel;

  }
  Future<bool> create(String p1,String p2,String p3,String p4,String p5,String p6)
  async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";
    Uri uri =Uri.parse(link);
    var result=await http.post(uri,body: {
      "p_name":p1,
      "p_rate":p2,
      "p_desc":p3,
      "p_cate":p4,
      "p_offer":p5,
      "p_price":p6,
    },);
    if(result.statusCode==200)
      {
        return true;
      }
    return false;

  }

}