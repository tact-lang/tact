struct WideFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Builder;
  h: String;
  i: Bool;
  j: Int;
}

contract WideStructContract {
  complex: WideFields;

  init() {
    self.complex = WideFields{
      a: 1,
      b: true,
      c: "test",
      d: myAddress(),
      e: emptyCell(),
      f: emptyCell().asSlice(),
      g: beginCell(),
      h: "hello",
      i: false,
      j: -5
    };
  }
}
