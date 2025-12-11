//generic type to accept any kinds of password
class PasswordValidator<T> {
  final _password;
  PasswordValidator(this._password);

  //now include every other checking method to one big powerful function
  bool validatePassword() {
    bool isFound = false;
    final size = checkLength();
    final upper = checkUpper();
    final integer = checkForInt();
    final symbol = checkForSymbol();
    final space = checkForSpace();

    if (size && upper && integer && symbol && space) {
      isFound = true;
    }
    return isFound;
  }

  //function logic that turns the input of the class into string to check the lenght
  bool checkLength() {
    final string = _password.toString();
    if (string.length >= 8) return true;
    return false;
  }

  bool checkUpper() {
    final bigAplhabet = "ABCDEFGHIJKLMNOPQRSTUVWSYXZ";
    final string = _password.toString();
    bool isFound = false;
    //failed multiple times due to for loop still returned false even if some indexes met the condition so i added bool var to store it
    for (int i = 0; i < bigAplhabet.length; i++) {
      if (string.contains(bigAplhabet[i])) {
        isFound = true;
      }
    }
    return isFound;
  }

  bool checkForInt() {
    //for sanity, just in case the input is all numbers
    final string = _password.toString();
    final decimalNums = "1234567890";
    bool isFound = false;
    //basically same logic i used before
    for (int i = 0; i < decimalNums.length; i++) {
      if (string.contains(decimalNums[i])) {
        isFound = true;
      }
    }
    return isFound;
  }

  bool checkForSymbol() {
    final string = _password.toString();
    final basicPunctuation = "!@#\$%^&*()-_+=[]{}|;':\",./<>?~";
    bool isFount = false;
    //keeping it simple as possible, as long as it serves its purpose on both usefulness, and efficiency
    for (int i = 0; i < basicPunctuation.length; i++) {
      if (string.contains(basicPunctuation[i])) {
        isFount = true;
      }
    }
    return isFount;
  }

  bool checkForSpace() {
    final string = _password.toString();
    bool isFound = false;
    for (int i = 0; i < string.length; i++) {
      if (string[i] == " ") {
        isFound = true;
      }
    }
    return isFound;
  }
}

