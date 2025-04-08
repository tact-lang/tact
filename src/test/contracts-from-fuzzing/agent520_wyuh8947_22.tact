// test contract with string fields with defaults
contract StringDefaults {
  a: String = "x";
  b: String = "y";

  init() {
    self.a = "x";
    self.b = "y";
  }
}