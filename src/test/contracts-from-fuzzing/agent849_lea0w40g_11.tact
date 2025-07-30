struct Inner {
  val: Int;
}

contract OptionalNested {
  optInner: Inner?;

  init() {
    self.optInner = null;
  }
}