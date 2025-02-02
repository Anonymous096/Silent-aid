import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HealthCard extends StatelessWidget {
  final String title;
  final String location;
  final String imagePath;
  final bool isSolved;

  const HealthCard({
    super.key,
    required this.title,
    required this.location,
    required this.imagePath,
    required this.isSolved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          _buildGradientOverlay(),
          _buildContent(),
          _buildFavoriteButton(),
        ],
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (isSolved) _buildSolvedBadge(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSolvedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.lime.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: AppColors.lime,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            'Solved',
            style: TextStyle(
              color: AppColors.lime,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: IconButton(
          icon: Icon(
            Icons.favorite_border,
            size: 20,
            color: AppColors.blue,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
