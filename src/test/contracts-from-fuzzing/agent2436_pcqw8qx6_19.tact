struct Wrap {
  wrapped: Bool;
}

contract NullableWrap {
  val: Wrap?;

  init() {
    self.val = null;
  }
}