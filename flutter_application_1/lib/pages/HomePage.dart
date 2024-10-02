import 'package:flutter/material.dart';
import 'package:flutter_application_1/dummy_menu.dart';
import 'MenudetailPage.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String? nickname;
  const HomePage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selamat Datang! $username"),
            const Text("Ini adalah halaman Home"),
            if (nickname != null) Text("Hai $nickname"),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: foodMenuList.length,
                itemBuilder: (context, index) {
                  final FoodMenu menu = foodMenuList[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuDetailPage(
                            name: menu.name,
                            category: menu.category,
                            description: menu.description,
                            ingredients: menu.ingredients,
                            cookingTime: menu.cookingTime,
                            price: menu.price,
                            imageUrls: menu.imageUrls,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text(menu.name),
                          Image.network(menu.imageUrls[0]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
