struct DefaultsWithSerialization {
  i1: Int as uint32 = 123;
  i2: Int as int8 = -7;
}

contract DefaultsSerializedTest {
  val: DefaultsWithSerialization;

  init() {
    self.val = DefaultsWithSerialization{};
  }
}