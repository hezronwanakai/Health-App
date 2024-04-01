import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utibu Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utibu Health'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to medication browsing and ordering page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicationPage()),
                );
              },
              child: const Text('Order Medication'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to statement viewing page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatementPage()),
                );
              },
              child: const Text('View Statement'),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  String selectedMedication = 'Medication A';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Medication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedMedication,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMedication = newValue!;
                });
              },
              items: <String>['Medication A', 'Medication B', 'Medication C']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
              onChanged: (value) {
                setState(() {
                  quantity = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
    
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ordered $quantity $selectedMedication')),
                );
              },
              child: const Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class StatementPage extends StatelessWidget {
  const StatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Statement'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Statement:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Sample statement details
            Text('Date: April 1, 2024'),
            Text('Description: Medication Order'),
            SizedBox(height: 10),
            Text(
              'Ordered Medications:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Medication A'),
              subtitle: Text('Quantity: 2'),
              trailing: Text('\$30.00'),
            ),
            ListTile(
              title: Text('Medication B'),
              subtitle: Text('Quantity: 1'),
              trailing: Text('\$15.00'),
            ),
            Divider(),
            Text(
              'Total Amount: \$45.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Status: Paid'),
          ],
        ),
      ),
    );
  }
}
