import 'package:flutter/material.dart';

class CalculaterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalCulaterScreen();
}

class _CalCulaterScreen extends State<CalculaterScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  String result = "";
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculater"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //First Controller
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter no1",
                label: Text('No1'),
                labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                fillColor: Colors.blue.shade50,
                filled: true,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //Second Controller
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter no 2",
                label: Text("No2"),
                labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                fillColor: Colors.blue.shade50,
                filled: true,
              ),
            ),

            SizedBox(
              height: 40,
            ),
            //Operators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    flag = 1;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: myDecoration(flag == 1 ? true : false),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    flag = 2;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: myDecoration(flag == 2 ? true : false),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    flag = 3;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: myDecoration(flag ==3 ? true : false),
                    child: Center(
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    flag = 4;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: myDecoration(flag == 4 ?  true : false),
                    child: Center(
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            //button and operation
            ElevatedButton(
              onPressed: () {
                int no1 = int.parse(firstController.text);
                int no2 = int.parse(secondController.text);

                if (flag == 1) {
                  result = "the sum of $no1 and $no2 is ${no1 + no2}";
                } else if (flag == 2) {
                  int sub = 0;
                  if (no1 > no2) {
                    sub = no1 - no2;
                  } else {
                    sub = no2 - no1;
                  }
                  result = "the sub of $no1 and $no2 is ${sub}";
                } else if (flag == 3) {
                  result =
                      "the multiplication of $no1 and $no2 is ${no1 * no2}";
                } else if (flag == 4) {
                  result = "the division of $no1 and $no2 is ${no1 / no2}";
                } else {
                  result = "please choose an operator";
                }

                setState(() {});
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 60),
                backgroundColor: Colors.blue.shade400,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "$result",
                    style: TextStyle(color: Colors.white, fontSize: 22),textAlign: TextAlign.center,),
                ))
          ],
        ),
      ),
    );
  }

  BoxDecoration myDecoration(bool isSelected) {
    return BoxDecoration(
        border: isSelected ? Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 3,
          color: Colors.purpleAccent,
        ) : Border.all(
          width: 0,
          color: Colors.transparent,
        ),
      borderRadius: BorderRadius.circular(12),
      color: Colors.blue.shade400,
    );
  }
}
