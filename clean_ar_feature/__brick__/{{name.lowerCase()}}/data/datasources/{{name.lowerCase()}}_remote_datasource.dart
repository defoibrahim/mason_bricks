import 'package:dartz/dartz.dart';

import '../models/{{name.lowerCase()}}_model.dart';

abstract class I{{name.pascalCase()}}RemoteDataSource {
  Future<Either<List<{{name.pascalCase()}}Model>, Failure>> getAll{{name.pascalCase()}}();
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements I{{name.pascalCase()}}RemoteDataSource {
  {{name.pascalCase()}}RemoteDataSourceImpl();

  @override
  Future<Either<List<{{name.pascalCase()}}Model>, Failure>> getAll{{name.pascalCase()}}() async {
    try {
      final response = await DioClient.makeRequest(
        url: ApiConstants.getForms,
        converter: (response) {
          try {
            return (response['data'] as List)
                .map((e) => {{name.pascalCase()}}Model.fromJson(e))
                .toList();
          } catch (e) {
            throw Exception(e);
          }
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}