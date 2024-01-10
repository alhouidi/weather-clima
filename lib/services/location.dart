import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  // Future<bool> dialogBuilder() async {
  //   print('Dos: 2');
  //   bool result = false;
  //   showDialog(
  //     context: navigatorKey.currentContext!,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Location services disabled'),
  //         content: const Text('Please enable location services.'),
  //         actions: [
  //           TextButton(
  //               child: Text('Cancel'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 result = false;
  //               }),
  //           TextButton(
  //             child: Text('Settings'),
  //             onPressed: () {
  //               Geolocator.openLocationSettings();
  //               Navigator.pop(context);
  //               result = true;
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //   return result;
  // }

  Future<void> getCurrentLocation() async {
    print('Dos: 2');
    try {
      bool serviceEnabled;
      LocationPermission permission;
      Position position;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Fluttertoast.showToast(msg: 'Location services are disabled.');
        // return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: 'Location permissions are denied');
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg:
                'Location permissions are permanently denied, we cannot request permissions.');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      print('Dos: 8');
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('Dos: 9');

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
