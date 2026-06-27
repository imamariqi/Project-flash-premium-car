import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/storage/local_storage.dart';
import 'core/storage/token_storage.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/data/services/auth_service.dart';
import 'features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'features/cars/data/repositories/car_repository.dart';
import 'features/cars/data/services/car_service.dart';
import 'features/cars/presentation/viewmodels/car_viewmodel.dart';
import 'features/cart/presentation/viewmodels/cart_viewmodel.dart';
import 'features/checkout/presentation/viewmodels/checkout_viewmodel.dart';
import 'features/orders/presentation/viewmodels/order_viewmodel.dart';
import 'features/profile/presentation/viewmodels/profile_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<LocalStorage>(create: (_) => LocalStorage()),
        Provider<TokenStorage>(
          create: (context) => TokenStorage(context.read<LocalStorage>()),
        ),
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<AuthRepository>(
          create: (context) => AuthRepository(
            service: context.read<AuthService>(),
            tokenStorage: context.read<TokenStorage>(),
          ),
        ),
        Provider<CarService>(create: (_) => CarService()),
        Provider<CarRepository>(
          create: (context) => CarRepository(context.read<CarService>()),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(context.read<AuthRepository>()),
        ),
        ChangeNotifierProvider<CarViewModel>(
          create: (context) => CarViewModel(context.read<CarRepository>()),
        ),
        ChangeNotifierProvider<CartViewModel>(
          create: (_) => CartViewModel(),
        ),
        ChangeNotifierProvider<CheckoutViewModel>(
          create: (_) => CheckoutViewModel(),
        ),
        ChangeNotifierProvider<OrderViewModel>(
          create: (_) => OrderViewModel(),
        ),
        ChangeNotifierProvider<ProfileViewModel>(
          create: (_) => ProfileViewModel(),
        ),
      ],
      child: const FlashPremiumCarApp(),
    ),
  );
}
