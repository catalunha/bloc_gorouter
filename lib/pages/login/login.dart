import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bloc_gorouter/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('build', name: runtimeType.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed('recovery');
              },
              child: const Text('recovery'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().login();
              },
              child: const Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
