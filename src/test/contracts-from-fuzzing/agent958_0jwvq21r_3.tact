struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Int?;
  f: Address;
  g: Slice;
  h: String;
  i: Bool;
  j: Address;
}

contract TestManyStructFields {
  x: ManyFields;

  init() {
    self.x = ManyFields{
      a: 1,
      b: false,
      c: "hi",
      d: emptyCell(),
      e: 42,
      f: myAddress(),
      g: emptyCell().asSlice(),
      h: "yo",
      i: true,
      j: myAddress(),
    };
  }
}
