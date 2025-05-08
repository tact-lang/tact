struct SerialOrder {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint12;
  d: Int as int16;
  e: Int as uint3;
}

contract SerialOrderTest {
  val: SerialOrder;
  init() {
    self.val = SerialOrder{
      a: 5,
      b: -7,
      c: 100,
      d: -2000,
      e: 2
    };
  }
}