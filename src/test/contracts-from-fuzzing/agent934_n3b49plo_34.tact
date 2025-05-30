struct A { x: Int }
struct B { a: A }
struct C { b: B }
contract OptChain {
  data: C?;
  init() {
    self.data = null;
  }
}