import 'package:assignment_5_3/details_screen.dart';
import 'package:assignment_5_3/my_product.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All products"),
              _buildProductCategory(index: 1, name: "Laptops"),
              _buildProductCategory(index: 2, name: "Phones"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isSelected==0 ? _buildAllProducts() : isSelected==1 ? _buildlaptops(): _buildmobile(), // Include _buildAllProducts here
          ),
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () {
          setState(() {
            isSelected = index;
          });
        },
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index
                ? const Color.fromARGB(255, 6, 98, 174)
                : Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 140,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: Myproduct.allproducts.length,
        itemBuilder: (context, index) {
          final allProducts = Myproduct.allproducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>DetailsScreen(products: allProducts)),
            ),
          child: productcard(products: allProducts));
        },
      );

  Widget _buildlaptops()=>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      ),
    scrollDirection: Axis.vertical,
    itemCount: Myproduct.Laptoplist.length,
    itemBuilder: (context, index) {
      final Laptoplist = Myproduct.Laptoplist[index];
      return GestureDetector(
        onTap: ()=>Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsScreen(products: Laptoplist)),
        ),
        
        child: productcard(products: Laptoplist));
    },
    );

    Widget _buildmobile()=>GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
        ),
      scrollDirection: Axis.vertical,
      itemCount: Myproduct.Mobileslist.length,
      itemBuilder: (context, index) {
        final Mobileslist =Myproduct.Mobileslist[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> DetailsScreen(products: Mobileslist)),
            
          ),
          
          child: productcard(products: Mobileslist));
      },
      );
}
