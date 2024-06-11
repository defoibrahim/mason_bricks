import 'package:dartz/dartz.dart';

import '../models/{{name.lowerCase()}}_model.dart';
import '../datasources/{{name.lowerCase()}}_remote_datasource.dart';


class {{name.pascalCase()}}RepositoryImpl implements I{{name.pascalCase()}}Repository {
  I{{name.pascalCase()}}RemoteDataSource {{name.lowerCase()}}DataSource = sl<I{{name.pascalCase()}}RemoteDataSource>();
  NetworkInfoImpl networkInfo = NetworkInfoImpl(dataConnectionChecker: sl());

  {{name.pascalCase()}}RepositoryImpl({required this.{{name.lowerCase()}}DataSource});

  @override
  Future<Either<List<{{name.pascalCase()}}Model>, Failure>> getAll{{name.pascalCase()}}s() async {
    if (await networkInfo.isConnected) {
      try {
        final getAll{{name.pascalCase()}}Response = await {{name.lowerCase()}}DataSource.getAll{{name.pascalCase()}}();
        return getAll{{name.pascalCase()}}Response.fold(
          (List<FormModel> forms) => Left(forms),
          (failure) => Right(failure),
        );
      } on ServerException catch (e) {
        return Right(ServerFailure(title: '', message: e.message));
      }
    } else {
      return const Right(
        OfflineFailure(message: 'No Internet, try again later'),
      );
    }
  }
}
