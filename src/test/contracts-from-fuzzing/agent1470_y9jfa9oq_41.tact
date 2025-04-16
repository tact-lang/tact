struct Foo {
  a: Int;
}

struct Bar {
  foo: Foo?;
}

contract MissInit {
  bar: Bar;

  init() {
    self.bar = Bar{};
  }
}