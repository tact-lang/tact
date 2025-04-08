struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }

contract Sequence {
  s: C;

  init() {
    self.s = C { b: B { a: A { x: 42 } } };
  }
}