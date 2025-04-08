struct Packed {
  a: Int as uint8 = 1;
  b: Int as int8 = -1;
  c: Int as uint16 = 256;
  d: Int as int16 = -256;
  e: Int as uint32 = 65536;
  f: Int as int32 = -65536;
}

contract Test {
  p: Packed = Packed{};

  init() {
    self.p = Packed{};
  }

  receive() {}
}