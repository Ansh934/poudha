import 'package:flutter/material.dart';
import 'package:poudha/constants/colors.dart';
import 'package:poudha/constants/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: AppColors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text('My Plants'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.root,
                  (route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: AppColors.mediumGreen),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.primary),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: AppColors.primary),
              title: const Text('Add New Plant'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to add plant page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to settings page
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBackground,
              AppColors.mediumBackground,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _PlantMetricsCard(
              plantName: 'Snake Plant',
              health: 85,
              humidity: 65,
              moisture: 70,
              temperature: 24,
            ),
            const SizedBox(height: 16),
            const _PlantMetricsCard(
              plantName: 'Peace Lily',
              health: 92,
              humidity: 75,
              moisture: 80,
              temperature: 22,
            ),
            const SizedBox(height: 16),
            const _PlantMetricsCard(
              plantName: 'Money Plant',
              health: 78,
              humidity: 60,
              moisture: 55,
              temperature: 23,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add plant page
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}

class _PlantMetricsCard extends StatelessWidget {
  final String plantName;
  final int health;
  final int humidity;
  final int moisture;
  final double temperature;

  const _PlantMetricsCard({
    required this.plantName,
    required this.health,
    required this.humidity,
    required this.moisture,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.plantDetail,
          arguments: {
            'plantName': plantName,
            'health': health,
            'humidity': humidity,
            'moisture': moisture,
            'temperature': temperature,
          },
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plantName,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.darkGreen,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 16,
                              color: _getHealthColor(health),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Health: $health%',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: _getHealthColor(health),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.eco,
                    color: health > 80 ? AppColors.primary : AppColors.secondary,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MetricColumn(
                    icon: Icons.wb_sunny,
                    value: '${(health * 0.8).round()}%',
                    label: 'Sunlight',
                    color: AppColors.primary,
                  ),
                  _MetricColumn(
                    icon: Icons.water_drop,
                    value: '$humidity%',
                    label: 'Air Humidity',
                    color: AppColors.primary,
                  ),
                  _MetricColumn(
                    icon: Icons.thermostat,
                    value: '${temperature.toStringAsFixed(1)}°C',
                    label: 'Temperature',
                    color: AppColors.primary,
                  ),
                  _MetricColumn(
                    icon: Icons.opacity,
                    value: '$moisture%',
                    label: 'Soil Moisture',
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getHealthColor(int health) {
    if (health >= 80) return AppColors.primary;
    if (health >= 60) return AppColors.secondary;
    return AppColors.orange;
  }
}

class _MetricColumn extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _MetricColumn({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGreen,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.mediumGreen,
              ),
        ),
      ],
    );
  }
} 