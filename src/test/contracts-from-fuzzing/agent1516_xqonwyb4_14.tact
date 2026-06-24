struct Foo {
  a: Int;
  b: Bool;
}

struct Bar {
  foo: Foo;
  s: String?;
}

contract NestedOptionalField {
  bar: Bar;

  init() {
    self.bar = Bar{
      foo: Foo{ a: 99, b: false },
      s: null
    };
  }
}