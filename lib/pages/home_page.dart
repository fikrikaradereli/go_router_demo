import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/utils/navigation_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var path = '${NavigationRoute.home.path}/${NavigationRoute.details.path}';

    return Scaffold(
      appBar: AppBar(
        title: Text(NavigationRoute.home.title),
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
