contract DefaultValueTest {
  a: Int = 11;
  b: Bool = true;
  optionalInt: Int? = null;
  optionalBool: Bool? = false;

  init() {
    self.a = 42;
    self.b = false;
    self.optionalInt = 123;
    self.optionalBool = true;
  }
}