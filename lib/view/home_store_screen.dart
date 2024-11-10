import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../model/product_model.dart';

class HomeStoreScreen extends StatefulWidget {
  const HomeStoreScreen({super.key});

  @override
  State<HomeStoreScreen> createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  List<ProductModel> listProducts = [];
  void getData() async {
    await ProductController().getProduct().then((value) {
      setState(() {
        listProducts = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        //  physics: NeverScrollableScrollPhysics(),
        itemCount: listProducts.length, //listProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 2,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
                onTap: () {
                  // Get.to(() => DetailProductScreen(
                  //       product: listProducts[index],
                  //     ));
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: '${listProducts[index].id}',
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        listProducts[index].image.toString()))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          listProducts[index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${listProducts[index].price}',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'view : ${listProducts[index].rating!.count}',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
