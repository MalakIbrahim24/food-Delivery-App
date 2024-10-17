import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/pages/widgets/counter_widget.dart';
import 'package:food_delivery_app/views/pages/widgets/product_specs_item.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // new page so we start with scaffold
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.grey2,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (favProducts.contains(widget.product)) {
                    favProducts.remove(widget.product);
                  } else {
                    favProducts.add(widget.product);
                  }
                });
              },
              icon: Icon(
                favProducts.contains(widget.product)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.grey2),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    'assets/images/borgir.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(widget.product.category.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppColors.grey,
                                    )),
                          ],
                        ),
                        const CounterWidget(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //ListView.separated() can also be used ! but needs to get
                        // values from a list
                        ProductSpecsItem(title: 'Size', value: 'Large'),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                        ProductSpecsItem(title: 'Calories', value: '120 cal'),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                        ProductSpecsItem(title: 'Cooking', value: '10 mins'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${widget.product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text('Add to cart'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
