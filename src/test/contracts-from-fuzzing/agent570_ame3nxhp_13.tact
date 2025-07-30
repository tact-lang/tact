struct Bar {
  x: Int;
}

struct Foo {
  barOpt: Bar? = Bar{ x: 7 };
}

contract Test {
  f: Foo;

  init() {
    self.f = Foo{};
  }
}