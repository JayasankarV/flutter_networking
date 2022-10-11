import 'package:flutter/material.dart';

import 'ui/gallery_home_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      // Column is a vertical, linear layout.
        appBar: MyAppBar(
          title: Text(
            'Home',
            style: Theme.of(context) //
                .primaryTextTheme
                .headline6,
          ),
        ),
      body: Center(
            child: TextButton(
                onPressed: () {
                  showGallery(context);
                },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, elevation: 2,
                  backgroundColor: Colors.blue),
                child: const Text('View Gallery'),
            ),
          ),
      // Column is a vertical, linear layout.
    );
  }

  void showGallery(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GalleryHomeScreen()));
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}