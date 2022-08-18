import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housing/models/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> places = [
    "10 Sector Dwarka",
    "Abul Fazal Enclave Jamia Nagar",
    "Azad Apartments",
    "Bamnoli Sector 28 Dwarka",
    "Chanakya Puri",
    "DLF Golf Course",
    "DLF Phase 5",
    "Dwarka 11 Sector",
    "Greater Kailash",
    "Hauz Khas Enclave",
    "Kailash Colony",
    "Pitampura",
    "Vasant Kunj"
  ];
  Map<String, double> prem = {
    "10 Sector Dwarka": 2.7450980392156867,
    "Abul Fazal Enclave Jamia Nagar": 6.130718954248366,
    "Azad Apartments": 4.46078431372549,
    "Bamnoli Sector 28 Dwarka": 4.11764705882353,
    "Chanakya Puri": 1.6844919786096257,
    "DLF Golf Course": 4.006359300476948,
    "DLF Phase 5": 3.356207485541338,
    "Dwarka 11 Sector": 1.2241653418124008,
    "Greater Kailash": 1.6737524929980947,
    "Hauz Khas Enclave": 3.4199726402188784,
    "Kailash Colony": 6.737967914438503,
    "Pitampura": 3.2825862291842554,
    "Vasant Kunj": 4.298965314102615
  };
  Map<String, double> psf = {
    "10 Sector Dwarka": 6666.66666666666,
    "Abul Fazal Enclave Jamia Nagar": 14888.88888888888,
    "Azad Apartments": 10833.33333333333,
    "Bamnoli Sector 28 Dwarka": 10000,
    "Chanakya Puri": 4090.90909090909,
    "DLF Golf Course": 9729.7297297297,
    "DLF Phase 5": 8150.7896077432,
    "Dwarka 11 Sector": 2972.97297297297,
    "Greater Kailash": 4064.827482995372,
    "Hauz Khas Enclave": 8305.64784053156,
    "Kailash Colony": 16363.63636363636,
    "Pitampura": 7971.99512801890,
    "Vasant Kunj": 10440.34433424920
  };
  String? selectedPlace = "10 Sector Dwarka";
  String? gym = "No";
  String? swimmingPool = "No";
  String? landscapedGardens = "No";
  String? sports = "No";
  String? powerBackup = "No";
  String? security = "No";
  String? carParking = "No";
  String? clubHouse = "No";
  String? indoorGames = "No";
  String? jogging = "No";
  late int area;
  late int bedroom;
  String output = "";
  int sum = 0;
  String location = "10 Sector Dwarka";
  // ignore: prefer_typing_uninitialized_variables
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Housing Price Calculator")),
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                ),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: selectedPlace,
                  items: places.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPlace = value;
                      location = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.home,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter the area",
                    ),
                    onChanged: (String value) {
                      area = int.parse(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.bed,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter the no of bedrooms",
                    ),
                    onChanged: (String value) {
                      bedroom = int.parse(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Gym : "),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: gym,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      gym = value;
                      sum += value == "Yes" ? 4 : 0;
                    });
                  },
                ),
                const Text("Swimming Pool :"),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: swimmingPool,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      swimmingPool = value;
                      sum += value == "Yes" ? 4 : 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Garden : "),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: landscapedGardens,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      landscapedGardens = value;
                      sum += value == "Yes" ? 3 : 0;
                    });
                  },
                ),
                const Text("Sports Facilites :"),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: sports,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sports = value;
                      sum += value == "Yes" ? 3 : 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Power Backup: "),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: powerBackup,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      powerBackup = value;
                      sum += value == "Yes" ? 4 : 0;
                    });
                  },
                ),
                const Text(" Security :"),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: security,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      security = value;
                      sum += value == "Yes" ? 1 : 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Car Parking : "),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: carParking,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      carParking = value;
                      sum += value == "Yes" ? 3 : 0;
                    });
                  },
                ),
                const Text(" Clubhouse :"),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: clubHouse,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      clubHouse = value;
                      sum += value == "Yes" ? 2 : 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Indoor Games : "),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: indoorGames,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      indoorGames = value;
                      sum += value == "Yes" ? 3 : 0;
                    });
                  },
                ),
                const Text("Jogging Track :"),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: jogging,
                  items: <String>["Yes", "No"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      jogging = value;
                      sum += value == "Yes" ? 3 : 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    location = "10 Sector Dwarka";
                    sum = 0;
                    selectedPlace = "10 Sector Dwarka";
                    gym = "No";
                    swimmingPool = "No";
                    landscapedGardens = "No";
                    sports = "No";
                    powerBackup = "No";
                    security = "No";
                    carParking = "No";
                    clubHouse = "No";
                    indoorGames = "No";
                    jogging = "No";
                  });
                },
                child: const Text("Clear",
                    style: TextStyle(color: Colors.blue, fontSize: 20.0))),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  data = await FetchData().getData(
                      area, bedroom, psf[location], sum, prem[location]);
                  var decodedData = jsonDecode(data);
                  setState(() {
                    output = decodedData['prediction'];
                  });
                },
                child: const Text("Predict the Price",
                    style: TextStyle(color: Colors.white, fontSize: 20.0))),
            const SizedBox(height: 10),
            Text(
              "Predicted Price :\u{20B9} $output",
              style: const TextStyle(fontSize: 20.0),
            ),
          ]),
        ));
  }
}
