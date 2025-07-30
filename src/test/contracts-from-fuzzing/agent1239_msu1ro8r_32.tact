struct OptWrap {
  inner: Int?;
}

contract OptWrapContract {
  val: OptWrap?;

  init() {
    self.val = OptWrap { inner: null };
  }
}