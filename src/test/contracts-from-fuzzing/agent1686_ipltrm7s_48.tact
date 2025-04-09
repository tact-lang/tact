struct SignedRangeFail {
  foo: Int as int4;
}

contract Int4OutOfRange {
  data: SignedRangeFail;

  init() {
    self.data = SignedRangeFail{foo:8};
  }
}