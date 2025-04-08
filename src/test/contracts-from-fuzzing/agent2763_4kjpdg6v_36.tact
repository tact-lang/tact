struct IntDefaults {
  a: Int = 10;
  b: Int = 20;
  c: Int = 30;
}

contract IntDefaultsContract {
  x: IntDefaults;

  init() {
    self.x = IntDefaults{};
  }
}