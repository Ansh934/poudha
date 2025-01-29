import 'package:flutter/material.dart';
import 'package:poudha/constants/colors.dart';
import 'package:poudha/constants/plant_species.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CreatePlantPage extends StatefulWidget {
  const CreatePlantPage({super.key});

  @override
  State<CreatePlantPage> createState() => _CreatePlantPageState();
}

class _CreatePlantPageState extends State<CreatePlantPage> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  final _descriptionController = TextEditingController();
  PlantSpecies? _selectedSpecies;

  @override
  void dispose() {
    _nicknameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Plant'),
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plant Details',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.darkGreen,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 24),
                      DropdownButtonFormField<PlantSpecies>(
                        value: _selectedSpecies,
                        decoration: InputDecoration(
                          labelText: 'Plant Species',
                          prefixIcon: const Icon(LucideIcons.trees),
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: PlantSpeciesData.species.map((species) {
                          return DropdownMenuItem<PlantSpecies>(
                            value: species,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(species.commonName),
                                Text(
                                  species.scientificName,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontStyle: FontStyle.italic,
                                        color: AppColors.mediumGreen,
                                      ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (PlantSpecies? newValue) {
                          setState(() {
                            _selectedSpecies = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a plant species';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nicknameController,
                        decoration: InputDecoration(
                          labelText: 'Nickname (Optional)',
                          hintText: 'Give your plant a nickname',
                          prefixIcon: const Icon(LucideIcons.heart),
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Description (Optional)',
                          hintText: 'Add notes about your plant',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 48),
                            child: Icon(LucideIcons.text),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Handle plant creation
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Add Plant'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 