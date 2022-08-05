import 'package:flutter/material.dart';

import '../screens/recycle_bin_screen.dart';
import '../screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(
           builder: (_) => const RecycleBinScreen(),
        );

      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) =>TabsScreen(),
        );



      default:
        return null;
    }
  }
}
