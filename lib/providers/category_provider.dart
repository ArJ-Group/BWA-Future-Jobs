import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/categories'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<CategoryModel> categoriesModel = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categoriesModel.add(CategoryModel.fromJson(category));
        });

        return categoriesModel;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
