import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  login();
  Future<Either<String,User?>> register({required String email, required String password}); 
 

}

class FirebaseServicesImpl implements FirebaseServices{
 @override
  Future<Either<String,User?>>  register(
    {required String email, required String password}) async { 
    try{
      final credential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
      return Right(credential.user);
    } on FirebaseAuthException catch (e){
      if(e.code == "weak password"){
        return Left('your passwrod in to weak ');
      }else if(e.code== 'email_already-in-use'){
        return Left ('the account already exists for that email');
      }else{
        return Left('Authentatication Error: ${e.message}');
      }

  }catch(e){
    print(e);
    return Left('An error occurred: $e');
  }
  }


  @override 
  login() {

    
  
 
}
}