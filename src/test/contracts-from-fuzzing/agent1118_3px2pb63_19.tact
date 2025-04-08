struct IntSizes {
  a: Int as int8;
  b: Int as uint8;
  c: Int as int257;
}

contract IntSerializationTest {
  data: IntSizes;

  init() {
    self.data = IntSizes{
      a: 5,
      b: 250,
      c: 123456789012345678901234567890
    };
  }
}