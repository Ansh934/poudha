import 'package:flutter/material.dart';
import 'pages/root_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/home_page.dart';
import 'pages/plant_detail_page.dart';
import 'pages/create_plant_page.dart';
import 'constants/colors.dart';
import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poudha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.lightBackground,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: AppColors.darkGreen,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: AppColors.mediumGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: AppRoutes.root,
      routes: {
        AppRoutes.root: (context) => const RootPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignUpPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.plantDetail: (context) => const PlantDetailPage(),
        AppRoutes.createPlant: (context) => const CreatePlantPage(),
      },
    );
  }
}