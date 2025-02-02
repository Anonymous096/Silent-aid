import 'package:flutter/material.dart';
import '../constants/colors.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String imagePath;
  final Color backgroundColor;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$date, $time',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkBlue.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColors.blue,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
