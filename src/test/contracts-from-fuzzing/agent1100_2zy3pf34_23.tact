struct SerialOrder {
  a: Int as int8;
  b: Int as uint64;
  c: Bool;
  d: String;
  e: Slice;
}

contract SerialTest {
  f: SerialOrder;

  init() {
    self.f = SerialOrder{
      a: -5,
      b: 123456789,
      c: true,
      d: "abc",
      e: emptyCell().asSlice()
    };
  }
}
