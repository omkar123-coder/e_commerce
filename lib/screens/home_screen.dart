import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CategoryModel> futureCategory;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiService.fetchProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
