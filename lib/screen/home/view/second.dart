import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Homeprovider? hptrue;
  Homeprovider? hpfalse;
  @override
  void initState() {
    super.initState();
    Provider.of<Homeprovider>(context,listen: false).productapicall();
  }
  @override
  Widget build(BuildContext context) {
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Product API"),
      ),
      body: FutureBuilder(
        future: hpfalse!.productapicall(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
          {
            print("${snapshot.hasError}");
          }
          else if(snapshot.hasData)
          {
            List<dynamic>? productModel = snapshot.data;
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("${hpfalse!.product[index].p_name}"),
              );

            },itemCount: productModel!.length,);
          }
          return Center(child: CircularProgressIndicator());
        },

      ),

    ),
    );
  }
}