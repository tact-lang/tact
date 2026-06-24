struct Foo { x: Int; y: Int = 7; }

contract PartialInit {
  foo: Foo;

  init() {
    self.foo = Foo{ x: 42 };
  }
}
