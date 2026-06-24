struct A {
  foo: Int;
  bar: Bool?
}

struct B {
  foo: Int;
  bar: Bool?;
}

contract ManyStructsTest {
  x: A;
  y: B;
  z: A;

  init() {
    self.x = A{foo:1, bar:null};
    self.y = B{foo:2, bar:true};
    self.z = A{foo:3, bar:null};
  }
}