struct SerializationWidths {
  small: Int as uint4;
  medium: Int as uint16;
  large: Int as uint128;
  full: Int;
}

contract WidthTest {
  data: SerializationWidths;

  init() {
    self.data = SerializationWidths{
      small: 3,
      medium: 1000,
      large: 1000000,
      full: 12345678901234567890
    };
  }
}
