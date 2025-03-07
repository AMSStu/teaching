import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Flutter Widget 1
class WidgetTestingPage2 extends StatefulWidget {
  @override
  _WidgetTestingPage2State createState() => _WidgetTestingPage2State();
}

class _WidgetTestingPage2State extends State<WidgetTestingPage2> {
  int? _radioValue = 1;
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 0.0;
  String _dropdownValue = 'Option 1';

  List<bool> _selection = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('AMS LTD'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Text('This is a TextView', key: Key('textView')),
            SizedBox(height: 20),

            // TextField (EditText)
            TextField(
              key: Key('editText'),
              decoration: InputDecoration(labelText: 'Enter some text'),
            ),
            SizedBox(height: 20),

            // ElevatedButton (Button)
            ElevatedButton(
              key: Key('button'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Button pressed!')),
                );
              },
              child: Text('Press Me'),
            ),
            SizedBox(height: 20),

            // Radio Buttons
            Text('Select an option:'),
            Row(
              children: [
                Radio(
                  key: Key('radio1'),
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                Text('Option 1'),
              ],
            ),
            Row(
              children: [
                Radio(
                  key: Key('radio2'),
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                Text('Option 2'),
              ],
            ),
            SizedBox(height: 20),

            // Switch
            Row(
              children: [
                Text('Switch:'),
                Switch(
                  key: Key('switch'),
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  key: Key('checkbox'),
                  value: _checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
                Text('Check me!'),
              ],
            ),
            SizedBox(height: 20),

            // Slider (SeekBar)
            Text('Slider Value: ${_sliderValue.toStringAsFixed(1)}'),
            Slider(
              key: Key('slider'),
              value: _sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Dropdown
            DropdownButton<String>(
              key: Key('dropdown'),
              value: _dropdownValue,
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _dropdownValue = value ?? 'Option 1';
                });
              },
            ),
            SizedBox(height: 20),

            // ListView
            Text('List of Items:'),
            Container(
              height: 100,
              child: ListView(
                key: Key('listView'),
                children: [
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                ],
              ),
            ),
            SizedBox(height: 20),

            // SnackBar Example
            ElevatedButton(
              key: Key('showSnackbar'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('This is a Snackbar')),
                );
              },
              child: Text('Show Snackbar'),
            ),
            SizedBox(height: 20),

            // FutureBuilder
            FutureBuilder<String>(
              key: Key('futureBuilder'),
              future: Future.delayed(Duration(seconds: 2), () => "Data Loaded!"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(snapshot.data!);
                }
              },
            ),
            SizedBox(height: 20),

            // Gesture Detector
            GestureDetector(
              key: Key('gestureDetector'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gesture Detector Tapped!')),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Image
            Image.asset(
              'assets/sample_image.png', // Ensure you have an image in this path
              key: Key('sampleImage'),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),

            // Card
            Card(
              key: Key('card'),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('This is a Card widget!'),
              ),
            ),
            SizedBox(height: 20),

            // GridView
            Text('Grid of Items:'),
            Container(
              height: 150,
              child: GridView.count(
                key: Key('gridView'),
                crossAxisCount: 2,
                children: List.generate(
                  4,
                      (index) => Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue[(index + 1) * 100],
                    child: Center(child: Text('Item $index')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Stepper
            Text('Stepper Example:'),
            Stepper(
              key: Key('stepper'),
              currentStep: 0,
              steps: [
                Step(title: Text('Step 1'), content: Text('Content of Step 1')),
                Step(title: Text('Step 2'), content: Text('Content of Step 2')),
                Step(title: Text('Step 3'), content: Text('Content of Step 3')),
              ],
              // onTap: (step) {},
            ),
            SizedBox(height: 20),

            // Date Picker
            ElevatedButton(
              key: Key('datePickerButton'),
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected Date: ${selectedDate.toLocal()}')),
                  );
                }
              },
              child: Text('Select Date'),
            ),
            SizedBox(height: 20),

            // Time Picker
            ElevatedButton(
              key: Key('timePickerButton'),
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected Time: ${selectedTime.format(context)}')),
                  );
                }
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),

            // Bottom Sheet
            ElevatedButton(
              key: Key('bottomSheetButton'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Text('This is a Bottom Sheet'),
                      ),
                    );
                  },
                );
              },
              child: Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}