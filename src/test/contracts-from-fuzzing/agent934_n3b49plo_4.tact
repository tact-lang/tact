struct S {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Builder;
}

contract Test {
  data: S;
  init() {
    self.data = S{
      a: 7,
      b: true,
      c: "hello",
      d: myAddress(),
      e: emptyCell(),
      f: emptyCell().asSlice(),
      g: beginCell()
    };
  }
}