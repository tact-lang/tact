struct UintLimited {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as uint16;
  d: Int as uint32;
  e: Int as uint64;
}

contract UintSerializationTest {
  storage: UintLimited;

  init() {
    self.storage = UintLimited{
      a: 5,
      b: 100,
      c: 1000,
      d: 100000,
      e: 10000000000,
    };
  }
}