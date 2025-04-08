struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String;
  j: Int;
  k: String;
  l: Bool;
  m: Int;
}

contract TestContract {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a: 1,
      b: true,
      c: "hi",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: null,
      h: null,
      i: "hello",
      j: 42,
      k: "end",
      l: false,
      m: 7,
    };
  }
}