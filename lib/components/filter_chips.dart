import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FilterChipsSection extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const FilterChipsSection({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildFilterChip('Most Viewed', context),
        const SizedBox(width: 8),
        _buildFilterChip('Solved', context),
        const SizedBox(width: 8),
        _buildFilterChip('Latest', context),
      ],
    );
  }

  Widget _buildFilterChip(String label, BuildContext context) {
    return FilterChip(
      selected: selectedFilter == label,
      label: Text(label),
      onSelected: (bool selected) {
        onFilterSelected(label);
      },
      backgroundColor: selectedFilter == label
          ? AppColors.blue
          : AppColors.darkBlue.withOpacity(0.05),
      selectedColor: AppColors.blue,
      labelStyle: TextStyle(
        color: selectedFilter == label ? AppColors.white : AppColors.darkBlue,
        fontWeight:
            selectedFilter == label ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
