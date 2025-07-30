struct Foo {
  x: Int;
  y: Bool;
}

struct Bar {
  foo1: Foo;
  foo2: Foo;
  str: String;
  o: Foo?;
}

contract Complex {
  state: Bar;
  init() {
    self.state = Bar{
      foo1: Foo{ x: 1, y: true },
      foo2: Foo{ x: 2, y: false },
      str: "hi",
      o: null
    };
  }
}
