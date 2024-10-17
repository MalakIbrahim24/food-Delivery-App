import 'package:food_delivery_app/models/category.dart';

class Product {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final Category category;
  final bool isFavorite;
  Product({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.description =
        'lorem ipsum is simply dumy text of the printing and typesetting industry lorem ipsum is simply dumy text of the printing and typesetting industry lorem ipsum is simply dumy text of the printing and typesetting industry lorem ipsum is simply dumy text of the printing and typesetting industry lorem ipsum is simply dumy text of the printing and typesetting industry',
    required this.price,
    required this.category,
    this.isFavorite = false,
  });
}

List<Product> favProducts = [];

List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'Beef Burger',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 6.99,
    category: dummyCategories[0],
  ),
  Product(
    id: '2',
    name: 'Chicken Burger',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 5.99,
    category: dummyCategories[0],
  ),
  Product(
    id: '3',
    name: 'Cheese Burger',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 7.99,
    category: dummyCategories[0],
  ),
  Product(
    id: '4',
    name: 'Chicken Pizza',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 9.99,
    category: dummyCategories[2],
  ),
  Product(
    id: '5',
    name: 'Margereta Pizza',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 8.99,
    category: dummyCategories[2],
  ),
  Product(
    id: '6',
    name: 'Lasagna',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 8.99,
    category: dummyCategories[1],
  ),
  Product(
    id: '7',
    name: 'Koshary',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 6.99,
    category: dummyCategories[1],
  ),
  Product(
    id: '8',
    name: 'Fried Chicken',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 7.99,
    category: dummyCategories[3],
  ),
  Product(
    id: '9',
    name: 'Grilled Chicken',
    imgUrl:
        'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
    price: 9.99,
    category: dummyCategories[3],
  ),
];
