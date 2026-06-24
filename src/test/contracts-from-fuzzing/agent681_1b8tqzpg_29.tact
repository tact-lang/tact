struct Bar {
  val: Int;
}

struct Foo {
  bar: Bar?;
}

contract NestedOptField {
  f: Foo;

  init() {
    self.f = Foo{ bar: null };
  }
}