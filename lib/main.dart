import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: InnovationRegistration(),
  ));
}

// --- INNOVATIVE REGISTRATION SCREEN ---
class InnovationRegistration extends StatefulWidget {
  const InnovationRegistration({super.key});
  @override
  State<InnovationRegistration> createState() => _InnovationRegistrationState();
}

class _InnovationRegistrationState extends State<InnovationRegistration> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  String selectedZone = "Safe Zone"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blueAccent, Colors.indigo]),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield_rounded, color: Colors.white, size: 80),
                    Text("QCOMM INCOME SHIELD", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text("Worker Onboarding", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  TextField(controller: nameController, decoration: const InputDecoration(labelText: "Full Name", prefixIcon: Icon(Icons.person))),
                  const SizedBox(height: 10),
                  TextField(controller: idController, decoration: const InputDecoration(labelText: "Rider ID (Leave blank to auto-generate)", prefixIcon: Icon(Icons.badge))),
                  const SizedBox(height: 20),
                  const Text("Hyper-local Operating Zone:", style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedZone,
                    items: ["Safe Zone", "Flood-Prone Zone"].map((String value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
                    onChanged: (val) => setState(() => selectedZone = val!),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        String finalID = idController.text.isEmpty ? "RID-${Random().nextInt(9999)}" : idController.text;
                        Navigator.push(context, MaterialPageRoute(builder: (c) => Dashboard(name: nameController.text, riderID: finalID, zone: selectedZone)));
                      },
                      child: const Text("ACTIVATE PROTECTION", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PROFESSIONAL DASHBOARD & ZERO-TOUCH SYSTEM ---
class Dashboard extends StatefulWidget {
  final String name, riderID, zone;
  const Dashboard({super.key, required this.name, required this.riderID, required this.zone});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double premium = 50.0;
  String shieldStatus = "Monitoring Active";
  bool isTriggered = false;

  @override
  void initState() {
    super.initState();
    if (widget.zone == "Safe Zone") premium = 48.0;
  }

  void simulateZeroTouchClaim() {
    setState(() { 
      isTriggered = true; 
      shieldStatus = "Detecting Disruption..."; 
    });

    Timer(const Duration(seconds: 2), () {
      setState(() => shieldStatus = "Validating via Satellite & Sensors...");
      Timer(const Duration(seconds: 2), () {
        setState(() => shieldStatus = "Claim Approved! Payout Sent.");
        _showPayoutDialog();
      });
    });
  }

  void _showPayoutDialog() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Row(children: [Icon(Icons.check_circle, color: Colors.green), Text(" Automated Payout")]),
        content: const Text("No manual filing required. Zero-Touch claims process complete. ₹150 added to your wallet."),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("DISMISS"))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Shield Status"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Policy Holder: ${widget.name.isEmpty ? 'Guest Rider' : widget.name}", style: const TextStyle(fontSize: 16, color: Colors.grey)),
            Text("ID: ${widget.riderID}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Colors.white, Colors.blue.shade50]),
                ),
                child: Column(
                  children: [
                    const Text("Dynamic Weekly Premium", style: TextStyle(fontSize: 14, color: Colors.indigo)),
                    Text("₹$premium", style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    Chip(label: Text(widget.zone), backgroundColor: Colors.indigo.shade100),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.gps_fixed, size: 14, color: Colors.green),
                SizedBox(width: 5),
                Text("Accelerometer & GPS Monitoring Active", style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 10),
            Text(shieldStatus, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isTriggered ? Colors.red : Colors.blueGrey)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.thunderstorm),
                onPressed: isTriggered ? null : simulateZeroTouchClaim,
                label: const Text("SIMULATE WEATHER DISRUPTION"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
