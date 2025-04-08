struct Inner {
  x: Int;
  y: String;
  flag: Bool?;
}

contract NestedOptionalContract {
  inner: Inner?;

  init() {
    self.inner = null;
  }
}