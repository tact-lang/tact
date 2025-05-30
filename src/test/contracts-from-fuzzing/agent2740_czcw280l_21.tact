struct A { x: Int; }
struct B { a: A; }

contract FieldOrdering {
  b: B;
  a: A;

  init() {
    self.a = A{ x: 1 };
    self.b = B{ a: A{ x: 2 } };
  }
}