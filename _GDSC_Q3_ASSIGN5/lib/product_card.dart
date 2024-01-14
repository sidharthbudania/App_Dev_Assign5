import 'package:assignment_5_3/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'product.dart';
class productcard extends StatefulWidget {
  const productcard({super.key,required this.products});
  final product products;
  @override
  State<productcard> createState() => _productcardState();
}

class _productcardState extends State<productcard> {
  @override
  Widget build(BuildContext context) {

    final provider = FavoriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: ()=> provider.toggleFavorite(widget.products),
                child: Icon(
                  provider.isExist(widget.products) ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.products.image,
              fit: BoxFit.cover,

            ),
          ),
          Text(
            widget.products.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,

            ),

          ),
          Text(
            widget.products.category,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
          Text(
            '\Rs.' '${widget.products.price}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ],
      ),
    );
  }
}