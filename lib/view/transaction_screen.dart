import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History 📜'),
        backgroundColor: Color(0xff134f5c),
      ),
      body: Center(
        child: const Text('No order history available.'),
      ),
    );
  }
}
