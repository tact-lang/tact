struct Foo {
  i: Int = 1;
}

struct Bar {
  fooOpt: Foo? = Foo{ i: 42 };
}

contract OptDefaultField {
  bar: Bar;

  init() {
    self.bar = Bar{};
  }
}