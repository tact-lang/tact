struct Bits {
  a: Int as uint1;
  b: Int as uint8;
  c: Int as int16;
}

contract BitSizes {
  field: Bits;

  init() {
    self.field = Bits{ a:1, b:255, c:-123 };
  }
}
