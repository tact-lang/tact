struct InnerNested {
  alpha: Int;
  beta: Bool = true;
}

struct OuterNested {
  inner: InnerNested;
  gamma: String = "hey";
}

contract TestDeepNesting {
  nested: OuterNested;

  init() {
    self.nested = OuterNested{
      inner: InnerNested{ alpha: 123 },
    };
  }

  receive() {
    self.nested = OuterNested{
      inner: InnerNested{ alpha: 456 },
    };
  }
}