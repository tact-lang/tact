struct SerialOrder {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as uint12;
  d: Int as uint32;
}

contract OrderTest {
  so: SerialOrder;

  init() {
    self.so = SerialOrder{ a:1, b:2, c:3, d:4 };
  }
}