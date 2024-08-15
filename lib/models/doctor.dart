import 'package:flutter/material.dart';

class DoctorModel{
  String name;
  String image;
  Color imageBox;
  List<String> specialities;
  double score;
  String bio;
  List<CalendarModel> calendar;
  List<TimeModel> time;

  DoctorModel({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialities,
    required this.score,
    required this.bio,
    required this.calendar,
    required this.time
  });

  static List<DoctorModel> getDoctors(){
    List<DoctorModel> doctors = [];
    doctors.add(
      DoctorModel(
        name: 'Dr. Tashkeel Pasha',
        image: 'assets/images/doctor1.jpg',
        imageBox: Colors.blue,
        specialities: ['Dentist'],
        score: 4.5,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        calendar: [
          CalendarModel(dayNum: 18, datname: 'Mon',isSelected: false),
          CalendarModel(dayNum: 19, datname: 'Tues',isSelected: true),
          CalendarModel(dayNum: 20, datname: 'Wed',isSelected: false),
          
        ],
        time: [
        TimeModel(time: "09:00", isSelected: false),
        TimeModel(time: "10:00", isSelected: true),
        TimeModel(time: "11:00", isSelected: false)
        ],
      ),
    );
    doctors.add(
      DoctorModel(
        name: 'Dr. Hamadullah',
        image: 'assets/images/doctor1.jpg',
        imageBox: Colors.green,
        specialities: [ 'Orthopedic'],
        score: 4,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        calendar: [
          CalendarModel(dayNum: 18, datname: 'Mon',isSelected: false),
          CalendarModel(dayNum: 19, datname: 'Tues',isSelected: true),
          CalendarModel(dayNum: 20, datname: 'Wed',isSelected: false),
          
        ],
        time: [
        TimeModel(time: "08:00", isSelected: false),
        TimeModel(time: "09:00", isSelected: true),
        TimeModel(time: "10:00", isSelected: false)
        ],
      ),
      );
      doctors.add(
      DoctorModel(
        name: 'Dr. Wasay',
        image: 'assets/images/doctor1.jpg',
        imageBox: Colors.green,
        specialities: [ 'Dentist'],
        score: 4,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        calendar: [
          CalendarModel(dayNum: 18, datname: 'Mon',isSelected: false),
          CalendarModel(dayNum: 19, datname: 'Tues',isSelected: true),
          CalendarModel(dayNum: 20, datname: 'Wed',isSelected: false),
          
        ],
        time: [
        TimeModel(time: "07:00", isSelected: false),
        TimeModel(time: "08:00", isSelected: true),
        TimeModel(time: "09:00", isSelected: false)
        ],
      ),
      );
      doctors.add(
      DoctorModel(
        name: 'Dr. Shazan',
        image: 'assets/images/doctor1.jpg',
        imageBox: Colors.green,
        specialities: [ "Cardiologist"],
        score: 4,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        calendar: [
          CalendarModel(dayNum: 18, datname: 'Mon',isSelected: false),
          CalendarModel(dayNum: 19, datname: 'Tues',isSelected: true),
          CalendarModel(dayNum: 20, datname: 'Wed',isSelected: false),
          
        ],
         time: [
        TimeModel(time: "07:30", isSelected: false),
        TimeModel(time: "08:30", isSelected: true),
        TimeModel(time: "09:30", isSelected: false),
        ],
      ),
      );
      doctors.add(
      DoctorModel(
        name: 'Dr. Kashan',
        image: 'assets/images/doctor1.jpg',
        imageBox: Colors.green,
        specialities: [ 'Cardiologist'],
        score: 4,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        calendar: [
          CalendarModel(dayNum: 18, datname: 'Mon',isSelected: false),
          CalendarModel(dayNum: 19, datname: 'Tues',isSelected: true),
          CalendarModel(dayNum: 20, datname: 'Wed',isSelected: false),
          
        ],
         time: [
        TimeModel(time: "10:30", isSelected: false),
        TimeModel(time: "11:00", isSelected: true),
        TimeModel(time: "11:30", isSelected: false)
        ],
      ),
      );
    
    return doctors;
  }

}


class CalendarModel{
  final int dayNum;
  final String datname;
  bool isSelected;

  CalendarModel({
    required this.dayNum,
    required this.datname,
     required this.isSelected 
  });


}


class TimeModel{

  final String time;
  bool isSelected;

  TimeModel({
    required this.time,
    required this.isSelected
  });

}