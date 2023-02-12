import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/scaffold_with_navbar.dart';
import '../pages/search_page.dart';
import 'navigation_route.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: NavigationRoute.home.path,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          path: NavigationRoute.home.path,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: NavigationRoute.details.path,
              builder: (context, state) =>
                  DetailPage(label: NavigationRoute.home.title),
            )
          ],
        ),
        GoRoute(
          path: NavigationRoute.search.path,
          builder: (context, state) => const SearchPage(),
          routes: [
            GoRoute(
              path: NavigationRoute.details.path,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) =>
                  DetailPage(label: NavigationRoute.search.title),
            )
          ],
        ),
        GoRoute(
          path: NavigationRoute.profile.path,
          builder: (context, state) => const ProfilePage(),
          routes: [
            GoRoute(
              path: NavigationRoute.details.path,
              builder: (context, state) =>
                  DetailPage(label: NavigationRoute.profile.title),
            )
          ],
        ),
      ],
    )
  ],
);
