struct OptionalLarge {
  s: String?;
  i: Int?;
  b: Bool?;
}

contract NestedOptLarge {
  inner: OptionalLarge?;
  init() {
    self.inner = null;
  }
}