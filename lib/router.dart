import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bloc_gorouter/cubit.dart';
import 'package:bloc_gorouter/home.dart';
import 'package:bloc_gorouter/login.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
    ],
    redirect: (context, state) {
      print('redirect');
      print(state.fullPath);
      final status = context.read<AuthCubit>().state;
      if (status && state.fullPath == '/login') {
        return '/home';
      }
      if (status) {
        return null;
      }
      return '/login';
    },
  );
}
