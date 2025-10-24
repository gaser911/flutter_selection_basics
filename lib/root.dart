import 'package:basics/screens/image_selection.dart';
import 'package:basics/screens/single_selection.dart';
import 'package:basics/screens/multi_selection.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  final List<Widget> screens = const [
    SingleSelection(),
    ImageSelection(),
    MultiSelection()
  ];
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔙 Back button
            GestureDetector(
              onTap: () {
                if (selectedIndex > 0) {
                  setState(() {
                    selectedIndex--;
                    controller.jumpToPage(selectedIndex);
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == 0 ? Colors.grey.shade400 : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // 🔜 Next button
            GestureDetector(
              onTap: () {
                if (selectedIndex < screens.length - 1) {
                  setState(() {
                    selectedIndex++;
                    controller.jumpToPage(selectedIndex);
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: selectedIndex == screens.length - 1
                      ? Colors.grey.shade600
                      : Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Next Page",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
