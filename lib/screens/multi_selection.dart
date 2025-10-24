import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> avatar = [
    "lion",
    "giraffe",
    "rat",
    "tiger",
    "elephant",
    "cheetah",
    "cat",
    "goat",
    "lion",
    "giraffe",
    "rat",
    "tiger",
    "elephant",
    "cheetah",
    "cat",
    "goat",
    "lion",
    "elephant",
    "cheetah",
    "cat",
    "goat"
  ];

  List<String> favourite = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.black,
  body: SingleChildScrollView(
    padding: const EdgeInsets.only(left: 10, top: 60, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Which animal do you like?",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 25,
          runSpacing: 14,
          children: List.generate(avatar.length, (index) {
            final selected = avatar[index];
            final isSelected = favourite.contains(selected);

            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected
                      ? favourite.remove(selected)
                      : favourite.add(selected);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.blueAccent
                      : Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isSelected
                        ? Colors.blueAccent
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  selected,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 40),
        const Text(
          "Your favourites:",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 10),

        // horizontal scroll for chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: favourite
                .map(
                  (v) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(v),
                      backgroundColor: Colors.blueAccent,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  ),
);
  }
}
