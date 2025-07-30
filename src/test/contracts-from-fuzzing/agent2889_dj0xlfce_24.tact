struct A { v: Int; }
struct B { a: A; }
struct C { b: B; }

contract DeepChain {
  c: C;

  init() {
    self.c = C{ b: B{ a: A{ v: 1 } } };
  }
}