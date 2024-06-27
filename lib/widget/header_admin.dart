import 'package:flutter/material.dart';

class HeaderAdmin extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff134f5c),
      title: const Text('Catalog', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle the search action here
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Handle the logout action here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
