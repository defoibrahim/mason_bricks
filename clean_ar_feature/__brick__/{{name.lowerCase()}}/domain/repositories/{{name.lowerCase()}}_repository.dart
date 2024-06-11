import 'package:dartz/dartz.dart';

import '../entities/{{name.lowerCase()}}_entity.dart';

abstract class I{{name.pascalCase()}}Repository {
  Future<Either<List<{{name.pascalCase()}}Entity>, Failure>> getAllForms();
}