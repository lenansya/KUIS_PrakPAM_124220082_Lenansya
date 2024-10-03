import 'package:flutter/material.dart';

class Pembayaran extends StatelessWidget {
  final String fullname;
  final String email;
  final String total_room;
  final String total_night;
  const Pembayaran(
      {super.key,
      required this.fullname,
      required this.email,
      required this.total_room,
      this.total_night = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('PAYMENT', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 194, 17, 129),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Payment Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Nama: $fullname',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Email: $email',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Total Room: $total_room',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Total Night: $total_night',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 36,
              ),
                  Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show snackbar on purchase
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pembayaran berhasil!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black26,
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
                ],
              )
          ),
        ),
      );
  }
}