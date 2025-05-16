struct BigStruct {
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

contract Test {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      a: 1,
      b: null,
      c: true,
      d: null,
      e: "hello",
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