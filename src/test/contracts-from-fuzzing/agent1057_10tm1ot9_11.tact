struct ManyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
}

contract MultiPrim {
  state: ManyPrimitives;

  init() {
    self.state = ManyPrimitives{
      a:10,
      b:true,
      c:"abc",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress()
    };
  }
}