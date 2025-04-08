struct Nested {
  inner: InnerMost;
}

struct InnerMost {
  a: Int?;
  b: Bool;
}

contract OptionalInner {
  n: Nested?;

  init() {
    self.n = null;
  }
}