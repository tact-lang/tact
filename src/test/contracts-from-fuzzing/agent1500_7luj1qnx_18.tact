struct Foo {
  a: Int;
}

contract BigList {
  f0: Foo;
  f1: Foo;
  f2: Foo;
  f3: Foo;
  f4: Foo;
  f5: Foo;
  f6: Foo;
  f7: Foo;
  f8: Foo;
  f9: Foo;

  init() {
    self.f0 = Foo{a:0};
    self.f1 = Foo{a:1};
    self.f2 = Foo{a:2};
    self.f3 = Foo{a:3};
    self.f4 = Foo{a:4};
    self.f5 = Foo{a:5};
    self.f6 = Foo{a:6};
    self.f7 = Foo{a:7};
    self.f8 = Foo{a:8};
    self.f9 = Foo{a:9};
  }
}