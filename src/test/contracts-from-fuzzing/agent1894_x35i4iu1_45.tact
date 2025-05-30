struct Nested {
  inner: Int?;
}

contract OptionalNested {
  val: Nested?;
  init() {
    self.val = null;
  }
}