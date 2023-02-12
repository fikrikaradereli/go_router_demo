enum NavigationRoute { home, search, profile, details }

extension NavigationRouteExtension on NavigationRoute {
  String get path {
    switch (this) {
      case NavigationRoute.home:
      case NavigationRoute.search:
      case NavigationRoute.profile:
        return '/$name';
      case NavigationRoute.details:
        return name;
      default:
        return '/${NavigationRoute.home.name}';
    }
  }

  String get title => name.capitalize();
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
