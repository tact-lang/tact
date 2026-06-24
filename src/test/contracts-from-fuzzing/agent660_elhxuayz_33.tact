struct SerialOrder {
  a: Int = 1;
  b: Int?;
  c: Int as uint16;
  d: Int as uint32;
}

contract SerialOrderTest {
  val: SerialOrder;

  init() {
    self.val = SerialOrder{
      b: null,
      c: 10,
      d: 20,
    };
  }
}