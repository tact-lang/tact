struct Foo { x: Int; }
struct Bar { y: Bool; }

contract MultiInitNested {
  foo: Foo;
  bar: Bar;

  init() {
    self.foo = Foo{ x: 42 };
    self.bar = Bar{ y: true };
  }
}
