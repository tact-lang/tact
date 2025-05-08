struct LargeStruct {
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
  k: Int;
  l: Cell;
  m: Slice;
  n: Builder;
  o: Address;
}

contract ManyFields {
  big: LargeStruct;

  init() {
    self.big = LargeStruct{
      a: 1,
      b: true,
      c: "hello",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress(),
      h: null,
      i: null,
      j: "world",
      k: 42,
      l: emptyCell(),
      m: emptyCell().asSlice(),
      n: beginCell(),
      o: myAddress(),
    };
  }
}
