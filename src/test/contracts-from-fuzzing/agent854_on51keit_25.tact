struct IntDefaults {
  a: Int = 0;
  b: Int = 1;
  c: Int = 2;
}

contract IntDefaultsContract {
  val: IntDefaults;

  init() {
    self.val = IntDefaults{};
  }
}