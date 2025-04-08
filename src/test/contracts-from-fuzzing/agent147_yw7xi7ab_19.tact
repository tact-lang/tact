struct A { i: Int; }
struct B { a: A; j: Int; }
struct C { b: B; k: Int; }
contract DeepChain {
  val: C;
  init() {
    self.val = C{ b: B{ a: A{ i:1 }, j:2 }, k:3 };
  }
}