struct Inner {
  x: Int;
}
contract NullableInner {
  data: Inner?;
  init() {
    self.data = Inner{x:42};
  }
}