import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _selectedFilter = 'Most Viewed';

  final List<Map<String, dynamic>> _healthCards = [
    {
      'title': 'Syphilis, 34M',
      'location': 'Tokyo, Japan',
      'imagePath': 'assets/images/mountain1.jpg',
      'isSolved': true,
    },
    {
      'title': 'Burns, 20F',
      'location': 'South, Alps',
      'imagePath': 'assets/images/mountain2.jpg',
      'isSolved': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredHealthCards {
    switch (_selectedFilter) {
      case 'Solved':
        return _healthCards.where((card) => card['isSolved']).toList();
      case 'Latest':
        return _healthCards.reversed.toList();
      case 'Most Viewed':
      default:
        return _healthCards;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi, David',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '👋',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const Text(
                        'Explore the world',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Doctors',
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Trending Health Matters section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending Health Matters',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Filter chips
              Row(
                children: [
                  FilterChip(
                    selected: _selectedFilter == 'Most Viewed',
                    label: const Text('Most Viewed'),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilter = 'Most Viewed';
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                      color: _selectedFilter == 'Most Viewed'
                          ? Colors.white
                          : Colors.grey.shade600,
                      fontWeight: _selectedFilter == 'Most Viewed'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    selected: _selectedFilter == 'Solved',
                    label: const Text('Solved'),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilter = 'Solved';
                      });
                    },
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                      color: _selectedFilter == 'Solved'
                          ? Colors.white
                          : Colors.grey.shade600,
                      fontWeight: _selectedFilter == 'Solved'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    selected: _selectedFilter == 'Latest',
                    label: const Text('Latest'),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilter = 'Latest';
                      });
                    },
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                      color: _selectedFilter == 'Latest'
                          ? Colors.white
                          : Colors.grey.shade600,
                      fontWeight: _selectedFilter == 'Latest'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Health cards
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _filteredHealthCards.map((card) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _buildHealthCard(
                        card['title'],
                        card['location'],
                        card['imagePath'],
                        card['isSolved'],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Bottom navigation bar
              BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.access_time),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'Saved',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Health Post widget builder
  Widget _buildHealthCard(
      String title, String location, String imagePath, bool isSolved) {
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
          // Gradient overlay
          Container(
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
          ),

          // Content
          Padding(
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
                    if (isSolved)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Solved',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Favorite button
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
