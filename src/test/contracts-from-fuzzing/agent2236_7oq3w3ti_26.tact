struct SInner {
  a: Int;
}

contract OptionalStruct {
  inner: SInner?;

  init() {
    self.inner = null;
  }
}