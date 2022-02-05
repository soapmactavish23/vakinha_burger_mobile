import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_controller.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth/auth_respository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRespositoryImpl(restClient: Get.find()));

    Get.lazyPut(() => RegisterController(authRepository: Get.find()));

  }
}