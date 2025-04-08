struct WeirdDefaults {
  a: Int = 1;
  b: Bool? = null;
  c: String? = "hi";
}

contract WeirdTest {
  stuff: WeirdDefaults;
  init() {
    self.stuff = WeirdDefaults{};
  }
}