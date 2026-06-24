struct ManyDefaults {
  a: Int = 10;
  b: Bool = false;
  s: String = "hello";
}

contract DefaultsTest {
  data: ManyDefaults;

  init() {
    self.data = ManyDefaults{};
  }
}