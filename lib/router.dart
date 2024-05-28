import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bloc_gorouter/auth_cubit.dart';
import 'package:bloc_gorouter/pages/home/home.dart';
import 'package:bloc_gorouter/pages/login/login.dart';

import 'pages/recovery/recovery.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: 'login',
          builder: (context, state) {
            log('login', name: 'router.builder');
            return const LoginPage();
          },
          routes: [
            GoRoute(
              path: 'recovery',
              name: 'recovery',
              builder: (context, state) {
                log('recovery', name: 'router.builder');
                return const RecoveryPage();
              },
            ),
          ]),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          log('home', name: 'router.builder');
          return const HomePage();
        },
      ),
    ],
    redirect: (context, state) {
      log('+++ start', name: 'redirect');
      log('${state.fullPath}', name: 'redirect');
      final auth = context.read<AuthCubit>().state;
      log('auth: $auth', name: 'redirect');
      if (state.fullPath == '/recovery') {
        return '/recovery';
      }
      if (auth && state.fullPath == '/') {
        return '/home';
      }
      if (auth) {
        return null;
      }
      return '/';
    },
  );
}
