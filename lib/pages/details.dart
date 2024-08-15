// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:new_app/models/doctor.dart';

class DetailsPage extends StatefulWidget {
  final DoctorModel doctorModel;
  const DetailsPage({
    required this.doctorModel,
    super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<CalendarModel> calendarData = [];
  List<TimeModel> time = [];

  @override
  void initState() {
        super.initState();
        calendarData = widget.doctorModel.calendar;
        time = widget.doctorModel.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100,
        leadingWidth: 50,
        title: const Text(
          "Doctor's details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              info(),
              const SizedBox(height: 30,),
              Calendar(),
              const SizedBox(height: 30,),
              Time(),
              const SizedBox(height: 50,),
              Book()
            ]
          ),
        ),
      ),
    );
  
  }

  Widget info(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
              height: 130, 
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: widget.doctorModel.imageBox,
                      image: DecorationImage(
                        image: AssetImage(widget.doctorModel.image),
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
                          widget.doctorModel.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            for (var item in widget.doctorModel.specialities)
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
                              widget.doctorModel.score.toString(),
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
            const SizedBox(height: 10,),
            const Text(
              'Biography',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25,),
            Text(
              widget.doctorModel.bio,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25,),
            const Text(
              'Specialities',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: ListView.separated(
                itemBuilder: (context , index){
                  return Text(
                    widget.doctorModel.specialities[index],
                    style: const TextStyle(
                      color: Color(0xff09122c),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline
                    ),
                  );
                }, 
                separatorBuilder: (context, index)=> const SizedBox(width: 10,), 
                itemCount: widget.doctorModel.specialities.length,
                scrollDirection: Axis.horizontal,
                ),
            )
              
      ],
    );
  }

  Widget Calendar(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        const Text(
          'Calendar',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 100,
         
          child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index){
            return GestureDetector(
              onTap: (){
                for(var items in calendarData){
                  items.isSelected = false;
                }
                calendarData[index].isSelected = true;
                setState(() {});
              },
              child: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: calendarData[index].isSelected ? Colors.cyan : Colors.white,
                  
                 
                  boxShadow: [
                  BoxShadow(
                    color: calendarData[index].isSelected ? Colors.cyan.withOpacity(0.45) : Colors.white.withOpacity(0.45),
                    blurRadius: 25,
                    
                    offset: const Offset(0, 4),
                  ),
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      calendarData[index].dayNum.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: calendarData[index].isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      calendarData[index].datname,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: calendarData[index].isSelected ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            );
          }, 
          separatorBuilder: (contex, index)=> const SizedBox(width: 60,) , 
          itemCount: calendarData.length),
        )
      ]
        );
      
    
  }
  Widget Time(){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'Time',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 100,
        child: ListView.separated(
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                for(var items in time){
                  items.isSelected = false;
                }
                time[index].isSelected = true;
                setState(() {});
              },
              child: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:time[index].isSelected ? Colors.cyan : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: time[index].isSelected ? Colors.cyan : Colors.white,
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    ),
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time[index].time,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: time[index].isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          }, 
          separatorBuilder: (context, index)=> const SizedBox(width: 60,), 
          itemCount: time.length,
          scrollDirection: Axis.horizontal,
        ),
      )
    ],
  );

}

  Widget Book(){
    return MaterialButton(
      onPressed: (){
        showDialog(context: context, 
        builder:(context) => AlertDialog(
          actions: [
            TextButton(
              onPressed:(){ Navigator.of(context).pop();},
             child: const Text('Close')),
          ],
          title: const Text('Appointment booked',style: TextStyle(fontSize: 30),),
          contentPadding: const EdgeInsets.all(20),
          content: const Text('Please be there at time ',style: TextStyle(fontSize: 20)),
        ), 
        );
      },
      height: 55,
      minWidth: double.infinity,
      elevation: 0,
      color: Colors.cyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Text(
        'Book Appointment',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      );
  }



}

