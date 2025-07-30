struct Inner {
  val: Int;
  flag: Bool;
}

contract NestedStructField {
  inner: Inner;

  init() {
    self.inner = Inner{ val: 1, flag: true };
  }
}