struct Foo {
  a: Int;
}

struct Bar {
  foo: Foo? = Foo{ a: 1 };
}

contract OverwriteDefaultOptional {
  storage: Bar;

  init() {
    self.storage = Bar{ foo: null };
  }
}