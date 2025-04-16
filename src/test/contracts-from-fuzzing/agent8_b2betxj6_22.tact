struct LongDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
  e: Int = 5;
}

contract LongDefaultsTest {
  data: LongDefaults;

  init() {
    self.data = LongDefaults{};
  }
}