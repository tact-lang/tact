struct A { x: Int; }
struct B { m: A?; }

contract OptionalNestedOpt {
  s: B;

  init() {
    self.s = B{ m: null };
  }
}