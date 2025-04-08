struct Compact {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as uint32;
  d: Int as uint64;
}

contract SerializationTest {
  s: Compact;

  init() {
    self.s = Compact{ a:5, b:300, c:70000, d:10000000 };
  }
}