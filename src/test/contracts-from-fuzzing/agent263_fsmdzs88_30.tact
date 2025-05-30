contract DefaultsVsAssigned {
  a: Int = 10;
  b: Bool;

  init() {
    self.b = true;
    self.a = 42;
  }
}