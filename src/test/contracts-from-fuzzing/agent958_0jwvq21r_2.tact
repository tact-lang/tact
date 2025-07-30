struct InnerNested {
  z: Bool;
  q: Int?;
}

struct Nested {
  x: Int;
  y: InnerNested;
}

contract TestNestedStructs {
  s: Nested;

  init() {
    self.s = Nested{
      x: 99,
      y: InnerNested{
        z: true,
        q: null,
      },
    };
  }
}
