struct Inner {
  a: Int;
  b: Bool;
}

contract DeeplyNested {
  outer: Inner;

  init() {
    self.outer = Inner{a: 1, b: true};
  }
}