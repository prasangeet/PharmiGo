import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPagesWidget extends StatefulWidget {
  const IntroPagesWidget ({super.key});
  @override
  State<IntroPagesWidget> createState() => _IntroPagesWidgetState();
}

class _IntroPagesWidgetState extends State<IntroPagesWidget> {

  final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, String>> pages = [
    {
      'imagePath' : 'assets/intro1.png',
      'title' : 'Buy medicines online',
      'description' : 'Choose and buy the necessary drugs without a visit to the pharmacy.'
    },
    {
      'imagePath' : 'assets/intro2.png',
      'title' : 'All in one place',
      'description' : 'Telemedicine, ordering medicines or homeopathic remedies - here is everything.'
    },
    {
      'imagePath' : 'assets/intro3.png',
      'title' : 'Fast delivery in 15 minutes',
      'description' : 'Deliver your medicines quickly. Couriers use protective equipment.'
    }
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index){
                  final page = pages[index];
                  return _buildPage (
                    imagePath: page['imagePath']!,
                    title: page['title']!,
                    description: page['description']!
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: SlideEffect(
                  spacing: 8,
                  radius: 8,
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Colors.teal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease,);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_pageController.page == 2) {
                        Navigator.pushReplacementNamed(context, '/loginintro');
                      }
                      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease,);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.teal),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildPage({
  required String imagePath,
  required String title,
  required String description,
}) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 314,
          height: 359,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Manrope',
        )
      ),
      const SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Sans',
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        )
      )
    ],
  );
}