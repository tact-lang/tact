struct Foo {
  i: Int;
}

struct Bar {
  f: Foo;
}

struct Baz {
  b: Bar;
}

contract TestContract {
    nested: Baz = Baz{b: Bar{f: Foo{i: 100}}};
}