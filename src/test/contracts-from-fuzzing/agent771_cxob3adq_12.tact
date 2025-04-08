struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

contract ManyStructs {
  a: A = A{ x: 1 };
  b: B = B{ y: 2 };
  c: C = C{ z: 3 };

  init() {
    self.a = A{ x: 11 };
    self.b = B{ y: 22 };
    self.c = C{ z: 33 };
  }
}