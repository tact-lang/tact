struct TestIntDefault {
  x: Int = 42;
  y: Int = -1;
}

contract WithIntDefaults {
  s: TestIntDefault;

  init() {
    self.s = TestIntDefault{};
  }
}