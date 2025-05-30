struct ComplexStruct {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
  g: Int;
  h: Bool;
  i: String;
  j: Address;
  k: Cell;
  l: Slice;
}

contract HugeStructStorage {
  cs: ComplexStruct;

  init() {
    self.cs = ComplexStruct{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: 1,
      h: false,
      i: "t",
      j: myAddress(),
      k: emptyCell(),
      l: emptyCell().asSlice()
    };
  }
}