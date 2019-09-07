import 'package:flutter/material.dart';

import 'package:beachfyme/db/database.dart';
import 'spots_page.dart';

class EquipmentPage extends StatefulWidget {
  @override
  _EquipmentPageState createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text(
                'Equipment'.toUpperCase(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
             Padding(
              padding: EdgeInsets.only(top: 15),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      child: InkWell(
                        highlightColor: Colors.white.withAlpha(50),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpotsPage(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/$index.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    courses[index].toString().toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  Text(
                                    'Adobe XD, Sketch, Figma',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // Divider(
                                  //   color: Colors.grey[300],
                                  //   height: 25,
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
