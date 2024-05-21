import 'package:flutter/material.dart';

class SonucSayfasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.green[300], // Arka plan rengi
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Ekran Süresi Hesaplama',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            const Icon(
              Icons.access_time,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 75,
                width: 150,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}