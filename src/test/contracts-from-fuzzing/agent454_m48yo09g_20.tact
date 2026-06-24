contract ContractDefaults {
  x: Int = 123;
  b: Bool = true;
  s: String = "hello";
  init() {
    self.x = 456;
    self.b = false;
    self.s = "world";
  }
}