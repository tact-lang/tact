struct NestedOpt {
  x: Int?;
  y: Bool?;
}

contract OptStructField {
  f: NestedOpt?;

  init() {
    self.f = null;
  }

  receive() {
    if (self.f != null) {
      let _ = self.f!!;
    }
  }
}