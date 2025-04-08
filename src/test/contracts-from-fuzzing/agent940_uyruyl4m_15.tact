contract DefaultsAndInit {
  a: Int = 5;
  b: Int;

  init() {
    self.b = 7;
    self.a = 42;
  }
}
