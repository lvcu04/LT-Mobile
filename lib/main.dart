import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  void nextPage() {
    if (currentIndex < 6) {
      setState(() {
        currentIndex++;
      });
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab04_PageView01"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  buildPage(
                    color: Colors.red,
                    imagePath: 'assets/images/avatar-1.png',
                    title: 'Lê Văn Cừ',
                    subtitle: 'MSSS:2251120275',
                  ),
                  buildPage(
                    color: Colors.green,
                    imagePath: 'assets/images/avatar-2.png',
                    title: 'Võ Nhi Anh',
                    subtitle: 'MSSV:2251120267',
                  ),
                  buildPage(
                    color: Colors.blue,
                    imagePath: 'assets/images/avatar-3.png',
                    title: 'Nguyễn Phúc Đỉnh',
                    subtitle: 'MSSV:2251120286',
                  ),
                  buildPage(
                    color: Colors.greenAccent,
                    imagePath: 'assets/images/avatar-4.png',
                    title: 'Lê Hữu Thông',
                    subtitle: 'MSSV:2251120321',
                  ),
                  buildPage(
                    color: Colors.greenAccent,
                    imagePath: 'assets/images/avatar-5.jpg',
                    title: 'Nguyễn Tâm Bảo',
                    subtitle: 'MSSV:2251120270',
                  ),
                  buildPage(
                    color: Colors.greenAccent,
                    imagePath: 'assets/images/avatar-6.png',
                    title: 'Nguyễn Quốc Khánh',
                    subtitle: 'MSSV:2251120297',
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Prev
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: currentIndex > 0 ? prevPage : null,
                        child: Text(
                          "Prev",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                currentIndex > 0 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // SmoothPageIndicator
                  Expanded(
                    flex: 2, // Cho nhiều không gian hơn
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 6,
                        effect: WormEffect(
                          spacing: 12.0,
                          dotColor: Colors.purple.shade300,
                          activeDotColor: Colors.purple.shade900,
                        ),
                      ),
                    ),
                  ),

                  // Next
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: currentIndex < 6 ? nextPage : null,
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                currentIndex < 6 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
