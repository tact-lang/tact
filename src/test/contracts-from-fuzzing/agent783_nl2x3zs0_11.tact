struct MixedWidths {
  a: Int as int64;
  b: Int as uint32;
  c: Int as int257;
  d: Int as uint8;
}

contract SerialWidths {
  val: MixedWidths;

  init() {
    self.val = MixedWidths{
      a: -1000,
      b: 123456,
      c: 98765432109876543210987654321,
      d: 255
    };
  }
}