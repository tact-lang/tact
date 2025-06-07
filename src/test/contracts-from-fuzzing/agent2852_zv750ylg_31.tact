struct A { x:Int; }
struct B { y:A; }
struct C { z:B; }
contract ManyLevels {
  m: C;

  init() {
    self.m = C{ z:B{ y:A{ x:42 } } };
  }
}