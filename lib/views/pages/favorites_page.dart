import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/pages/product_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    if (favProducts.isEmpty) {
      return const Center(
        child: Text('No Favorite Products!'),
      );
    }
    return ListView.builder(
      itemCount: favProducts.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: favProducts[index],
                          ),
                        ),
                      )
                      .then((value) => setState(() {}));
                },
                leading: Image.network(
                  favProducts[index].imgUrl,
                  height: 100,
                  width: 70,
                  fit: BoxFit.fill,
                ),
                title: Text(favProducts[index].name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                subtitle: Text(
                  '${favProducts[index].category.title} - \$${favProducts[index].price}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      favProducts.remove(favProducts[index]);
                    });
                  },
                  icon: const Icon(Icons.favorite),
                  color: AppColors.primary,
                )),
          ),
        );
      },
    );
  }
}
