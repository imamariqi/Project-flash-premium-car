import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';
import 'shared/theme/app_theme.dart';

class FlashPremiumCarApp extends StatelessWidget {
  const FlashPremiumCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Premium Car',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: RouteNames.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
