import 'package:flutter/material.dart';
import 'dart:math';
class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<Map> avatar = [
    {"name": "Lion", "image": "assets/animals/lion.png"},
    {"name": "Cow", "image": "assets/animals/cow.png"},
    {"name": "Deer", "image": "assets/animals/deer.png"},
    {"name": "Giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "Rat", "image": "assets/animals/rat.png"},
    {"name": "Pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "Tiger", "image": "assets/animals/tiger.png"},
    {"name": "White-Tiger", "image": "assets/animals/white-tiger.png"},
  ];

  Color _backgroundColor =Colors.white12;

  Color getRandomColor(){
    final random=Random();
    return Color.fromARGB(200, random.nextInt(255), random.nextInt(255), random.nextInt(255)) ;
  }

   int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(192, 253, 236, 0),
      body: Column(
        children: [
          //Big Image 
          Stack(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                 color:_backgroundColor,
                  width: double.infinity,
                  height: 300,
                    
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 280,
                    child: Image.asset(avatar[selectedIndex]["image"]),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),

          // Small avatars 
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(avatar.length, (index) {
              return GestureDetector(
                onTap:() {
                  setState(() {
                    if(selectedIndex!=index)
                   { selectedIndex=index;
                    _backgroundColor=getRandomColor();
                   }
                  });
                },
                child: Container(
                  margin:const EdgeInsets.only(right: 10),
                  decoration:  BoxDecoration(
                    border: Border.all(
                         color: Colors.grey.shade400
                    ),
                  ),
                    child: Image.asset(
                  avatar[index]["image"],
                  width: 100,
                  height: 100,
                )),
              );
            })),
          ),
        ],
      ),
    );
  }
}
