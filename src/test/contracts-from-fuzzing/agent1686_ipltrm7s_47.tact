struct SignedRangeNeg {
  foo: Int as int4;
}

contract Int4BoundaryNeg {
  data: SignedRangeNeg;

  init() {
    self.data = SignedRangeNeg{foo:-8};
  }
}