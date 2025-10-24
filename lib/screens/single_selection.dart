import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelection();
}

class _SingleSelection extends State<SingleSelection> {
  List<Map> gifts = [
    {"name": "Lion", "image": "assets/animals/lion.png"},
    {"name": "Cow", "image": "assets/animals/cow.png"},
    {"name": "Deer", "image": "assets/animals/deer.png"},
    {"name": "Giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "Rat", "image": "assets/animals/rat.png"},
    {"name": "Pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "Tiger", "image": "assets/animals/tiger.png"},
    {"name": "White-Tiger", "image": "assets/animals/white-tiger.png"},
  ];

 int? selectedIndex ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10,
            childAspectRatio: 0.71,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    Colors.black26,
                                    Colors.black12,
                                  ],
                                )),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Column(
                    children: [
                      Image.asset(
                        gifts[index]['image'],
                        height: selectedIndex==index? 120:100,
                        width: 250,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     selectedIndex==index? const SizedBox.shrink():Text(
                       gifts[index]["name"],
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    ],
                  ),
                 selectedIndex==index? Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 16, 74),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                          child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ):const SizedBox.shrink()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
