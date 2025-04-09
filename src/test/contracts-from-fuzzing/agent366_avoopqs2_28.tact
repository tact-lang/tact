struct ManyOptDefaults {
  i1: Int? = null;
  i2: Int? = null;
  s1: String? = null;
  s2: String? = null;
  b1: Bool? = null;
  b2: Bool? = null;
}

contract ManyOptDefaultsTest {
  val: ManyOptDefaults;
  init() {
    self.val = ManyOptDefaults{};
  }
}