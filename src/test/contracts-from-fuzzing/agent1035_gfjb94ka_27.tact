struct SerialDefaults {
  a: Int as int16 = -5;
  b: Int as uint8 = 250;
}

contract SerDefaultsTest {
  data: SerialDefaults = SerialDefaults{};
  init() {
    self.data = SerialDefaults{ a:-100, b:200 };
  }
  receive() {}
}