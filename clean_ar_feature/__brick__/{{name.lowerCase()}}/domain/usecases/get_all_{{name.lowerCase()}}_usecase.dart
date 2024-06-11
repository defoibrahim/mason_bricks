
class GetAll{{name.pascalCase()}Usecase extends BaseUseCase<List<{{name.pascalCase()}}Entity>, NoParams>{
  final I{{name.pascalCase()}}Repository {{name}}Repository;

  GetAll{{name}}Usecase({required  this.{{name}}Repository});

  Future<Either<List<{{name.pascalCase()}}Entity>>, Failure>> call() async {
    return await {{name}}Repository.getAll();
  }
}