struct SDefault {
  x: Int = 1;
  y: Int = 2;
  flag: Bool = true;
}

contract DefaultsTest {
  a: SDefault;
  init() {
    self.a = SDefault{}; // rely on defaults
  }
}