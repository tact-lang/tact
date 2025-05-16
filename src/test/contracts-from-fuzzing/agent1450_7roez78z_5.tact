struct WithDefaults {
  flag: Bool = false;
  count: Int = 0;
  text: String = "";
}

contract StructDefaultsTest {
  item: WithDefaults;

  init() {
    self.item = WithDefaults{};
  }
}