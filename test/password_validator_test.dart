import 'package:test/test.dart';
import '../lib/password_validator.dart';

void main() {
  //declaring most re-used variable
  final passwordStr = PasswordValidator("ImThePassword");
  final passwordInt = PasswordValidator(12345678);
  //1. at least 8 characters
  test("Does password have lenght of 8 or more?", () {
    //create the function that returns bool for validation
    final resultStr = passwordStr.checkLength();
    final resultInt = passwordInt.checkLength();
    expect(resultStr, true);
    expect(resultInt, true);
  });
  //2. contains upper + lower case
  test("Does the input has uppercase?", () {
    //create the function for checking the uppercase exists within the password
    //didn't check for passwordInt since it doesnt have any String
    final result = passwordStr.checkUpper();
    expect(result, true);
  });
  // 3. contains digit
  test("Does the input contains number in it?", () {
    //custom input for testing
    final passwordIntStr = PasswordValidator("P4ssw0rd");

    final resultStr = passwordStr.checkForInt();
    final resultIntStr = passwordIntStr.checkForInt();
    expect(resultStr, false);
    expect(resultIntStr, true);
  });
  //4. contains symbol
  test("Does the input contain any symbol in UTF-8?", () {
    final passwordSymbol = PasswordValidator("P@ssw()rd");
    final resultSymbol = passwordSymbol.checkForSymbol();
    final resultStr = passwordStr.checkForSymbol();
    expect(resultSymbol, true);
    expect(resultStr, false);
  });
  //5. no spaces
  test("Does the input have any space? ", () {
    final pass_word = PasswordValidator("This is password");
    final result_output = pass_word.checkForSpace();
    final resultStr = passwordStr.checkForSpace();
    expect(result_output, true);
    expect(resultStr, false);
  });

  //6. the ultimate test
  test("Does the input pass all the requirements given?", () {
    final password = PasswordValidator("Th1s |s p4ss_W()rd");
    final result = password.validatePassword();
    expect(result, true);
  });
}
