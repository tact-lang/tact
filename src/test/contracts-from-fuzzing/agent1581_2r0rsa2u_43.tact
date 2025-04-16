struct A { x: Int; }
struct B { a: A; }

contract MissingAssign {
  s: B;

  init() {
    self.s = B{ a: A{ x: 7 } };
  }
}