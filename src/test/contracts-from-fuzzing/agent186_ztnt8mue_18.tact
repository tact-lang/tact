// Persistent fields with default optional values
contract TestContract {
  optInt: Int? = null;
  optBool: Bool? = null;
  optStr: String? = null;

  init() {
    self.optInt = 5;
    self.optBool = true;
    self.optStr = "abc";
  }
}