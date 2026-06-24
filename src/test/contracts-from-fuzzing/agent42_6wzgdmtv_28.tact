struct WithSerialization {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as int64;
  e: Int;
}

contract TestContract {
  s: WithSerialization;

  init() {
    self.s = WithSerialization{ a:255, b:-32000, c:999999999, d:-999999999, e:123456789 };
  }
}