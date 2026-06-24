struct A {
  x: Int;
  y: B;
}

struct B {
  z: Int;
}

contract AssignNested {
  storage: A;

  init() {
    self.storage = A{ x:1, y:B{z:2} };
  }
}