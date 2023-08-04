import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Dynamic());
  }
}

class Dynamic extends StatefulWidget {
  const Dynamic({Key? key}) : super(key: key);

  @override
  State<Dynamic> createState() => _DynamicState();
}

class _DynamicState extends State<Dynamic> {
  final List<String> _items = ['item 1', 'item 2', 'itme 3', 'item 4', 'item 5'];
  final List<String> _cartItems = [];

  void addItemToCart(String item) {
    setState(() {
      _cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Matierial App'),
          // actions: [
          //   PopupMenuButton<String>(itemBuilder: (context) => [
          //     const PopupMenuItem(value: 'First', child: Text('First')),
          //     const PopupMenuItem(value:'Seconst', child: Text('Second')),
          //     const PopupMenuItem(value:'Third', child: Text('Third'))
          //   ])
          // ],

          actions: [
            DropdownButton(
                items: const [
                  DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'Option 3', child: Text('Option 3'))
                ],
                onChanged: (newValue) => {},
                hint: const Text(
                  'Visit US',
                  style: TextStyle(color: Colors.white),
                )),
            PopupMenuButton<String>(
                itemBuilder: (context) => [
                      const PopupMenuItem(value: 'First', child: Text('First')),
                      const PopupMenuItem(
                          value: 'Seconst', child: Text('Second')),
                      const PopupMenuItem(value: 'Third', child: Text('Third'))
                    ]),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search action
                print('Search action pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings action
                print('Settings action pressed');
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              final isInCart = _cartItems.contains(item);

              return ListTile(
                title: Text(item),
                trailing: isInCart  ? Icon(Icons.check_circle , color:Colors.green)
                                    : IconButton(icon:Icon(Icons.add_circle)  , 
                                    onPressed:() => addItemToCart(item)),
              );


            }));
  }
}
