struct BigStruct {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Cell;
  f: Slice;
  g: String;
  h: Bool?;
  i: Int?;
  j: Cell?;
  k: Slice?;
  l: Address?;
  m: String?;
}

contract ManyFields {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a: 1,
      b: true,
      c: myAddress(),
      d: "test",
      e: emptyCell(),
      f: emptyCell().asSlice(),
      g: "more",
      h: null,
      i: 2,
      j: null,
      k: null,
      l: null,
      m: null,
    };
  }
}