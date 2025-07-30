struct BoolOptDefaults {
  flag: Bool? = false;
}

contract BoolOptDefaultTest {
  val: BoolOptDefaults;
  init() {
    self.val = BoolOptDefaults{};
  }
}