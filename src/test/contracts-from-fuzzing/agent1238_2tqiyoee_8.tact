contract OptionalPrimitivesTest {
  valInt: Int?;
  valBool: Bool?;
  valStr: String?;

  init() {
    self.valInt = 42;
    self.valBool = null;
    self.valStr = "hello";
  }
}