import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_8/constants/error_handling.dart';
import 'package:flutter_8/constants/global_variable.dart';
import 'package:flutter_8/constants/utilis.dart';
import 'package:flutter_8/models/product.dart';
import 'package:flutter_8/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context, 
    required String category}) async
    {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products?category=$category'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
  //jsonencode convert object to string
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for(int i=0; i<jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(jsonDecode(res.body)[i],),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList; 
    }

    Future<Product> fetchDealofDay({
    required BuildContext context, 
    }) async
    {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      name:'',
      description: '',
      quantity: 0,
      images: [],
      category: '',
      price: 0
    );
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/deal-of-day'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
  //jsonencode convert object to string
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          product = Product.fromJson(res.body);
         
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product; 
    }
}