struct Foo {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: String?;
  h: Int?;
  i: Address?;
}

contract MixedFields {
  f: Foo;

  init() {
    self.f = Foo{
      a: 1,
      b: true,
      c: "test",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: null,
      h: null,
      i: null,
    };
  }
}