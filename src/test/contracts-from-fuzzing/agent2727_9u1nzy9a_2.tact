struct Foo {
  x: Int;
}

struct Bar {
  foo: Foo;
}

struct Baz {
  bar: Bar;
}

contract DeepNestStructContract {
  x: Baz;

  init() {
    self.x = Baz { bar: Bar { foo: Foo { x: 1 } } };
  }
}