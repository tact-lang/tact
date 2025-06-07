struct BigStruct {
  a: Int;
  b: Bool;
  c: Cell;
  d: Slice;
  e: String;
  f: Address;
  g: Int?;
  h: Bool?;
  i: Slice?;
  j: String?;
  k: Cell?;
  l: Address?;
}

contract TestManyFields {
  state: BigStruct;

  init() {
    self.state = BigStruct{
      a: 1,
      b: true,
      c: emptyCell(),
      d: emptyCell().asSlice(),
      e: "hello",
      f: myAddress(),
      g: 2,
      h: false,
      i: null,
      j: null,
      k: null,
      l: null,
    };
  }
}