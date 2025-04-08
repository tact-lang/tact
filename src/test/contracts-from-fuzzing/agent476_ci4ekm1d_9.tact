struct Bar {
  value: Int;
}

struct Foo {
  optionalBar: Bar?;
}

contract NestedOptionalInStruct {
  foo: Foo;

  init() {
    self.foo = Foo{ optionalBar: null };
  }

  receive() {
    if (self.foo.optionalBar != null) {
      let _ = self.foo.optionalBar!!;
    }
  }
}