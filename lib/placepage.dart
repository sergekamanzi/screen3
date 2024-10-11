import 'package:flutter/material.dart';

class PlacesPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  PlacesPage({required this.onThemeChanged});

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  int _currentIndex = 1; // Set default to the places page
  bool isDarkTheme = false; // Default to light theme
  List<bool> likedPlaces = []; // List to track liked places

  @override
  void initState() {
    super.initState();
    // Initialize the likedPlaces list with false for each place
    likedPlaces = List<bool>.filled(25, false); // Adjust 25 based on total number of places
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo3.png', // Path to your logo image
          width: 100,
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF007BFF),
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Places to Visit by Category',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF04B177),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Conventions Category
                  buildCategory('Conventions', [
                    buildPlace(0, 'assets/images/house1.jpg', 'Conversion center', textColor, 'Kigali Convention Centre, officially launched in July 2016.'),
                    buildPlace(1, 'assets/images/house2.jpg', 'Intare Conference', textColor, 'Intare Conference Arena sits in Kigali the center of international.'),
                    buildPlace(2, 'assets/images/house3.jpg', 'BkArena House', textColor, 'BK Arena is a state of the art world class East Africas.'),
                  ], textColor),

                  // Hotels Category
                  buildCategory('Hotels', [
                    buildPlace(3, 'assets/images/hotel1.jpg', 'Raddison Hotel', textColor, 'Our Kigali hotels 291 rooms and suites offer private balconies and free high-speed Wi-Fi. '),
                    buildPlace(4, 'assets/images/hotel2.jpg', 'Mariott Hotel', textColor, 'Marriott Bonvoy® Offers You Endless Experiences and World-Class Rewards. Start Exploring. '),
                    buildPlace(5, 'assets/images/hotel3.jpg', 'Ubumwe Resort', textColor, 'Ubumwe Grande Hotel has easy access from different parts of the city. Spacious Suites.'),
                    buildPlace(6, 'assets/images/hotel4.jpg', 'Serena Hotel', textColor, 'Kigali Serena Hotel. Book a 5-star hotel in the heart of Kigali, Rwanda, Elegant accommodation.'),
                    buildPlace(7, 'assets/images/hotel5.jpg', 'Mantis Kivu Bay', textColor, 'A unique voyage with Mantis Kivu Queen uBuranga, a distinctive all-inclusive luxury expedition vessel.'),
                  ], textColor),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigation logic can be added here if needed
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/discover.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/more.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget buildCategory(String categoryName, List<Widget> places, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF006E52),
          ),
        ),
        SizedBox(height: 10),
        Column(children: places),
        SizedBox(height: 30),
      ],
    );
  }

  Widget buildPlace(int index, String imagePath, String title, Color textColor, String description) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 10),
                  Text(description),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  likedPlaces[index] = !likedPlaces[index]; // Toggle liked state
                });
              },
              child: Image.asset(
                likedPlaces[index]
                    ? 'assets/images/red.png' // Path to filled heart image
                    : 'assets/images/heart.png', // Path to empty heart image
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
