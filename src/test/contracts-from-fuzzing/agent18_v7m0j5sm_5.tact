struct OptionalNest {
  inner: Int?;
  inner2: Int?;
}

contract OptionalPersistent {
  val: OptionalNest;

  init() {
    self.val = OptionalNest{ inner: null, inner2: 123 };
  }
}