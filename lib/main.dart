import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime datepick = DateTime.now();
  TimeOfDay timepick = TimeOfDay(hour: 8, minute: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 18, 11),
      body: Container(
        width: 500,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color.fromARGB(255, 109, 109, 109)),
                child: Column(
                  children: [
                    Text(
                      'Вы выбрали дату:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 224, 19, 4),) ,
                    ),
                    Text(
                      '${datepick.day.toString()}.${datepick.month.toString()}.${datepick.year.toString()}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: _buildPickDate,
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Выбрат дату',
                            style: TextStyle(color: Color.fromARGB(255, 4, 4, 4), fontWeight: FontWeight.bold, fontSize: 17 ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 224, 19, 4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
               
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color.fromARGB(255, 109, 109, 109)),
                child: Column(
                  children: [
                    Text(
                      'Вы выбрали время:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 224, 19, 4),),
                    ),
                    Text(
                      timepick.format(context).toString(),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: _buildPickTime,
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Выбрать время',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 220, 15, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  void _buildPickDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)).then((value) {setState(() {
          datepick = value!;
        });});
  }

  void _buildPickTime() {
    showTimePicker(context: context, initialTime:TimeOfDay.now() ).then((value) {
      setState(() {
        timepick= value!;
      });
    });
  }
}
