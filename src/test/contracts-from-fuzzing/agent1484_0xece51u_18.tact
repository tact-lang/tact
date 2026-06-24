struct NestedA { x: Int; }
struct NestedB { n: NestedA; }

contract UpdateNestedField {
  f: NestedB;

  init() {
    self.f = NestedB{ n: NestedA{ x: 42 } };
  }

  receive() {
    self.f.n = NestedA{ x: 100 };
  }
}