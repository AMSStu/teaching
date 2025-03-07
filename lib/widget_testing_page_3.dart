// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   final List<Item> _items = [
//     Item(name: 'Apple', price: 1.0),
//     Item(name: 'Banana', price: 0.5),
//     Item(name: 'Orange', price: 0.75),
//     Item(name: 'Grapes', price: 2.0),
//   ];
//
//   final List<Item> _cart = [];
//
//   void _toggleCart(Item item) {
//     setState(() {
//       if (_cart.contains(item)) {
//         _cart.remove(item);
//       } else {
//         _cart.add(item);
//       }
//     });
//   }
//
//   void _onCartPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ShowCartPage(cart: _cart),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shop'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: _onCartPage,
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: _items.length,
//         itemBuilder: (context, index) {
//           final item = _items[index];
//           return ListTile(
//             title: Text(item.name),
//             subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//             trailing: IconButton(
//               icon: Icon(
//                 _cart.contains(item) ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//                 color: _cart.contains(item) ? Colors.red : Colors.green,
//               ),
//               onPressed: () => _toggleCart(item),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ShowCartPage extends StatelessWidget {
//   final List<Item> cart;
//
//   ShowCartPage({required this.cart});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final item = cart[index];
//                 return ListTile(
//                   title: Text(item.name),
//                   subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Total: \$${_calculateTotal(cart).toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Total Items: ${cart.length}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   double _calculateTotal(List<Item> cart) {
//     double total = 0.0;
//     for (var item in cart) {
//       total += item.price;
//     }
//     return total;
//   }
// }
//
// class Item {
//   final String name;
//   final double price;
//
//   Item({required this.name, required this.price});
// }