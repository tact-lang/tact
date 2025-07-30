struct Wide {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: Cell;
  h: Cell?;
  i: Slice;
  j: Slice?;
  k: String;
  l: String?;
}

contract WidePrimitives {
  store: Wide;

  init() {
    self.store = Wide{
      a: 1,
      b: null,
      c: true,
      d: null,
      e: myAddress(),
      f: null,
      g: emptyCell(),
      h: null,
      i: emptyCell().asSlice(),
      j: null,
      k: "hi",
      l: null,
    };
  }
}
