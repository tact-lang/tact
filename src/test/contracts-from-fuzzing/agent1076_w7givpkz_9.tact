struct Foo {
  a: Int;
  b: Int?;
  c: Bool;
}

struct Bar {
  d: Bool;
  e: Foo?;
}

contract NestedOptionals {
  state: Bar;

  init() {
    self.state = Bar{d: true, e: null};
  }

  receive() {
    self.state = Bar{d:false, e:Foo{a:1, b:null, c:true}};
  }
}
