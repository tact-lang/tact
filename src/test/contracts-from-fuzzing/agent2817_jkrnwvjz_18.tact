struct InnerMost {
  innerVal: Int;
}

struct Middle {
  m: InnerMost;
}

struct OuterMost {
  o: Middle;
}

contract NestedChain {
  chain: OuterMost;

  init() {
    self.chain = OuterMost{ o: Middle{ m: InnerMost{ innerVal: 42 } } };
  }
}
