struct Foo {
  a: Int = 1;
  b: Bool = false;
  c: Int?;
}

struct Bar {
  x: Foo;
  y: Foo;
}

contract TestContract {
  s: Bar;

  init() {
    self.s = Bar{
      x: Foo{},
      y: Foo{ a:10, b:true, c:5 },
    };
  }
}