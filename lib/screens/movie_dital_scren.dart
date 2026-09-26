import 'package:flutter/material.dart';
import 'package:movies_app/view_model/view_model.dart';

// ignore: camel_case_types
class movieditalscren extends StatelessWidget {
  const movieditalscren({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              // "assets/poster.jpeg",
              "assets/unnamed.png",
              height: MediaQuery.of(context).size.height * 0.6,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(112, 206, 199, 199),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BackButton(
                  // style: BackButton(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              // height:Size.height * 0.61,
              // width: Size.width,
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: vm.isDarkmode.value? Colors.grey.shade900 : Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fantastic Beasts and Where to Find Them",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20), 
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text("${"model"}/10"),
                        Spacer(),
                        Text("model.releaseDate"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Category 1",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Category 2",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Fantastic Beasts and Where to Find Them is a 2016 fantasy film directed by David Yates and written by J.K. Rowling, serving as a prequel to the Harry Potter film series. It stars Eddie Redmayne as Newt Scamander, a magizoologist whose adventure in 1926 New York City involves escaped magical creatures and a brewing conflict within the wizarding world. ",
                      style: TextStyle(fontWeight: FontWeight.w500),
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
