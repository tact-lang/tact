struct A { a: Int }
struct B { b: A }
struct C { c: B }

contract OptDeepNest {
  root: C?;
  init() {
    self.root = null;
  }
}