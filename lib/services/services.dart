import 'dart:convert';

import 'package:api_crud/model/usermodel.dart';
import 'package:http/http.dart' as http;

getUser() async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  return UserModel.fromJson(responseData);
}

postData(Data model) async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(model.toJson()));
}

updataData({required Data model, required id}) async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  var response = await http.put(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(model.toJson()));
}

deleteData({required id}) async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  var response = await http.delete(
    url,
    headers: {"Content-Type": "application/json"},
  );
}
