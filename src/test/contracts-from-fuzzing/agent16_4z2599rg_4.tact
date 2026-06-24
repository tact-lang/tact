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
  j: String?;
  k: Cell;
  l: Slice;
  m: Builder;
  n: Address;
  o: Int;
}

contract Test {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: true,
      c: "hi",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress(),
      h: null,
      i: false,
      j: null,
      k: emptyCell(),
      l: emptyCell().asSlice(),
      m: beginCell(),
      n: myAddress(),
      o: -77
    };
  }
}