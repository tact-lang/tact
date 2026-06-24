struct SInner {
  v: Int;
}

contract OptionalStructField {
  s: SInner?;

  init() {
    self.s = null;
  }

  receive() {
    if (self.s != null) {
      let _ = self.s!!;
    }
  }
}