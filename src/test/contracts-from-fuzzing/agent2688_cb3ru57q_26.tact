struct IntSer {
  a: Int as uint1;
  b: Int as uint8;
  c: Int as int4;
  d: Int as int64;
}

contract SerializationTest {
  data: IntSer;

  init() {
    self.data = IntSer{ a: 1, b: 255, c: -3, d: 123456 };
  }
}