import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/navigation_route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var path =
        '${NavigationRoute.profile.path}/${NavigationRoute.details.path}';

    return Scaffold(
      appBar: AppBar(
        title: Text(NavigationRoute.profile.title),
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
