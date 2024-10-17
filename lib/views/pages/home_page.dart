import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/pages/product_details_page.dart';
import 'package:food_delivery_app/views/pages/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<Product> filteredProducts;
  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  @override
  Widget build(BuildContext context) {
    // to know phone is portrait or landscape
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // clip rounded rectangular
            ClipRRect(
              // to help make image curvy, containers won't work
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/delicious-food-banner-template-design-cd3994e39458960f4f33e73b8c60edb9_screen.jpg'),
            ),

            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Find your food!',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 17,
              child: ListView.builder(
                itemCount: dummyCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dummyCategory = dummyCategories[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        //unselect the selected category
                        if (selectedCategoryId != null &&
                            selectedCategoryId == dummyCategory.id) {
                          selectedCategoryId = null;
                          filteredProducts = dummyProducts;
                        } else {
                          selectedCategoryId = dummyCategory.id;

                          filteredProducts = dummyProducts
                              .where((product) =>
                                  product.category.id == selectedCategoryId)
                              .toList();
                        }
                      });
                    },
                    child: Card(
                      color: selectedCategoryId == dummyCategory.id
                          ? AppColors.primary
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              dummyCategory.imgUrl,
                              width: 50,
                              color: selectedCategoryId == dummyCategory.id
                                  ? Colors.white
                                  : null,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dummyCategory.title,
                              style: Theme.of(
                                      context) // of context here sees the tree and accesses the theme file in the main file
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color:
                                        selectedCategoryId == dummyCategory.id
                                            ? Colors.white
                                            : null,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            if (filteredProducts.isNotEmpty)
              GridView.builder(
                itemCount: filteredProducts.length,
                shrinkWrap: true, //finit height to grid view
                physics:
                    const NeverScrollableScrollPhysics(), // to make scrolling with column not grid alone
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final dummyProduct = filteredProducts[index];
                  return InkWell(
                      // context always knows info we don't know, knows wedget tree, knows parent and its children, how to move in between
                      onTap: () => Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsPage(
                                product: dummyProduct,
                              ), // it should be(context) but we put _ cuz it's not as important
                              // builder takes anonymous function takes context as parameter and returns widget
                            ),
                          ) // then is used after coming back from what we pressed to refresh the page
                          .then((value) => setState(
                              () {})), // to navigate another page, context knows widget tree, which is all elements in the tree, elements under,above, after, before.
                      child: ProductItem(
                        product: dummyProduct,
                      ));
                },
              ),
            if (filteredProducts.isEmpty)
              const Center(
                child: Text('No products found'),
              )
          ],
        ),
      ),
    );
  }
}
