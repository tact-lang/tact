struct NullableDeep {
  x: InnerDeep?;
}

struct InnerDeep {
  y: InnerMost?;
}

struct InnerMost {
  val: Int?;
}

contract Test {
  v: NullableDeep;
  init() {
    self.v = NullableDeep{x: null};
  }
}