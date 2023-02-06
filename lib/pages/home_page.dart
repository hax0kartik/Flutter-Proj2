import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/models/items.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/item_widget.dart';
import '../widgets/home_widgets/KartHeader.dart';
import '../widgets/home_widgets/ModelList.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final itJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(itJson);
    var productsData = decodeData["products"];
    Model.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: FloatingActionButton(
        onPressed: ()=>
        Navigator.pushNamed(context, MyRoutes.cartRoute),
        // ignore: deprecated_member_use
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KartHeader(),
                if (Model.items != null && Model.items!.isNotEmpty)
                  ModelList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
        drawer: MyDrawer(),
        
        );
        
  }
}
