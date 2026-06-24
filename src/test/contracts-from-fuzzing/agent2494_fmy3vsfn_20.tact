struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }

contract Target {
  f: C;

  init() {
    self.f = C{b: B{a: A{x: 123}}};
  }
}