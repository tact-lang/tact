struct SignedRange {
  foo: Int as int4;
}

contract Int4Boundary {
  data: SignedRange;

  init() {
    self.data = SignedRange{foo:7};
  }
}