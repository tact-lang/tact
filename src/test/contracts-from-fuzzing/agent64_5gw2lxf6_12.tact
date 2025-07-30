struct OptionalNested {
  foo: Foo?;
}

struct Foo {
  bar: Bar?;
}

struct Bar {
  x: Int;
}

contract TestContract {
  item: OptionalNested;

  init() {
    self.item = OptionalNested{ foo: null };
  }
}