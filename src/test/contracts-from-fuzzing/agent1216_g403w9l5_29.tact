struct Foo {
  a: Int;
}

struct Bar {
  b: Int;
  foo: Foo;
}

struct Baz {
  bar: Bar;
  s: String;
}

contract DeepChain {
  e: Baz;

  init() {
    self.e = Baz{
      bar: Bar{b: 1, foo: Foo{a:42}},
      s: "hi"
    };
  }
}