struct SerialTest {
  small: Int as uint8;
  large: Int as int257;
  negative: Int as int64;
}

contract Test15 {
  s: SerialTest;

  init() {
    self.s = SerialTest{
      small: 255, large: 12345678901234567890, negative: -1234567
    };
  }
}