struct LargerStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Builder;
  f: Slice;
  g: Address;
  h: Int?;
}

contract ComplexTypesTest {
  content: LargerStruct;

  init() {
    self.content = LargerStruct{
      a: 1,
      b: false,
      c: "hi",
      d: emptyCell(),
      e: beginCell(),
      f: emptyCell().asSlice(),
      g: myAddress(),
      h: null
    };
  }
}