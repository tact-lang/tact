struct ZeroDefaults {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
}

contract DefaultsTest {
  value: ZeroDefaults;

  init() {
    self.value = ZeroDefaults{};
  }
}