struct Foo {
  a: Int as uint8;
  b: Int as int16;
}

struct Bar {
  foo1: Foo;
  foo2: Foo;
}

contract ManySerialize {
  data: Bar;

  init() {
    self.data = Bar{foo1: Foo{a:1,b:2}, foo2: Foo{a:3,b:4}};
  }
}