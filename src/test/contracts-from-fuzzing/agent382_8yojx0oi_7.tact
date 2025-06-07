struct IntSerialization {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as uint32;
  d: Int as int64;
  e: Int as int257;
}

contract SerializationTest {
  data: IntSerialization;

  init() {
    self.data = IntSerialization{
      a: 1,
      b: 2,
      c: 3,
      d: 4,
      e: 5
    };
  }
}