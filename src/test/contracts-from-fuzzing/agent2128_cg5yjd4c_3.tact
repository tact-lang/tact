struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: Address?;
}

contract WideStructStorage {
  stuff: ManyFields;

  init() {
    self.stuff = ManyFields{
      a: 1,
      b: false,
      c: "abc",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: null,
      h: null,
      i: null
    };
  }
}