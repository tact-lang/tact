struct WideStruct {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Cell;
  h: Cell?;
  i: Slice;
  j: Slice?;
  k: Address;
  l: Address?;
}

contract WideFields {
  w: WideStruct;

  init() {
    self.w = WideStruct{
      a: 1,
      b: null,
      c: true,
      d: false,
      e: "abc",
      f: null,
      g: emptyCell(),
      h: null,
      i: emptyCell().asSlice(),
      j: null,
      k: myAddress(),
      l: null,
    };
  }
}
