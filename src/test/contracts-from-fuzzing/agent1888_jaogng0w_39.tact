struct OptionalLayer {
  val: Int?;
}

contract OptionalWrapExplicit {
  inner: OptionalLayer?;

  init() {
    self.inner = null;
  }
}
