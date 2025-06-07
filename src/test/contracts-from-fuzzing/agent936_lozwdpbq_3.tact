struct ManyFields {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: String;
  f: Cell;
  g: Slice;
  h: Address;
  i: Int?;
  j: Bool?;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: true,
      c: 2,
      d: false,
      e: "test",
      f: emptyCell(),
      g: emptyCell().asSlice(),
      h: myAddress(),
      i: null,
      j: null,
    };
  }
}
