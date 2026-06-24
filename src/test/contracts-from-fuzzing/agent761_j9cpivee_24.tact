struct NestedA { x: Int }
struct NestedB { y: Int? }
struct NestedC { z: Bool }

struct Combined {
  a: NestedA?;
  b: NestedB;
  c: NestedC?;
}

contract OptionalNestedStructs {
  data: Combined;

  init() {
    self.data = Combined{
      a: null,
      b: NestedB{ y: 42 },
      c: null,
    };
  }
}