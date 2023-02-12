import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/navigation_route.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var path = '${NavigationRoute.search.path}/${NavigationRoute.details.path}';

    return Scaffold(
      appBar: AppBar(
        title: Text(NavigationRoute.search.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.go(path),
          child: Text(path),
        ),
      ),
    );
  }
}
