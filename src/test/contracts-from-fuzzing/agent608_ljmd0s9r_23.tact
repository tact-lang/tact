const BASE: Int = 100;

struct ConstRefDefault {
  x: Int = BASE;
}

contract ConstStructDefaultTest {
  s: ConstRefDefault;

  init() {
    self.s = ConstRefDefault{};
  }
}
