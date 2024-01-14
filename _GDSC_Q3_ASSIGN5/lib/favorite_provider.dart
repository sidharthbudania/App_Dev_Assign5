import 'package:assignment_5_3/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<product> _favorites=[];
  List<product> get favorites => _favorites;

  void toggleFavorite(product products) {
    if(_favorites.contains(products)){
      _favorites.remove(products);
    }
    else{
      _favorites.add(products);
    }

    notifyListeners();
  }

  bool isExist(product products) {
    final isExist = _favorites.contains(products);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context,{
      bool listen = true,
    }
  )
  {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}