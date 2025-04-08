struct A {
  x: Int;
  y: Bool?;
}

contract ManyPersistent {
  foo: A;
  bar: A;
  baz: A;

  init() {
    self.foo = A{x:1,y:true};
    self.bar = A{x:2,y:null};
    self.baz = A{x:3,y:false};
  }
}