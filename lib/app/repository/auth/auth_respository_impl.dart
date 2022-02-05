import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/models/user_model.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth/auth_repository.dart';

class AuthRespositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRespositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var massage = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        massage = result.body['error'];
      }

      log(massage, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(massage);
    }
    return login(email, password);
    // throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException();
      }

      log('Erro ao autenticar o usuário (${result.statusCode})',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException('Erro ao autenticar usuário');
    }
    return UserModel.fromMap(result.body);
  }
}
