import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_8/constants/error_handling.dart';
import 'package:flutter_8/constants/global_variable.dart';
import 'package:flutter_8/constants/utilis.dart';
import 'package:flutter_8/models/product.dart';
import 'package:flutter_8/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<Product>> fetchSearchedProduct({
    required BuildContext context, 
    required String searchQuery}) async
    {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      //cant add body to get method so we add it in the url
      http.Response res = await http.get(
        Uri.parse('$uri/api/products/search/$searchQuery'),
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
}