struct SerialDefaults {
  a: Int as uint8 = 1;
  b: Int as uint16 = 2;
  c: Int as uint32 = 3;
  d: Int as uint64 = 4;
  e: Int as uint128 = 5;
}

contract SerialDefaultsWrap {
  f: SerialDefaults;
  init() {
    self.f = SerialDefaults{};
  }
}
