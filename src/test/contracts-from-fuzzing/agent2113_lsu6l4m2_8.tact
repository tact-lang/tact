struct S {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;
}

contract DiverseTypes {
  field: S;

  init() {
    self.field = S{
      a: 1,
      b: true,
      c: "test",
      d: emptyCell().asSlice(),
      e: emptyCell(),
      f: myAddress()
    };
  }
}