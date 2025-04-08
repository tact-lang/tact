struct Foo {
  a: Int;
  b: Int?;
}

struct Bar {
  c: Foo;
  d: Bool;
}

struct Baz {
  e: Bar;
  f: Int;
}

contract MixedNest {
  x: Baz;
  y: Bool;

  init() {
    self.x = Baz{
      e: Bar{
        c: Foo{a:1, b:null},
        d: true
      },
      f: 42
    };
    self.y = false;
  }
}