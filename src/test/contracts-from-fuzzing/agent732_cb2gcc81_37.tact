struct SerOrder {
  a: Int as uint8;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
}

contract SerOrderTest {
  s: SerOrder;

  init() {
    self.s = SerOrder{
      a:5,
      b:true,
      c:"x",
      d:myAddress(),
      e:emptyCell(),
      f:emptyCell().asSlice()
    };
  }
}