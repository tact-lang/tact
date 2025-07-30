struct ManyPrimitives {
  i: Int;
  b: Bool;
  a: Address;
  c1: Cell;
  s: Slice;
  str: String;
}

contract PrimTest {
  vals: ManyPrimitives;
  init() {
    self.vals = ManyPrimitives{
      i: 1,
      b: true,
      a: myAddress(),
      c1: emptyCell(),
      s: emptyCell().asSlice(),
      str: "hello"
    };
  }
}