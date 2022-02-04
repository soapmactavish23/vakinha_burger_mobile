import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/login/login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    )
  ];
}
