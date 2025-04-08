struct SOrder {
  q: String;
  a: Int as uint8;
  b: Bool;
  c: Int;
  d: Address?;
}

contract FieldOrders {
  s: SOrder;

  init() {
    self.s = SOrder{
      q: "abc",
      a: 5,
      b: true,
      c: 7,
      d: null
    };
  }
}