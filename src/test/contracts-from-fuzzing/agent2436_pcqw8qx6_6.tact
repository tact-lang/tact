struct OptionalStruct {
  x: Int;
  y: Bool;
}

contract Container {
  inner: OptionalStruct?;

  init() {
    self.inner = null;
  }
}