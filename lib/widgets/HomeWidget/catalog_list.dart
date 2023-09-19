import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:project1/widgets/HomeWidget/catalog_image.dart';
import 'package:project1/widgets/themes.dart';
import 'package:project1/pages/home_detail_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index)
      {final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailsPage(catalog: catalog))),
          child: CatalogItem(catalog:catalog));
      }
      );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key , required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero
          (tag: Key(catalog.id.toString()),
            child: CataloImage(image:catalog.image)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             catalog.name.text.xl.color(Mytheme.darkbluishColor).bold.make(),
             catalog.desc.text.textStyle(context.captionStyle).make(),
             ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Mytheme.darkbluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                  onPressed: (){}, child: Text('Buy'))
              ],
             )
            ],
          ))
        ]
         
      )

    ).white.roundedLg.square(150).make().py16();
  }
}