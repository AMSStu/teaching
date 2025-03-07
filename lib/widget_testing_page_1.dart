// Home Page with Buttons to Navigate
import 'package:flutter/material.dart';
import 'package:teaching/widget_testing_page_2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(Colors.blue, Colors.black38),
      appBar: AppBar(
        title: Text('AMS LTD'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignaturePage()),
              );
            },
            child: Text('Go to Signature Page'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetTestingPage2()),
              );
            },
            child: Text('Go to Page One'),
          ),
          SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => WidgetTestingPage2()),
          //     );
          //   },
          //   child: Text('Go to Page Two'),
          // ),
        ],
      ),
    );
  }
}

// Signature Drawing Page
class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  List<Offset?> points = []; // List to store points that will be drawn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('AMS LTD',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                points.clear(); // Clear the signature
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            // Record the points to draw
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            points.add(renderBox.globalToLocal(details.globalPosition));
          });
        },
        onPanEnd: (details) {
          points.add(null); // Add a null point to indicate the end of a stroke
        },
        child: CustomPaint(
          painter: SignaturePainter(points),
          child: Container(),
        ),
      ),
    );
  }
}


class SignaturePainter extends CustomPainter {
  final List<Offset?> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint whenever there's a change in points
  }
}