import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class RecoveryPage extends StatelessWidget {
  const RecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('build', name: runtimeType.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('return')),
      ),
    );
  }
}
