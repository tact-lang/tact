struct OuterMost {
  deep: Int;
}

struct MiddleLayer {
  inner: OuterMost;
}

contract FinalTest {
  nested: MiddleLayer?;

  init() {
    self.nested = null;
  }
}