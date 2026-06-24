struct InnerNested {
  a: Int;
  b: Bool;
}

struct OuterNested {
  x: Int;
  y: InnerNested;
  z: Bool?;
}

contract TestContract {
  data: OuterNested;

  init() {
    self.data = OuterNested{
      x: 42,
      y: InnerNested{ a: 1, b: true },
      z: null,
    };
  }
}