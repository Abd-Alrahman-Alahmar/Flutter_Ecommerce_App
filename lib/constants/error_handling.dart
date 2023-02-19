import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_8/constants/utilis.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  //to display snackbar we need context
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)['msg']);
    break;
    case 500:
    showSnackBar(context, jsonDecode(response.body)['error']);
    break;
    default:
    showSnackBar(context, jsonDecode(response.body));
  }
}