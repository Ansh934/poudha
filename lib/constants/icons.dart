import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppIcons {
  static const IconData palmTree = LucideIcons.palmtree;
  static const IconData smile = LucideIcons.smile;
  static const IconData meh = LucideIcons.meh;
  // static const IconData laugh = LucideIcons.laugh;
  static const IconData frown = LucideIcons.frown;
  // static const IconData annoyed = LucideIcons.annoyed;
  static const IconData angry = LucideIcons.angry;

  static IconData getHealthIcon(int health) {
    if (health >= 80) return LucideIcons.smile;
    if (health >= 60) return LucideIcons.meh;
    if (health >= 40) return LucideIcons.frown;
    return LucideIcons.angry;
  }
}