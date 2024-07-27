import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tappedIndex = -1;
  double _rating = 3.5;
  int _counter = 0;

  void _toggleTap(int index) {
    setState(() {
      _tappedIndex = (_tappedIndex == index) ? -1 : index;
    });
  }

  void _onRatingChanged(double value) {
    setState(() {
      _rating = value;
    });
    print('Rating changed to: $_rating');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45),
                  ),
                  SizedBox(width: 250),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined, color: Colors.white, size: 27),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white, size: 27),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.2),
                        bottomRight: Radius.circular(20.2),
                      ),
                    ),
                    width: 300,
                    height: 480,
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Image.asset("assets/images/p.png", fit: BoxFit.cover),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            SizedBox(width: 130),
                            Container(width: 20, height: 2, color: Colors.red),
                            SizedBox(width: 10),
                            Container(width: 10, height: 2, color: Colors.grey),
                            SizedBox(width: 10),
                            Container(width: 10, height: 2, color: Colors.grey[850]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () => _toggleTap(index),
                          child: Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: _tappedIndex == index ? Colors.red[900] : Colors.grey[850],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                ['M', 'S', 'L', 'XL', '2XL'][index],
                                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Belgium EURO",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "B20/21 Away by Adidas",
                        style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w200, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Rate(
                      iconSize: 30,
                      color: Colors.red.shade700,
                      allowHalf: true,
                      allowClear: true,
                      initialValue: _rating,
                      readOnly: false,
                      onChange: _onRatingChanged,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    _rating.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red.shade700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: _decrementCounter,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$_counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red.shade700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: _incrementCounter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Material: ',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'polyester',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Shipping: ',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'in 5 to 6 days',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Returns: ',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'within 20 days',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text(
                      '\$88',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
