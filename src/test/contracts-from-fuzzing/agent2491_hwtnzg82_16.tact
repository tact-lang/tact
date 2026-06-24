struct Inner {
  val: Int?;
}

contract NestedNull {
  inner: Inner?;

  init() {
    self.inner = Inner{val: null};
  }
}