struct InnerOpt {
  x: Int;
}

contract OptStructNull {
  inner: InnerOpt?;

  init() {
    self.inner = null;
  }
}
