import 'package:assignment_5_3/cart_details.dart';
import 'package:assignment_5_3/cart_provider.dart';
import 'package:assignment_5_3/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.products});
  final product products;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    body: Column(
      children: [
        const SizedBox(height: 36),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Image.asset(products.image ,fit: BoxFit.cover),
            ),
          ],
        ),
        const SizedBox(height: 36),
        Container(
          padding:  const EdgeInsets.all(20),
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '\Rs.' '${products.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 14),
              Text(
                products.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Text(
                    "Available colors",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    bottomSheet: BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height/10,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Text(
              '\$' '${products.price}',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(width: 300),
                ElevatedButton.icon(
                  onPressed: (){
                    provider.toggleProduct(products);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> const CartDetails()),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text("Add To Cart"),
                  )
          ],
        ),
      ),
    ),
    );
  }
}