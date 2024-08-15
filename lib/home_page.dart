import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/pages/details.dart';

import 'models/category.dart';
import 'models/doctor.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final List<CategoryModel> categoriesData = CategoryModel.getCategories();
  List<DoctorModel> doctorsData = DoctorModel.getDoctors();
  List<DoctorModel> filteredDoctorsData = DoctorModel.getDoctors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [head(), categories(), doctors()],
      ),
    );
  }

  Widget categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var item in categoriesData) {
                      item.isSelected = false;
                    }
                    categoriesData[index].isSelected = true;

                    // Filter doctors based on selected category
                    String selectedCategory = categoriesData[index].name;
                    if (selectedCategory == 'All') {
                      filteredDoctorsData = doctorsData;
                    } else {
                      filteredDoctorsData = doctorsData
                          .where((doctor) => doctor.specialities.contains(selectedCategory))
                          .toList();
                    }
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: categoriesData[index].isSelected
                            ? Colors.cyan.withOpacity(0.45)
                            : Colors.black.withOpacity(0.1),
                        blurRadius: 25,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: categoriesData[index].isSelected
                        ? Colors.cyan
                        : Colors.white,
                  ),
                  child: SvgPicture.asset(
                    categoriesData[index].vector,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 110),
            itemCount: categoriesData.length,
          ),
        ),
      ],
    );
  }

  Widget head() {
    return Container(
      color: Colors.cyan,
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hello User",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  'assets/vectors/bell.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Let's find\nyou a doctor!",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25),
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                size: 35,
              ),
              hintText: 'Search here....',
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget doctors() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage(doctorModel: filteredDoctorsData[index],)));
            },
            child: Container(
              height: 130, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.07),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: filteredDoctorsData[index].imageBox,
                      image: DecorationImage(
                        image: AssetImage(filteredDoctorsData[index].image),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      children: [
                        Text(
                          filteredDoctorsData[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            for (var item in filteredDoctorsData[index].specialities)
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.cyan.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(height: 5), 
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Text(
                              filteredDoctorsData[index].score.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20), // Adjusted space between items
        itemCount: filteredDoctorsData.length,
      ),
    );
  }
}

