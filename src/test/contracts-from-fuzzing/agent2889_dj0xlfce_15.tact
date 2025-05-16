struct Inner { a: Int; }

contract OptionalInner {
  data: Inner?;

  init() {
    self.data = null;
  }
}