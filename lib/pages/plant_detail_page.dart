import 'package:flutter/material.dart';
import 'package:poudha/constants/colors.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:poudha/constants/icons.dart';

class PlantDetailPage extends StatelessWidget {
  const PlantDetailPage({super.key});

  String _getPlantEmoji(int health) {
    if (health >= 90) return '🌿';
    if (health >= 80) return '🌱';
    if (health >= 70) return '🍃';
    if (health >= 60) return '🥀';
    return '😢';
  }

  String _getPlantAdvice(int health, int moisture, int humidity, double temperature) {
    List<String> advice = [];
    
    if (moisture < 60) {
      advice.add("• Your plant needs more water. Consider increasing watering frequency.");
    }
    if (humidity < 65) {
      advice.add("• The air is too dry. Try using a humidifier or misting the leaves.");
    }
    if (temperature > 25) {
      advice.add("• Temperature is slightly high. Move to a cooler spot.");
    }
    if (health < 80) {
      advice.add("• General health needs attention. Check for signs of pests or disease.");
    }

    return advice.isEmpty 
        ? "Your plant is doing great! Keep up the good work! 🌟"
        : advice.join("\n\n");
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final plantName = args['plantName'] as String;
    final health = args['health'] as int;
    final humidity = args['humidity'] as int;
    final moisture = args['moisture'] as int;
    final temperature = args['temperature'] as double;

    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: AppColors.white,
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
          children: [
            // Plant Health Status Icon
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Icon(
                AppIcons.getHealthIcon(health),
                size: 120,
                color: _getHealthColor(health),
              ),
            ),
            
            // Plant Stats Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _DetailMetricCard(
                              icon: Icons.wb_sunny,
                              value: '${(health * 0.8).round()}%',
                              label: 'Sunlight',
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _DetailMetricCard(
                              icon: Icons.water_drop,
                              value: '$humidity%',
                              label: 'Air Humidity',
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _DetailMetricCard(
                              icon: Icons.thermostat,
                              value: '${temperature.toStringAsFixed(1)}°C',
                              label: 'Temperature',
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _DetailMetricCard(
                              icon: Icons.opacity,
                              value: '$moisture%',
                              label: 'Soil Moisture',
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // AI Suggestions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.tips_and_updates,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'AI Suggestions',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColors.darkGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _getPlantAdvice(health, moisture, humidity, temperature),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.mediumGreen,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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

class _DetailMetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _DetailMetricCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.darkGreen,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.mediumGreen,
                ),
          ),
        ],
      ),
    );
  }
} 