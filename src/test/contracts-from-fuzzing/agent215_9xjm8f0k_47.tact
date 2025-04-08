struct Foo {
  x: Int;
}

struct Bar {
  foo: Foo;
}

contract DoubleWrap {
  val: Bar;

  init() {
    self.val = Bar{foo: Foo{x: 123}};
  }
}