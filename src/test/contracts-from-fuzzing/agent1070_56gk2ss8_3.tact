struct TestStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
  h: Bool?;
  i: Int?;
  j: String?;
}

contract Variety {
  s: TestStruct;

  init() {
    self.s = TestStruct{
      a: 1,
      b: true,
      c: "hi",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress(),
      h: null,
      i: null,
      j: null
    };
  }
}