contract ContractDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "test";

  init() {
    self.a = 10;
    self.b = false;
    self.c = "changed";
  }
}