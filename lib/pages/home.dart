import 'package:flutter/material.dart';
import '../components/class_card.dart';
import '../components/event_card.dart';
import '../components/bottom_nav_bar.dart';
import '../constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Erica Hawkins',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        Text(
                          'Patient',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.darkBlue.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: AppColors.darkBlue,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: AppColors.darkBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.darkBlue.withOpacity(0.05),
                  ),
                ),
                const SizedBox(height: 24),

                // Next class section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const ClassCard(
                  subject: 'Syphilis',
                  time: 'Today, 08:15am',
                  teacherName: 'Dr. John Doe',
                  hasHomework: true,
                ),
                const SizedBox(height: 24),

                // Events section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Vertical scrolling events list
                Column(
                  children: [
                    EventCard(
                      title: 'Cramps',
                      date: '26 Apr',
                      time: '6:30pm',
                      imagePath: 'assets/images/profile.jpg',
                      backgroundColor: AppColors.blue.withOpacity(0.1),
                    ),
                    const SizedBox(height: 12),
                    EventCard(
                      title: 'Burns and Scalds',
                      date: '2 May',
                      time: '5:40pm',
                      imagePath: 'assets/images/profile.jpg',
                      backgroundColor: AppColors.lime.withOpacity(0.1),
                    ),
                    const SizedBox(height: 12),
                    EventCard(
                      title: 'erectlie dysfunction',
                      date: '3 May',
                      time: '1:30pm',
                      imagePath: 'assets/images/profile.jpg',
                      backgroundColor: AppColors.darkBlue.withOpacity(0.05),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
