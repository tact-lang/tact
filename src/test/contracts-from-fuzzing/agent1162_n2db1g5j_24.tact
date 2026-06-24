struct Foo {
  x: Int;
}

contract ManyStructFields {
  f1: Foo; f2: Foo; f3: Foo; f4: Foo; f5: Foo;

  init() {
    self.f1 = Foo{x:1};
    self.f2 = Foo{x:2};
    self.f3 = Foo{x:3};
    self.f4 = Foo{x:4};
    self.f5 = Foo{x:5};
  }
}