import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: RegistrationScreen(),
  ));
}

// --- FEATURE 1: WORKER REGISTRATION ---
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedZone = "Safe Zone"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QComm: Worker Shield"), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Step 1: Registration", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Full Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Rider ID (e.g. SW-101)", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            const Text("Hyper-local Operating Zone:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedZone,
              isExpanded: true,
              items: ["Safe Zone", "Flood-Prone Zone"].map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (val) => setState(() => selectedZone = val!),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => Dashboard(zone: selectedZone))),
                child: const Text("Generate Policy & Activate Shield"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// --- FEATURE 2, 3, & 4: POLICY, PREMIUMS, & ZERO-TOUCH CLAIMS ---
class Dashboard extends StatefulWidget {
  final String zone;
  const Dashboard({super.key, required this.zone});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double premium = 50.0;
  String status = "Shield Active: Monitoring Sensors ✅";
  String sensorLog = "Accelerometer: Valid Movement Detected";

  @override
  void initState() {
    super.initState();
    // AI LOGIC: Dynamic Premium (₹2 discount for safe zones as per prompt)
    if (widget.zone == "Safe Zone") {
      premium = 48.0; 
    }
  }

  // AUTOMATED TRIGGER LOGIC: Zero-Touch Claim Simulation
  void simulateRainTrigger() {
    setState(() => status = "Alert: Heavy Rain Detected in Zone! 🌧️");
    Timer(const Duration(seconds: 3), () {
      showDialog(
        context: context,
        builder: (c) => AlertDialog(
          title: const Text("Zero-Touch Payout! 💰"),
          content: const Text("Our system detected a disruption. ₹150 has been added to your wallet automatically. No application needed!"),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Confirm"))],
        ),
      );
      setState(() => status = "Shield Active: Monitoring Sensors ✅");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Protection Shield")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Dynamic Weekly Premium:", style: TextStyle(fontSize: 18)),
            Text("₹$premium", style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.blue)),
            Text("Risk Level: ${widget.zone}", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(sensorLog, style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
            ),
            const SizedBox(height: 20),
            Text(status, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.redAccent)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: simulateRainTrigger,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: const EdgeInsets.all(15)),
              child: const Text("Simulate Rain Event (Demo Trigger)"),
            ),
          ],
        ),
      ),
    );
  }
}