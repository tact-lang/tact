struct Foo { x: Int; }

struct Bar { x: Int; }

struct Container {
  foo: Foo;
  bar: Bar;
}

contract TestMultiStructs {
  state: Container;

  init() {
    self.state = Container {
      foo: Foo { x: 1 },
      bar: Bar { x: 2 }
    };
  }
}