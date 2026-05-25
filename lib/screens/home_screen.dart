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
      appBar: AppBar(
        title: Text('E-Commerce Screen'),
      ),
      body: Center(
        child: FutureBuilder(
            future: ApiService.fetchProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                final products = snapshot.data!;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ListTile(
                      title: Text(products[index].title),
                        subtitle: Text(products[index].description),
                  );
                }
              );
            }
          }
        ),
      ),
    );
  } 
}
