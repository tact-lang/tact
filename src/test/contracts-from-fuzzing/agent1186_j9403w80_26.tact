contract ComplexDefaults {
  a: Int = 4;
  b: Bool? = null;
  c: String = "foo";
  d: Address? = null;

  init() {
    self.a = 123;
    self.b = true;
    self.c = "bar";
    self.d = myAddress();
  }
}
