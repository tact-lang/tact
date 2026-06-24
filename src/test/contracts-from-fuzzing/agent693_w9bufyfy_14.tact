contract Test {
  u8_1: Int as uint8 = 1;
  u8_2: Int as uint8 = 2;
  i8_1: Int as int8 = -8;
  i8_2: Int as int8 = 8;
  u16: Int as uint16 = 123;
  i16: Int as int16 = -123;
  big: Int as int257 = 5555;
  maxu: Int as uint256 = 9999;

  init() {
    self.u8_1=10; self.u8_2=20; self.i8_1=-10; self.i8_2=10;
    self.u16=1000; self.i16=-1000; self.big=123456789;
    self.maxu=987654321;
  }

  receive() {}
}