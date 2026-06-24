struct Foo {
  a: Int;
  b: Bool;
}

contract Test {
  bar: Foo = Foo{ a: 1, b: true };

  init() {}
}