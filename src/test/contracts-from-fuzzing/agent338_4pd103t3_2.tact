struct DeepNest {
  a: Int?;
  b: Int?;
  c: Int?;
}

struct OuterNest {
  alpha: DeepNest;
  beta: Int;
}

contract TestContract {
  nest: OuterNest;

  init() {
    self.nest = OuterNest{
      alpha: DeepNest{ a: null, b: null, c: null },
      beta: 42
    };
  }
}