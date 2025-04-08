contract PersistentDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "abc";

  init() {
    self.a = 42;
    self.b = true;
    self.c = "xyz";
  }
}