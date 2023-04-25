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
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<Homeprovider>(context,listen: false).productapicall();
  // }
  @override
  Widget build(BuildContext context) {
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Product API"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'second');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade400,
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1,color: Colors.black)
                  ),
                  child: ListTile(
                    title: Text("${hpfalse!.product[index].p_name}"),
                    subtitle: Text("${hpfalse!.product[index].p_rate}"),
                    trailing: Text("${hpfalse!.product[index].p_price}"),
                  ),
                ),
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