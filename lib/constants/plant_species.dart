class PlantSpecies {
  final String commonName;
  final String scientificName;

  const PlantSpecies({
    required this.commonName,
    required this.scientificName,
  });
}

class PlantSpeciesData {
  static const List<PlantSpecies> species = [
    PlantSpecies(
      commonName: 'Snake Plant',
      scientificName: 'Sansevieria trifasciata',
    ),
    PlantSpecies(
      commonName: 'Peace Lily',
      scientificName: 'Spathiphyllum wallisii',
    ),
    PlantSpecies(
      commonName: 'Spider Plant',
      scientificName: 'Chlorophytum comosum',
    ),
    PlantSpecies(
      commonName: 'Money Plant',
      scientificName: 'Epipremnum aureum',
    ),
    PlantSpecies(
      commonName: 'Aloe Vera',
      scientificName: 'Aloe barbadensis miller',
    ),
    PlantSpecies(
      commonName: 'ZZ Plant',
      scientificName: 'Zamioculcas zamiifolia',
    ),
  ];
} 