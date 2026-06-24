struct InnerNested {
  x: Int;
  y: Bool;
}

struct OuterNested {
  n: InnerNested;
  t: Int;
}

contract ContainsDoubleNested {
  data: OuterNested;

  init() {
    self.data = OuterNested{
      n: InnerNested{ x: 1, y: false },
      t: 42
    };
  }
}