struct Foo { x: Int; }

contract FieldChangeOrder {
  foo1: Foo;
  foo2: Foo;

  init() {
    self.foo2 = Foo{ x: 10 };
    self.foo1 = Foo{ x: 20 };
  }
}
