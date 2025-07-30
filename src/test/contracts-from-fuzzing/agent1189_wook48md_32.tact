contract DefaultsWithInit {
  a: Int = 0;
  b: Bool = true;

  init() {
    self.a = 123;
    self.b = false;
  }
}