struct Foo {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
}

contract AllFieldTypes {
  bar: Foo;

  init() {
    self.bar = Foo{
      a: 10,
      b: true,
      c: "test",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress()
    };
  }
}
