import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'error.dart';

void main() => runApp(const DoctorCaller());

const style = TextStyle(
  color: Colors.white,
);

class DoctorCaller extends StatelessWidget {
  const DoctorCaller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text(
            'Doctor Caller',
            style: style,
          ),
        ),
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DoctorButton(
                color: Colors.green,
                doctor: 'Kapil',
                recipient: '9810497562',
              ),
              SizedBox(
                height: 30.0,
              ),
              DoctorButton(
                color: Colors.lightGreen,
                doctor: 'Kandarp',
                recipient: '9871057964',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorButton extends StatelessWidget {
  const DoctorButton(
      {super.key,
      required this.color,
      required this.doctor,
      required this.recipient});

  final Color color;
  final String doctor;
  final String recipient;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: TextButton(
        onPressed: () async {
          try {
            await sendSMS(
              message: 'You have a patient!',
              recipients: [recipient],
            );
          } catch (e) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Error();
            }));
          }
        },
        child: Text(
          'Patient for Dr. $doctor',
          style: style,
        ),
      ),
    );
  }
}
