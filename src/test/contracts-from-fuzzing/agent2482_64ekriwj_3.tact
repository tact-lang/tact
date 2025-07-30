struct ManyFields {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: Cell?;
}

contract Test {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: true,
      c: myAddress(),
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: "hello",
      g: null,
      h: null,
      i: null,
      j: null,
    };
  }
}