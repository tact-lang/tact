struct InnerMost {
  q: Int;
  r: Bool;
}

struct MiddleOpt {
  m: Int?;
  inner: InnerMost?;
}

contract NestedOptionalComplex {
  complex: MiddleOpt?;

  init() {
    self.complex = MiddleOpt{ m: null, inner: InnerMost{ q: 7, r: false } };
  }
}