struct Inner {
  x: Int;
}

contract OptEmbedded {
  inner: Inner?;

  init() {
    self.inner = null;
  }
}