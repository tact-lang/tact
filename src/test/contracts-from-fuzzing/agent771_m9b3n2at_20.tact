contract DefaultsVsUninit {
  a: Int;
  b: Int = 5;

  init() {
    self.a = 42;
    self.b = 10;
  }
}