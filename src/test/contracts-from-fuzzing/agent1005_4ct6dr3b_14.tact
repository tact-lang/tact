struct EmptyOptWrap {
  val: Int?;
}

contract WrapOptional {
  inner: EmptyOptWrap?;

  init() {
    self.inner = null;
  }
}