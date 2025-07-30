struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
  h: Int?;
  i: Bool?;
  j: String;
}

contract Test {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: true,
      c: "hey",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress(),
      h: null,
      i: false,
      j: "done"
    };
  }
}
