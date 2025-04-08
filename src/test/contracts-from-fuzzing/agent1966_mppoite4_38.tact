struct Foo {
  x: Int as int16;
  y: Int as uint32;
}

struct Bar {
  a: Int as int256;
  b: Int as uint256;
}

struct Baz {
  foo: Foo;
  bar: Bar;
}

contract NestedSerialization {
  data: Baz;

  init() {
    self.data = Baz{
      foo: Foo{ x: -12, y: 777 },
      bar: Bar{ a: -999, b: 999 }
    };
  }
}
