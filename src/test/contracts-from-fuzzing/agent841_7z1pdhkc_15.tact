struct Ranges {
  u4: Int as uint4;
  u8: Int as uint8;
  u16: Int as uint16;
  i8: Int as int8;
  i16: Int as int16;
}

contract TestContract {
  rng: Ranges;
  
  init() {
    self.rng = Ranges{
      u4: 15,
      u8: 255,
      u16: 65535,
      i8: -128,
      i16: -32768,
    };
  }
}
