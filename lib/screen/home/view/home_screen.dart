import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_api/screen/home/modal/home_model.dart';
import 'package:product_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  List<ProductModel> Alldata = [];
  Homeprovider? hpfalse;
  Homeprovider? hptrue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Homeprovider>(context, listen: false).productapicall();
  }

  Widget build(BuildContext context) {
    hpfalse = Provider.of<Homeprovider>(context, listen: false);
    hptrue = Provider.of<Homeprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Product API"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      label: Text("Name"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtrate,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),label: Text("Rate"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),label: Text("Price"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtcate,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),label: Text("Cate"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtdesc,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),label: Text("Desc"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtoffer,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),label: Text("Offer"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = txtname.text;
                    String rate = txtrate.text;
                    String category = txtcate.text;
                    String description = txtdesc.text;
                    String price = txtprice.text;
                    String offer = txtoffer.text;
                    ProductModel p1 = ProductModel(
                        p_category: category,
                        p_desc: description,
                        p_name: name,
                        p_offer: offer,
                        p_price: price,
                        p_rate: rate);
                    Alldata.add(p1);
                    hpfalse!.postapicall(
                        name, price, description, category, rate, offer);
                  },
                  child: Text("submit"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
