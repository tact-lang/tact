struct A { n: Int; }
struct B { a: A; }
struct C { b: B; }
contract DeepChain {
  c: C;

  init() {
    self.c = C{ b: B{ a: A{ n: 42 } } };
  }
}