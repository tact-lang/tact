struct SInner {
  s: String?;
}

contract OptionalStringInside {
  inner: SInner?;

  init() {
    self.inner = SInner{ s: null };
  }
}