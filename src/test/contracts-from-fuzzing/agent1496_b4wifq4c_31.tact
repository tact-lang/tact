struct IntsPacked {
  tiny: Int as uint3;
  small: Int as uint8;
  med: Int as int16;
}

contract PackedStructTest {
  data: IntsPacked;

  init() {
    self.data = IntsPacked{tiny:7, small:255, med:-12345};
  }
}