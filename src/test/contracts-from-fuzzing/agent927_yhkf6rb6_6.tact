struct SerialTest {
  big: Int as int256;
  small: Int as uint8;
  normal: Int;
}

contract SerializationContract {
  data: SerialTest;

  init() {
    self.data = SerialTest{
      big: 123456789,
      small: 255,
      normal: -42
    };
  }
}