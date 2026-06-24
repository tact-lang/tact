struct OptionalComplex {
  a: Int?;
  b: Bool?;
  c: Slice?;
}

contract OptionalFieldsPersist {
  v: OptionalComplex;

  init() {
    self.v = OptionalComplex{a: null, b: null, c: null};
  }

  receive() {
    if (self.v.a != null) {
      let _ = self.v.a!!;
    }
  }
}