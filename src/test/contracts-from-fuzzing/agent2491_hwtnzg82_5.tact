struct Foo {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
}

contract DiverseFields {
  val: Foo;

  init() {
    self.val = Foo{
      a: 1,
      b: true,
      c: "hello",
      d: myAddress(),
      e: emptyCell(),
      f: emptyCell().asSlice(),
    };
  }
}