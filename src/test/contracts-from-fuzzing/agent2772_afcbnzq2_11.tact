contract FieldsDefaults {
  a: Int = 10;
  b: Bool = true;
  s: String = "hi";

  init() {
    self.a = 42;
    self.b = false;
    self.s = "bye";
  }
}
