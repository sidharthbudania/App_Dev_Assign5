import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  final List<product> _cart=[];
  List<product> get cart => _cart;

  void toggleProduct(product products){
    if(_cart.contains(products))
    {
      for(product element in _cart)
      {
        element.quantity++;
      }
    }
      else{
        _cart.add(products);
      }
    
    notifyListeners();
    }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  getTotalPrice(){
    double total=0.0;
    for (product element in _cart) {
      total += element.price*element.quantity;
    }
    return total;
  }

    static CartProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }

  }

