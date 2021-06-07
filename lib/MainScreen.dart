import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatelessWidget {
  void getLocation() async {
    print('started');
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'description',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  getLocation();
                },
                child: Text('Broadcast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
