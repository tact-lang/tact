struct Foo {
  a: Int;
}

struct Bar {
  x: Foo?;
}

contract OptNested {
  y: Bar?;

  init() {
    self.y = Bar{x: Foo{a: 5}};
  }
}