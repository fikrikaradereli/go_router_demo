import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/navigation_route.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home), label: NavigationRoute.home.title),
          NavigationDestination(
              icon: const Icon(Icons.search),
              label: NavigationRoute.search.title),
          NavigationDestination(
              icon: const Icon(Icons.person),
              label: NavigationRoute.profile.title),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(NavigationRoute.home.path)) {
      return 0;
    } else if (location.startsWith(NavigationRoute.search.path)) {
      return 1;
    } else if (location.startsWith(NavigationRoute.profile.path)) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(NavigationRoute.home.path);
        break;
      case 1:
        context.go(NavigationRoute.search.path);
        break;
      case 2:
        context.go(NavigationRoute.profile.path);
        break;
    }
  }
}
