import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detailpage.dart';
import 'package:flutter_application_1/widgets/home_widgets/ItemImage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import '../../models/items.dart';
import '../../pages/home_page.dart';

class ModelList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Model.items?.length,
      itemBuilder: (context, index) {
        final catalog = Model.getByPos(index);
        return InkWell(
          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog))),
          child: catalogItem(catalog: catalog));
      },
    );
  }
}
class catalogItem extends StatelessWidget {
  final Item? catalog;

  const catalogItem({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog!.id.toString()),
          child: ItemImage(image: catalog!.image)),
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            catalog!.name.text.xl.color(context.theme.accentColor).bold.make(),
            catalog!.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog!.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: (() {}), 
                  style: ButtonStyle(
                    // ignore: deprecated_member_use
                    backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                    shape: MaterialStateProperty.all(
                      StadiumBorder()
                    )
                  ),
                  child: "Add to Cart".text.make()
                  )
              ],
            ).pOnly(right: 8.0)

          ],
        )
        )
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
